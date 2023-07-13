import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../../core/domain/entities/filters.dart';
import '../../../../core/domain/entities/manufacturer.dart';
import '../../../../core/failure/failure.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/info.dart';
import '../../domain/entities/manufacturers_response.dart';
import '../../domain/usecases/get_manufacturers.dart';
import 'package:rxdart/rxdart.dart';

part 'manufacturers_event.dart';
part 'manufacturers_state.dart';
part 'manufacturers_bloc.freezed.dart';
part 'manufacturers_bloc.g.dart';

class ManufacturersBloc extends Bloc<ManufacturersEvent, ManufacturersState>
    with HydratedMixin {
  ManufacturersBloc({required GetManufacturers getManufacturersUsecase})
      : _getManufacturersUsecase = getManufacturersUsecase,
        super(const ManufacturersState()) {
    on<_Initial>(_initial);
    on<_Refresh>(_refresh);
    on<_SearchManufacturers>(_searchManufacturers,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 300))
            .switchMap(mapper));
    on<_GetNextManufacturers>(_getNextManufacturers);
    on<_UpdateManufacturerInList>(_updateManufacturerInList);
  }

  final GetManufacturers _getManufacturersUsecase;

  FutureOr<void> _initial(
      _Initial event, Emitter<ManufacturersState> emit) async {
    emit(state.copyWith(status: ManufacturersStatus.loading));
    final res = await _getManufacturers();
    res.fold(
        (failure) => _throwFailure,
        (r) => emit(state.copyWith(
            status: ManufacturersStatus.success,
            manufacturers: r.manufacturers,
            info: r.info)));
  }

  FutureOr<void> _refresh(
      _Refresh event, Emitter<ManufacturersState> emit) async {
    if (!state.isRefreshing) {
      emit(state.copyWith(status: ManufacturersStatus.refreshing));
      final res = await _getManufacturers();
      res.fold(
          (failure) => _throwFailure,
          (r) => emit(state.copyWith(
              status: ManufacturersStatus.success,
              manufacturers: r.manufacturers,
              info: r.info)));
    }
  }

  void _searchManufacturers(
      _SearchManufacturers event, Emitter<ManufacturersState> emit) async {
    if (event.query != state.filter.query) {
      emit(state.copyWith(
          filter: state.filter.copyWith(query: event.query, page: 1),
          status: ManufacturersStatus.refreshing));
      final res = await _getManufacturers();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(
          state.copyWith(
            status: ManufacturersStatus.success,
            info: r.info,
            manufacturers: r.manufacturers,
          ),
        ),
      );
    }
  }

  FutureOr<void> _getNextManufacturers(
      _GetNextManufacturers event, Emitter<ManufacturersState> emit) async {
    if (!state.isLastPage && !state.isPaginating && !state.isRefreshing) {
      emit(state.copyWith(
          status: ManufacturersStatus.loading,
          filter: state.filter.copyWith(page: state.filter.page + 1)));
      final res = await _getManufacturers();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) {
          emit(
            state.copyWith(
              status: ManufacturersStatus.success,
              info: r.info,
              manufacturers: [...state.manufacturers, ...r.manufacturers],
            ),
          );
        },
      );
    }
  }

  void _updateManufacturerInList(
      _UpdateManufacturerInList event, Emitter<ManufacturersState> emit) {
    final List<Manufacturer> manufacturers = [...state.manufacturers];
    final int index = manufacturers
        .indexWhere((manufacturer) => manufacturer.id == event.manufacturer.id);
    if (index != -1) {
      manufacturers[index] = event.manufacturer;
      emit(state.copyWith(manufacturers: manufacturers));
    }
  }

  FutureEither<ManufacturersResponse> _getManufacturers() async =>
      await _getManufacturersUsecase.call(GetManufacturersParams(
        page: state.filter.page,
        limit: state.filter.limit,
        query: state.filter.query,
      ));

  void _throwFailure(Emitter<ManufacturersState> emit, Failure failure) {
    emit(state.copyWith(status: ManufacturersStatus.failure, failure: failure));
    emit(state.copyWith(
        status: ManufacturersStatus.initial, failure: const CasualFailure()));
  }

  @override
  ManufacturersState? fromJson(Map<String, dynamic> json) =>
      ManufacturersState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ManufacturersState state) {
    if (!state.isFailure &&
        !state.isLoading &&
        !state.isRefreshing &&
        !state.isPaginating) {
      return state
          .copyWith(filter: state.filter.copyWith(page: 1, query: ''))
          .toJson();
    }
    return null;
  }
}
