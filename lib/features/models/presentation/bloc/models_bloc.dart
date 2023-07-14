import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../domain/usecases/delete_model.dart';
import '../../../../core/domain/entities/manufacturer.dart';
import '../../../../core/domain/entities/model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/filters.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/models_response.dart';
import '../../domain/usecases/get_models.dart';

part 'models_event.dart';
part 'models_state.dart';
part 'models_bloc.freezed.dart';

class ModelsBloc extends Bloc<ModelsEvent, ModelsState> {
  ModelsBloc({
    required GetModels getModelsUsecase,
    required DeleteModel deleteModelUsecase,
  })  : _getModelsUsecase = getModelsUsecase,
        _deleteModelUsecase = deleteModelUsecase,
        super(const ModelsState()) {
    on<_Initial>(_initial);
    on<_Refresh>(_refresh);
    on<_SearchModels>(_searchModels,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 300))
            .switchMap(mapper));
    on<_GetNextModels>(_getNextModels);
    on<_UpdateModelInList>(_updateModelInList);
    on<_SetManufacturer>(_setManufacturer);
    on<_DeleteModel>(_deleteModel);
  }

  final GetModels _getModelsUsecase;
  final DeleteModel _deleteModelUsecase;

  FutureOr<void> _initial(_Initial event, Emitter<ModelsState> emit) async {
    emit(state.copyWith(
        status: ModelsStatus.loading, filter: const SimpleFilter()));
    final res = await _getModels();
    res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(state.copyWith(
            status: ModelsStatus.success, models: r.models, info: r.info)));
  }

  FutureOr<void> _refresh(_Refresh event, Emitter<ModelsState> emit) async {
    if (!state.isRefreshing) {
      emit(state.copyWith(status: ModelsStatus.refreshing));
      final res = await _getModels();
      res.fold(
          (failure) => _throwFailure(emit, failure),
          (r) => emit(state.copyWith(
              status: ModelsStatus.success, models: r.models, info: r.info)));
    }
  }

  void _searchModels(_SearchModels event, Emitter<ModelsState> emit) async {
    if (event.query != state.filter.query) {
      emit(state.copyWith(
          filter: state.filter.copyWith(query: event.query, page: 1),
          status: ModelsStatus.refreshing));
      final res = await _getModels();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(
          state.copyWith(
            status: ModelsStatus.success,
            info: r.info,
            models: r.models,
          ),
        ),
      );
    }
  }

  FutureOr<void> _getNextModels(
      _GetNextModels event, Emitter<ModelsState> emit) async {
    if (!state.isLastPage && !state.isPaginating && !state.isRefreshing) {
      emit(state.copyWith(
          status: ModelsStatus.loading,
          filter: state.filter.copyWith(page: state.filter.page + 1)));
      final res = await _getModels();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) {
          emit(
            state.copyWith(
              status: ModelsStatus.success,
              info: r.info,
              models: [...state.models, ...r.models],
            ),
          );
        },
      );
    }
  }

  void _updateModelInList(_UpdateModelInList event, Emitter<ModelsState> emit) {
    final List<Model> models = [...state.models];
    final int index =
        models.indexWhere((manufacturer) => manufacturer.id == event.model.id);
    if (index != -1) {
      models[index] = event.model;
      emit(state.copyWith(models: models));
    }
  }

  void _setManufacturer(
      _SetManufacturer event, Emitter<ModelsState> emit) async {
    if (event.manufacturer == null) {
      await Future.delayed(const Duration(milliseconds: 300));
      emit(const ModelsState());
    } else {
      emit(state.copyWith(manufacturer: event.manufacturer));
    }
  }

  FutureOr<void> _deleteModel(
      _DeleteModel event, Emitter<ModelsState> emit) async {
    final List<Model> models = [...state.models];
    final int modelIndex = models.indexOf(event.model);
    models.removeAt(modelIndex);
    emit(state.copyWith(models: models));
    final res =
        await _deleteModelUsecase.call(DeleteModelParams(id: event.model.id));
    res.fold((failure) {
      models.insert(modelIndex, event.model);
      emit(state.copyWith(models: models));
      _throwFailure(emit, failure);
    }, (r) => null);
  }

  FutureEither<ModelsResponse> _getModels() async =>
      await _getModelsUsecase.call(GetModelsParams(
        manufacturerId: state.manufacturer?.id ?? '',
        page: state.filter.page,
        limit: state.filter.limit,
        query: state.filter.query,
      ));

  void _throwFailure(Emitter<ModelsState> emit, Failure failure) {
    emit(state.copyWith(status: ModelsStatus.failure, failure: failure));
    emit(state.copyWith(
        status: ModelsStatus.initial, failure: const CasualFailure()));
  }
}
