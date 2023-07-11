import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../../../core/utils/debouncer.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../products/presentation/bloc/search_products_bloc.dart';
import '../../domain/usecases/change_color.dart';
import '../../domain/usecases/change_storage.dart';
import '../../domain/usecases/get_one_product.dart';
import '../../../../core/domain/usecases/products/toggle_cart.dart';
import '../../../../core/domain/usecases/products/toggle_wishlist.dart';

part 'detailed_product_bloc.freezed.dart';
part 'detailed_product_bloc.g.dart';
part 'detailed_product_event.dart';
part 'detailed_product_state.dart';

class DetailedProductBloc
    extends Bloc<DetailedProductEvent, DetailedProductState>
    with HydratedMixin {
  DetailedProductBloc({
    required CartBloc cartBloc,
    required WishlistBloc wishlistBloc,
    required SearchProductsBloc productsBloc,
    required GetOneProduct getOneProductUsecase,
    required ToggleCart toggleCartUsecase,
    required ToggleWishlist toggleWishlistUsecase,
    required ChangeColor changeColorUsecase,
    required ChangeStorage changeStorageUsecase,
  })  : _cartBloc = cartBloc,
        _wishlistBloc = wishlistBloc,
        _productsBloc = productsBloc,
        _getOneProductUsecase = getOneProductUsecase,
        _toggleCartUsecase = toggleCartUsecase,
        _toggleWishlistUsecase = toggleWishlistUsecase,
        _changeColorUsecase = changeColorUsecase,
        _changeStorageUsecase = changeStorageUsecase,
        super(const _DetailedProductState()) {
    on<_GetOneProduct>(_getOneProduct);
    on<_ChangeProduct>(_changeProduct);
    on<_ChangeColor>(_changeColor);
    on<_ChangeStorage>(_changeStorage);
    on<_ToggleCart>(_toggleCart);
    on<_ToggleWishlist>(_toggleWishlist);
  }

  final CartBloc _cartBloc;
  final WishlistBloc _wishlistBloc;
  final SearchProductsBloc _productsBloc;
  final GetOneProduct _getOneProductUsecase;
  final ToggleCart _toggleCartUsecase;
  final ToggleWishlist _toggleWishlistUsecase;
  final ChangeColor _changeColorUsecase;
  final ChangeStorage _changeStorageUsecase;

  final FutureDebouncer _futureDebouncer = FutureDebouncer(milliseconds: 500);

  FutureOr<void> _getOneProduct(
      _GetOneProduct event, Emitter<DetailedProductState> emit) async {
    emit(state.copyWith(status: DetailedProductStatus.loading));
    final res = await _getOneProductUsecase.call(GetOneParams(id: event.id));
    res.fold((failure) => _throwFailure(emit, failure), (product) {
      emit(state.copyWith(
          status: DetailedProductStatus.success, product: product));
      if (!event.isInitial) {
        _productsBloc.add(SearchProductsEvent.updateProductInList(product));
      }
    });
  }

  void _changeProduct(
      _ChangeProduct event, Emitter<DetailedProductState> emit) async {
    if (event.product == null) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
    emit(state.copyWith(product: event.product));
  }

  void _changeColor(
      _ChangeColor event, Emitter<DetailedProductState> emit) async {
    if (event.newColorCode != null) {
      emit(state.copyWith(status: DetailedProductStatus.loading));
      final Product? product = state.product;
      if (product != null) {
        final res = _changeColorUsecase.call(ChangeColorParams(
            product: product, newColorCode: event.newColorCode!));
        res.fold(
            (failure) => _throwFailure(emit, failure),
            (newProduct) => emit(state.copyWith(
                status: DetailedProductStatus.success,
                product: newProduct.copyWith(model: product.model))));
      }
    }
  }

  void _changeStorage(
      _ChangeStorage event, Emitter<DetailedProductState> emit) async {
    if (event.newStorage != null) {
      emit(state.copyWith(status: DetailedProductStatus.loading));
      final Product? product = state.product;
      if (product != null) {
        final res = _changeStorageUsecase.call(ChangeStorageParams(
            product: product, newStorage: event.newStorage!));
        res.fold(
            (failure) => _throwFailure(emit, failure),
            (newProduct) => emit(state.copyWith(
                status: DetailedProductStatus.success,
                product: newProduct.copyWith(model: product.model))));
      }
    }
  }

  FutureOr<void> _toggleCart(
      _ToggleCart event, Emitter<DetailedProductState> emit) async {
    final List<Product> cart = _cartBloc.state.cart;
    List<Product> updatedCart = [...cart];
    if (cart.contains(event.product)) {
      final int productIndex = cart.indexOf(event.product);
      updatedCart.removeAt(productIndex);
      _cartBloc.add(CartEvent.changeCart(updatedCart));
      await _futureDebouncer.call(() async {
        final res = await _toggleCartUsecase
            .call(ToggleCartParams(id: event.product.id));
        res.fold((failure) {
          updatedCart.insert(productIndex, event.product);
          _cartBloc.add(CartEvent.changeCart(updatedCart));
          _throwFailure(emit, failure);
        }, (r) => _cartBloc.add(CartEvent.changeCart(r.products)));
      });
    } else {
      updatedCart.add(event.product);
      _cartBloc.add(CartEvent.changeCart(updatedCart));
      await _futureDebouncer.call(() async {
        final res = await _toggleCartUsecase
            .call(ToggleCartParams(id: event.product.id));
        res.fold((failure) {
          updatedCart.remove(event.product);
          _cartBloc.add(CartEvent.changeCart(updatedCart));
          _throwFailure(emit, failure);
        }, (r) => _cartBloc.add(CartEvent.changeCart(updatedCart)));
      });
    }
  }

  FutureOr<void> _toggleWishlist(
      _ToggleWishlist event, Emitter<DetailedProductState> emit) async {
    final List<Product> wislist = _wishlistBloc.state.wishlist;
    List<Product> updatedWishlist = [...wislist];
    if (wislist.contains(event.product)) {
      final int productIndex = wislist.indexOf(event.product);
      updatedWishlist.removeAt(productIndex);
      _wishlistBloc.add(WishlistEvent.changeWishlist(updatedWishlist));
      await _futureDebouncer.call(() async {
        final res = await _toggleWishlistUsecase
            .call(ToggleWishlistParams(id: event.product.id));
        res.fold((failure) {
          updatedWishlist.insert(productIndex, event.product);
          _wishlistBloc.add(WishlistEvent.changeWishlist(updatedWishlist));
          _throwFailure(emit, failure);
        }, (r) => _wishlistBloc.add(WishlistEvent.changeWishlist(r.products)));
      });
    } else {
      updatedWishlist.add(event.product);
      _wishlistBloc.add(WishlistEvent.changeWishlist(updatedWishlist));
      await _futureDebouncer.call(() async {
        final res = await _toggleWishlistUsecase
            .call(ToggleWishlistParams(id: event.product.id));
        res.fold((failure) {
          updatedWishlist.remove(event.product);
          _wishlistBloc.add(WishlistEvent.changeWishlist(updatedWishlist));
          _throwFailure(emit, failure);
        },
            (r) => _wishlistBloc
                .add(WishlistEvent.changeWishlist(updatedWishlist)));
      });
    }
  }

  void _throwFailure(Emitter<DetailedProductState> emit, Failure failure) {
    emit(state.copyWith(
        status: DetailedProductStatus.failure, failure: failure));
    emit(state.copyWith(
        status: DetailedProductStatus.initial, failure: const CasualFailure()));
  }

  @override
  DetailedProductState? fromJson(Map<String, dynamic> json) {
    if (kIsWeb) {
      final hydratedState = _DetailedProductState.fromJson(json);
      if (hydratedState.product != null) {
        add(DetailedProductEvent.getOneProduct(
            id: hydratedState.product!.id, isInitial: true));
        return null;
      }
      return hydratedState;
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(DetailedProductState state) {
    if (kIsWeb) {
      if (!state.isFailure && !state.isLoading) {
        return state.toJson();
      }
      return null;
    }
    return null;
  }

  @override
  Future<void> close() {
    _futureDebouncer.dispose();
    return super.close();
  }
}
