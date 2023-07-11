import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/usecases/products/toggle_cart.dart';
import '../../domain/usecases/get_cart.dart';

import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/domain/entities/products_filter.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/utils/debouncer.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(
      {required GetCart getCartUsecase, required ToggleCart toggleCartUsecase})
      : _getCartUsecase = getCartUsecase,
        _toggleCartUsecase = toggleCartUsecase,
        super(const CartState()) {
    on<_GetCart>(_getCart);
    on<_RefreshCart>(_refreshCart);
    on<_ToggleCart>(_toggleCart);
    on<_ChangeCart>(_changeCart);
  }

  final GetCart _getCartUsecase;
  final ToggleCart _toggleCartUsecase;

  final FutureDebouncer _futureDebouncer = FutureDebouncer(milliseconds: 500);

  FutureOr<void> _getCart(_GetCart event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    final res = await _getCartUsecase.call(NoParams());
    res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(state.copyWith(
            status: CartStatus.success, info: r.info, cart: r.products)));
  }

  FutureOr<void> _refreshCart(
      _RefreshCart event, Emitter<CartState> emit) async {
    if (!state.isRefreshing) {
      emit(state.copyWith(status: CartStatus.loading));
      final res = await _getCartUsecase.call(NoParams());
      res.fold(
          (failure) => _throwFailure(emit, failure),
          (r) => emit(state.copyWith(
              status: CartStatus.success, info: r.info, cart: r.products)));
    }
  }

  FutureOr<void> _toggleCart(_ToggleCart event, Emitter<CartState> emit) async {
    final List<Product> cart = state.cart;
    List<Product> updatedCart = [...cart];
    if (cart.contains(event.product)) {
      final int productIndex = cart.indexOf(event.product);
      updatedCart.removeAt(productIndex);
      add(CartEvent.changeCart(updatedCart));
      await _futureDebouncer.call(() async {
        final res = await _toggleCartUsecase
            .call(ToggleCartParams(id: event.product.id));
        res.fold((failure) {
          updatedCart.insert(productIndex, event.product);
          add(CartEvent.changeCart(updatedCart));
          _throwFailure(emit, failure);
        }, (r) => add(CartEvent.changeCart(r.products)));
      });
    } else {
      updatedCart.add(event.product);
      add(CartEvent.changeCart(updatedCart));
      await _futureDebouncer.call(() async {
        final res = await _toggleCartUsecase
            .call(ToggleCartParams(id: event.product.id));
        res.fold((failure) {
          updatedCart.remove(event.product);
          add(CartEvent.changeCart(updatedCart));
          _throwFailure(emit, failure);
        }, (r) => add(CartEvent.changeCart(updatedCart)));
      });
    }
  }

  void _changeCart(_ChangeCart event, Emitter<CartState> emit) =>
      emit(state.copyWith(cart: event.cart));

  void _throwFailure(Emitter<CartState> emit, Failure failure) {
    emit(state.copyWith(status: CartStatus.failure, failure: failure));
    emit(state.copyWith(
        status: CartStatus.initial, failure: const CasualFailure()));
  }

  @override
  Future<void> close() {
    _futureDebouncer.dispose();
    return super.close();
  }
}
