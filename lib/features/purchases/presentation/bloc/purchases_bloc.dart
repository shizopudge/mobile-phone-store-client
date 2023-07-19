import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/usecases/purchases/open_url.dart';
import '../../domain/usecases/change_purchase.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/domain/entities/purchase.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/filters.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../domain/entities/purchase_response.dart';
import '../../domain/usecases/get_purchases.dart';
import '../../domain/usecases/get_user_purchases.dart';

part 'purchases_bloc.freezed.dart';
part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  PurchasesBloc({
    required AuthBloc authBloc,
    required GetUserPurchases getUserPurchasesUsecase,
    required GetPurchases getPurchasesUsecase,
    required ChangePurchaseStatus cancelPurchaseUsecase,
    required OpenUrl openUrlUsecase,
  })  : _authBloc = authBloc,
        _getUserPurchasesUsecase = getUserPurchasesUsecase,
        _getPurchasesUsecase = getPurchasesUsecase,
        _cancelPurchaseUsecase = cancelPurchaseUsecase,
        _openUrlUsecase = openUrlUsecase,
        super(const PurchasesState()) {
    on<_Initial>(_initial);
    on<_Refresh>(_refresh);
    on<_SearchPurchases>(_searchPurchases,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 300))
            .switchMap(mapper));
    on<_GetNextPurchases>(_getNextPurchases);
    on<_ChangeStatus>(_changeStatus);
    on<_OpenUrl>(_openUrl);
    on<_Reset>(_reset);
  }

  final AuthBloc _authBloc;
  final GetUserPurchases _getUserPurchasesUsecase;
  final GetPurchases _getPurchasesUsecase;
  final ChangePurchaseStatus _cancelPurchaseUsecase;
  final OpenUrl _openUrlUsecase;

  FutureOr<void> _initial(_Initial event, Emitter<PurchasesState> emit) async {
    emit(state.copyWith(
        status: PurchasesStatus.loading, filter: const SimpleFilter()));
    final res = await _getPurchases();
    res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(state.copyWith(
            status: PurchasesStatus.success,
            purchases: r.purchases,
            info: r.info)));
  }

  FutureOr<void> _refresh(_Refresh event, Emitter<PurchasesState> emit) async {
    if (!state.isRefreshing) {
      emit(state.copyWith(
          status: PurchasesStatus.refreshing,
          filter: state.filter.copyWith(page: 1)));
      final res = await _getPurchases();
      res.fold(
          (failure) => _throwFailure(emit, failure),
          (r) => emit(state.copyWith(
              status: PurchasesStatus.success,
              purchases: r.purchases,
              info: r.info)));
    }
  }

  void _searchPurchases(
      _SearchPurchases event, Emitter<PurchasesState> emit) async {
    emit(state.copyWith(
        filter: state.filter.copyWith(query: event.query, page: 1),
        status: PurchasesStatus.refreshing));
    final res = await _getPurchases();
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) => emit(
        state.copyWith(
          status: PurchasesStatus.success,
          info: r.info,
          purchases: r.purchases,
        ),
      ),
    );
  }

  FutureOr<void> _getNextPurchases(
      _GetNextPurchases event, Emitter<PurchasesState> emit) async {
    if (!state.isLastPage && !state.isPaginating && !state.isRefreshing) {
      emit(state.copyWith(
          status: PurchasesStatus.loading,
          filter: state.filter.copyWith(page: state.filter.page + 1)));
      final res = await _getPurchases();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) {
          emit(
            state.copyWith(
              status: PurchasesStatus.success,
              info: r.info,
              purchases: [...state.purchases, ...r.purchases],
            ),
          );
        },
      );
    }
  }

  FutureOr<void> _changeStatus(
      _ChangeStatus event, Emitter<PurchasesState> emit) async {
    if (event.status != event.purchase.status) {
      final List<Purchase> purchases = [...state.purchases];
      final purchaseIndex = purchases.indexOf(event.purchase);
      purchases[purchaseIndex] = event.purchase.copyWith(status: event.status);
      emit(state.copyWith(purchases: purchases));
      final res = await _cancelPurchaseUsecase.call(ChangePurchaseStatusParams(
          id: event.purchase.id, status: event.status));
      res.fold((failure) {
        _throwFailure(emit, failure);
        purchases[purchaseIndex] = event.purchase;
        emit(state.copyWith(purchases: purchases));
      }, (r) => null);
    }
  }

  FutureOr<void> _openUrl(_OpenUrl event, Emitter<PurchasesState> emit) async {
    final res = await _openUrlUsecase
        .call(OpenUrlParams(url: event.purchase.paymentUrl));
    res.fold((failure) => _throwFailure(emit, failure),
        (r) => emit(state.copyWith(status: PurchasesStatus.initial)));
  }

  void _reset(_Reset event, Emitter<PurchasesState> emit) =>
      emit(const PurchasesState());

  FutureEither<PurchasesResponse> _getPurchases() async {
    if (_authBloc.state.user != null && _authBloc.state.user!.isAdmin) {
      return await _getPurchasesUsecase.call(GetPurchasesParams(
        page: state.filter.page,
        limit: state.filter.limit,
        query: state.filter.query,
      ));
    } else {
      return await _getUserPurchasesUsecase.call(GetUserPurchasesParams(
        page: state.filter.page,
        limit: state.filter.limit,
        query: state.filter.query,
      ));
    }
  }

  void _throwFailure(Emitter<PurchasesState> emit, Failure failure) {
    emit(state.copyWith(status: PurchasesStatus.failure, failure: failure));
    emit(state.copyWith(
        status: PurchasesStatus.initial, failure: const CasualFailure()));
  }
}
