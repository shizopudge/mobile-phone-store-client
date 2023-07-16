import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/domain/entities/filters.dart';
import '../../../../core/domain/usecases/products/toggle_wishlist.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/usecases/get_wishlist.dart';

part 'wishlist_bloc.freezed.dart';
part 'wishlist_bloc.g.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState>
    with HydratedMixin {
  WishlistBloc({
    required GetWishlist getWishlistUsecase,
    required ToggleWishlist toggleWishlistUsecase,
  })  : _getWishlistUsecase = getWishlistUsecase,
        _toggleWishlistUsecase = toggleWishlistUsecase,
        super(const WishlistState()) {
    on<_Initial>(_initial);
    on<_Refresh>(_refresh);
    on<_ToggleWishlist>(_toggleWishlist);
    on<_ToggleRemoteWishlist>(_toggleRemoteWishlist,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 500))
            .switchMap(mapper));
    on<_GetNextProducts>(_getNextProducts);
    on<_SearchProducts>(_searchProducts);
    on<_UpdateProductInList>(_updateProductInList);
    on<_ChangeFilter>(_changeFilter);
  }

  final GetWishlist _getWishlistUsecase;
  final ToggleWishlist _toggleWishlistUsecase;

  FutureOr<void> _initial(_Initial event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(status: WishlistStatus.loading));
    final res = await _getProducts();
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) => emit(
        state.copyWith(
          status: WishlistStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  FutureOr<void> _toggleWishlist(
      _ToggleWishlist event, Emitter<WishlistState> emit) async {
    List<Product> products = [...state.products];
    final int productIndex = products.indexOf(event.product);
    if (productIndex != -1) {
      products.removeAt(productIndex);
      emit(state.copyWith(products: products));
      add(_ToggleRemoteWishlist(
          product: event.product, productIndex: productIndex));
    } else {
      products.insert(0, event.product);
      emit(state.copyWith(products: products));
      add(_ToggleRemoteWishlist(product: event.product, productIndex: null));
    }
  }

  FutureOr<void> _toggleRemoteWishlist(
      _ToggleRemoteWishlist event, Emitter<WishlistState> emit) async {
    List<Product> products = [...state.products];
    if (event.productIndex == null) {
      final res = await _toggleWishlistUsecase
          .call(ToggleWishlistParams(id: event.product.id));
      res.fold((failure) {
        products.remove(event.product);
        emit(state.copyWith(products: products));
        _throwFailure(emit, failure);
      }, (r) => null);
    } else {
      final res = await _toggleWishlistUsecase
          .call(ToggleWishlistParams(id: event.product.id));
      res.fold((failure) {
        products.insert(event.productIndex!, event.product);
        emit(state.copyWith(products: products));
        _throwFailure(emit, failure);
      }, (r) => null);
    }
  }

  FutureOr<void> _refresh(_Refresh event, Emitter<WishlistState> emit) async {
    if (!state.isRefreshing) {
      emit(state.copyWith(
          status: WishlistStatus.refreshing,
          filter: state.filter.copyWith(page: 1)));
      final res = await _getProducts();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(
          state.copyWith(
            status: WishlistStatus.success,
            products: r.products,
            info: r.info,
          ),
        ),
      );
    }
  }

  FutureOr<void> _getNextProducts(
      _GetNextProducts event, Emitter<WishlistState> emit) async {
    if (!state.isLastPage && !state.isPaginating && !state.isRefreshing) {
      emit(state.copyWith(
          status: WishlistStatus.loading,
          filter: state.filter.copyWith(page: state.filter.page + 1)));
      final res = await _getProducts();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) {
          emit(
            state.copyWith(
              status: WishlistStatus.success,
              info: r.info,
              products: [...state.products, ...r.products],
            ),
          );
        },
      );
    }
  }

  void _searchProducts(
      _SearchProducts event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(
        filter: state.filter.copyWith(query: event.query, page: 1),
        status: WishlistStatus.refreshing));
    final res = await _getProducts();
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) => emit(
        state.copyWith(
          status: WishlistStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  void _updateProductInList(
      _UpdateProductInList event, Emitter<WishlistState> emit) {
    final List<Product> products = [...state.products];
    final int index =
        products.indexWhere((product) => product.id == event.product.id);
    if (index != -1) {
      products[index] = event.product;
      emit(state.copyWith(products: products));
    }
  }

  void _changeFilter(_ChangeFilter event, Emitter<WishlistState> emit) async {
    emit(state.copyWith(
        filter: event.filter.copyWith(page: 1),
        status: WishlistStatus.loading,
        products: []));
    final res = await _getProducts();
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) => emit(
        state.copyWith(
          status: WishlistStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  FutureEither<CartWishlistResponse> _getProducts() async =>
      await _getWishlistUsecase.call(GetWishlistParams(
        page: state.filter.page,
        limit: state.filter.limit,
        query: state.filter.query,
        sort: state.filter.sort.toString(),
        minCost: state.filter.minCost,
        maxCost: state.filter.maxCost,
        withDiscount: state.filter.withDiscount,
        newArrival: state.filter.newArrival,
      ));

  void _throwFailure(Emitter<WishlistState> emit, Failure failure) {
    emit(state.copyWith(status: WishlistStatus.failure, failure: failure));
    emit(state.copyWith(
        status: WishlistStatus.initial, failure: const CasualFailure()));
  }

  @override
  WishlistState? fromJson(Map<String, dynamic> json) =>
      _WishlistState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(WishlistState state) {
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
