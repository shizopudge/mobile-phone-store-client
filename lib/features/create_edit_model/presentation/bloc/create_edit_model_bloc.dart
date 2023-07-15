import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/domain/entities/model.dart';
import '../../../../core/failure/failure.dart';
import '../../../models/presentation/bloc/models_bloc.dart';
import '../../domain/usecases/create_model.dart';
import '../../domain/usecases/edit_model.dart';

part 'create_edit_model_event.dart';
part 'create_edit_model_state.dart';
part 'create_edit_model_bloc.freezed.dart';

class CreateEditModelBloc
    extends Bloc<CreateEditModelEvent, CreateEditModelState> {
  CreateEditModelBloc({
    required ModelsBloc modelsBloc,
    required CreateModel createModelUsecase,
    required EditModel editModelUsecase,
  })  : _modelsBloc = modelsBloc,
        _createModelUsecase = createModelUsecase,
        _editModelUsecase = editModelUsecase,
        super(const CreateEditModelState()) {
    on<_SetModel>(_setModel);
    on<_ChangeName>(_changeName);
    on<_ChangeDescription>(_changeDescription);
    on<_SetManufacturerId>(_setManufacturerId);
    on<_ChangePixelDensity>(_changePixelDensity);
    on<_ChangeScreenRefreshRate>(_changeScreenRefreshRate);
    on<_ChangeScreenDiagonal>(_changeScreenDiagonal);
    on<_ChangeWeight>(_changeWeight);
    on<_ChangeScreenResolution>(_changeScreenResolution);
    on<_ChangeOperatingSystem>(_changeOperatingSystem);
    on<_ChangeDisplayType>(_changeDisplayType);
    on<_ChangeWidth>(_changeWidth);
    on<_ChangeHeight>(_changeHeight);
    on<_CreateModel>(_createModel);
    on<_EditModel>(_editModel);
    on<_Reset>(_reset);
  }

  final ModelsBloc _modelsBloc;
  final CreateModel _createModelUsecase;
  final EditModel _editModelUsecase;

  void _setModel(_SetModel event, Emitter<CreateEditModelState> emit) => emit(
        state.copyWith(
          name: event.model.name,
          description: event.model.description,
          manufacturerId: event.model.manufacturer.id,
          pixelDensity: event.model.pixelDensity,
          screenRefreshRate: event.model.screenRefreshRate,
          screenDiagonal: event.model.screenDiagonal,
          weight: event.model.weight,
          screenResolution: event.model.screenResolution,
          operatingSystem: event.model.operatingSystem,
          displayType: event.model.displayType,
          model: event.model,
        ),
      );

  void _setManufacturerId(
          _SetManufacturerId event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(manufacturerId: event.manufacturerId));

  void _changeName(_ChangeName event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(name: event.name));

  void _changeDescription(
          _ChangeDescription event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(description: event.description));

  void _changePixelDensity(
          _ChangePixelDensity event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(pixelDensity: event.pixelDensity));

  void _changeScreenRefreshRate(
          _ChangeScreenRefreshRate event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(screenRefreshRate: event.screenRefreshRate));

  void _changeScreenDiagonal(
          _ChangeScreenDiagonal event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(screenDiagonal: event.screenDiagonal));

  void _changeWeight(_ChangeWeight event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(weight: event.weight));

  void _changeScreenResolution(
          _ChangeScreenResolution event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(screenResolution: event.screenResolution));

  void _changeOperatingSystem(
          _ChangeOperatingSystem event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(operatingSystem: event.operatingSystem));

  void _changeDisplayType(
          _ChangeDisplayType event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(displayType: event.displayType));

  void _changeWidth(_ChangeWidth event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(screenResolution: event.screenResolution));

  void _changeHeight(_ChangeHeight event, Emitter<CreateEditModelState> emit) =>
      emit(state.copyWith(screenResolution: event.screenResolution));

  FutureOr<void> _createModel(
      _CreateModel event, Emitter<CreateEditModelState> emit) async {
    emit(state.copyWith(status: CreateEditModelStatus.loading));
    if (state.name.isNotEmpty &&
        state.manufacturerId != null &&
        state.pixelDensity != 0 &&
        state.screenRefreshRate != 0 &&
        state.screenDiagonal != 0.0 &&
        state.weight != 0 &&
        state.screenResolution.isNotEmpty) {
      final res = await _createModelUsecase.call(CreateModelParams(
          name: state.name,
          description: state.description,
          manufacturerId: state.manufacturerId ?? '',
          pixelDensity: state.pixelDensity,
          screenRefreshRate: state.screenRefreshRate,
          screenDiagonal: state.screenDiagonal,
          weight: state.weight,
          screenResolution: state.screenResolution,
          operatingSystem: state.operatingSystem,
          displayType: state.displayType));
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (createdModel) => emit(
          state.copyWith(
            status: CreateEditModelStatus.success,
            model: createdModel,
          ),
        ),
      );
      _modelsBloc.add(const ModelsEvent.refresh());
    }
  }

  FutureOr<void> _editModel(
      _EditModel event, Emitter<CreateEditModelState> emit) async {
    emit(state.copyWith(status: CreateEditModelStatus.loading));
    if (state.model != null) {
      if (state.name.isNotEmpty &&
          state.manufacturerId != null &&
          state.pixelDensity != 0 &&
          state.screenRefreshRate != 0 &&
          state.screenDiagonal != 0.0 &&
          state.weight != 0 &&
          state.screenResolution.isNotEmpty) {}
      final res = await _editModelUsecase.call(EditModelParams(
          id: state.model!.id,
          name: state.name,
          description: state.description,
          pixelDensity: state.pixelDensity,
          screenRefreshRate: state.screenRefreshRate,
          screenDiagonal: state.screenDiagonal,
          weight: state.weight,
          screenResolution: state.screenResolution,
          operatingSystem: state.operatingSystem,
          displayType: state.displayType));
      res.fold((failure) => _throwFailure(emit, failure), (updatedModel) {
        emit(
          state.copyWith(
            status: CreateEditModelStatus.success,
            model: updatedModel,
          ),
        );
        _modelsBloc.add(ModelsEvent.updateModelInList(updatedModel));
      });
    }
  }

  void _reset(_Reset event, Emitter<CreateEditModelState> emit) =>
      emit(const CreateEditModelState());

  void _throwFailure(Emitter<CreateEditModelState> emit, Failure failure) {
    emit(state.copyWith(
        status: CreateEditModelStatus.failure, failure: failure));
    emit(state.copyWith(
        status: CreateEditModelStatus.initial, failure: const CasualFailure()));
  }
}
