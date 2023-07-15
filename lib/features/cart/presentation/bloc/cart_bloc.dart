import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';
import '../../../../core/domain/entities/filters.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/domain/usecases/products/toggle_cart.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/usecases/get_cart.dart';

part 'cart_bloc.freezed.dart';
part 'cart_bloc.g.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> with HydratedMixin {
  CartBloc({
    required GetCart getCartUsecase,
    required ToggleCart toggleCartUsecase,
  })  : _getCartUsecase = getCartUsecase,
        _toggleCartUsecase = toggleCartUsecase,
        super(const CartState()) {
    on<_Initial>(_initial);
    on<_Refresh>(_refresh);
    on<_ToggleCart>(_toggleCart);
    on<_ToggleRemoteCart>(_toggleRemoteCart,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 500))
            .switchMap(mapper));
    on<_GetNextProducts>(_getNextProducts);
    on<_SearchProducts>(_searchProducts);
    on<_UpdateProductInList>(_updateProductInList);
    on<_ChangeFilter>(_changeFilter);
  }

  final GetCart _getCartUsecase;
  final ToggleCart _toggleCartUsecase;

  FutureOr<void> _initial(_Initial event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    final res = await _getProducts();
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) => emit(
        state.copyWith(
          status: CartStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  FutureOr<void> _toggleCart(_ToggleCart event, Emitter<CartState> emit) async {
    List<Product> products = [...state.products];
    final int productIndex = products.indexOf(event.product);
    if (productIndex != -1) {
      products.removeAt(productIndex);
      emit(state.copyWith(products: products));
      add(_ToggleRemoteCart(
          product: event.product, productIndex: productIndex));
    } else {
      products.insert(0, event.product);
      emit(state.copyWith(products: products));
      add(_ToggleRemoteCart(product: event.product, productIndex: null));
    }
  }

  FutureOr<void> _toggleRemoteCart(
      _ToggleRemoteCart event, Emitter<CartState> emit) async {
    List<Product> products = [...state.products];
    if (event.productIndex == null) {
      final res =
          await _toggleCartUsecase.call(ToggleCartParams(id: event.product.id));
      res.fold((failure) {
        products.remove(event.product);
        emit(state.copyWith(products: products));
        _throwFailure(emit, failure);
      }, (r) => null);
    } else {
      final res =
          await _toggleCartUsecase.call(ToggleCartParams(id: event.product.id));
      res.fold((failure) {
        products.insert(event.productIndex!, event.product);
        emit(state.copyWith(products: products));
        _throwFailure(emit, failure);
      }, (r) => null);
    }
  }

  FutureOr<void> _refresh(_Refresh event, Emitter<CartState> emit) async {
    if (!state.isRefreshing) {
      emit(state.copyWith(
          status: CartStatus.refreshing,
          filter: state.filter.copyWith(page: 1)));
      final res = await _getProducts();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(
          state.copyWith(
            status: CartStatus.success,
            products: r.products,
            info: r.info,
          ),
        ),
      );
    }
  }

  FutureOr<void> _getNextProducts(
      _GetNextProducts event, Emitter<CartState> emit) async {
    if (!state.isLastPage && !state.isPaginating && !state.isRefreshing) {
      emit(state.copyWith(
          status: CartStatus.loading,
          filter: state.filter.copyWith(page: state.filter.page + 1)));
      final res = await _getProducts();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) {
          emit(
            state.copyWith(
              status: CartStatus.success,
              info: r.info,
              products: [...state.products, ...r.products],
            ),
          );
        },
      );
    }
  }

  void _searchProducts(_SearchProducts event, Emitter<CartState> emit) async {
    if (event.query != state.filter.query) {
      emit(state.copyWith(
          filter: state.filter.copyWith(query: event.query, page: 1),
          status: CartStatus.refreshing));
      final res = await _getProducts();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(
          state.copyWith(
            status: CartStatus.success,
            info: r.info,
            products: r.products,
          ),
        ),
      );
    }
  }

  void _updateProductInList(
      _UpdateProductInList event, Emitter<CartState> emit) {
    final List<Product> products = [...state.products];
    final int index =
        products.indexWhere((product) => product.id == event.product.id);
    if (index != -1) {
      products[index] = event.product;
      emit(state.copyWith(products: products));
    }
  }

  void _changeFilter(_ChangeFilter event, Emitter<CartState> emit) async {
    emit(state.copyWith(
        filter: event.filter.copyWith(page: 1),
        status: CartStatus.loading,
        products: []));
    final res = await _getProducts();
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) => emit(
        state.copyWith(
          status: CartStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  FutureEither<CartWishlistResponse> _getProducts() async =>
      await _getCartUsecase.call(GetCartParams(
        page: state.filter.page,
        limit: state.filter.limit,
        query: state.filter.query,
        sort: state.filter.sort.toString(),
        minCost: state.filter.minCost,
        maxCost: state.filter.maxCost,
        withDiscount: state.filter.withDiscount,
        newArrival: state.filter.newArrival,
      ));

  void _throwFailure(Emitter<CartState> emit, Failure failure) {
    emit(state.copyWith(status: CartStatus.failure, failure: failure));
    emit(state.copyWith(
        status: CartStatus.initial, failure: const CasualFailure()));
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) => _CartState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(CartState state) {
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
