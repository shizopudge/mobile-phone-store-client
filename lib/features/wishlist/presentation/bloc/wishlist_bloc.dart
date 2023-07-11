import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/domain/entities/products_filter.dart';
import '../../../../core/domain/usecases/products/toggle_wishlist.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/utils/debouncer.dart';
import '../../domain/usecases/get_wishlist.dart';

part 'wishlist_bloc.freezed.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc({
    required GetWishlist getWishlistUsecase,
    required ToggleWishlist toggleWishlistUsecase,
  })  : _getWishlistUsecase = getWishlistUsecase,
        _toggleWishlistUsecase = toggleWishlistUsecase,
        super(const WishlistState()) {
    on<_GetWishlist>(_getWishlist);
    on<_RefreshWishlist>(_refreshWishlist);
    on<_ToggleWishlist>(_toggleWishlist);
    on<_ChangeWishlist>(_changeWishlist);
  }

  final GetWishlist _getWishlistUsecase;
  final ToggleWishlist _toggleWishlistUsecase;

  final FutureDebouncer _futureDebouncer = FutureDebouncer(milliseconds: 500);

  FutureOr<void> _getWishlist(
      _GetWishlist event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(status: WishlistStatus.loading));
    final res = await _getWishlistUsecase.call(NoParams());
    res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(state.copyWith(
            status: WishlistStatus.success,
            info: r.info,
            wishlist: r.products)));
  }

  FutureOr<void> _refreshWishlist(
      _RefreshWishlist event, Emitter<WishlistState> emit) async {
    if (!state.isRefreshing) {
      emit(state.copyWith(status: WishlistStatus.refreshing));
      final res = await _getWishlistUsecase.call(NoParams());
      res.fold(
          (failure) => _throwFailure(emit, failure),
          (r) => emit(state.copyWith(
              status: WishlistStatus.success,
              info: r.info,
              wishlist: r.products)));
    }
  }

  FutureOr<void> _toggleWishlist(
      _ToggleWishlist event, Emitter<WishlistState> emit) async {
    final List<Product> wislist = state.wishlist;
    List<Product> updatedWishlist = [...wislist];
    if (wislist.contains(event.product)) {
      final int productIndex = wislist.indexOf(event.product);
      updatedWishlist.removeAt(productIndex);
      add(WishlistEvent.changeWishlist(updatedWishlist));
      await _futureDebouncer.call(() async {
        final res = await _toggleWishlistUsecase
            .call(ToggleWishlistParams(id: event.product.id));
        res.fold((failure) {
          updatedWishlist.insert(productIndex, event.product);
          add(WishlistEvent.changeWishlist(updatedWishlist));
          _throwFailure(emit, failure);
        }, (r) => add(WishlistEvent.changeWishlist(r.products)));
      });
    } else {
      updatedWishlist.add(event.product);
      add(WishlistEvent.changeWishlist(updatedWishlist));
      await _futureDebouncer.call(() async {
        final res = await _toggleWishlistUsecase
            .call(ToggleWishlistParams(id: event.product.id));
        res.fold((failure) {
          updatedWishlist.remove(event.product);
          add(WishlistEvent.changeWishlist(updatedWishlist));
          _throwFailure(emit, failure);
        }, (r) => add(WishlistEvent.changeWishlist(updatedWishlist)));
      });
    }
  }

  void _changeWishlist(_ChangeWishlist event, Emitter<WishlistState> emit) =>
      emit(state.copyWith(wishlist: event.wishlist));

  void _throwFailure(Emitter<WishlistState> emit, Failure failure) {
    emit(state.copyWith(status: WishlistStatus.failure, failure: failure));
    emit(state.copyWith(
        status: WishlistStatus.initial, failure: const CasualFailure()));
  }

  @override
  Future<void> close() {
    _futureDebouncer.dispose();
    return super.close();
  }
}
