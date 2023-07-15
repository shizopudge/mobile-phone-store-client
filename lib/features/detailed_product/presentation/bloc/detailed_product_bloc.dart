import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../../../browse_products/presentation/bloc/browse_products_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../domain/usecases/change_color.dart';
import '../../domain/usecases/change_storage.dart';
import '../../domain/usecases/get_one_product.dart';

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
    required BrowseProductsBloc browseProductsBloc,
    required GetOneProduct getOneProductUsecase,
    required ChangeColor changeColorUsecase,
    required ChangeStorage changeStorageUsecase,
  })  : _cartBloc = cartBloc,
        _wishlistBloc = wishlistBloc,
        _productsBloc = browseProductsBloc,
        _getOneProductUsecase = getOneProductUsecase,
        _changeColorUsecase = changeColorUsecase,
        _changeStorageUsecase = changeStorageUsecase,
        super(const _DetailedProductState()) {
    on<_GetOneProduct>(_getOneProduct);
    on<_ChangeProduct>(_changeProduct);
    on<_ChangeColor>(_changeColor);
    on<_ChangeStorage>(_changeStorage);
    on<_Reset>(_reset);
  }

  final CartBloc _cartBloc;
  final WishlistBloc _wishlistBloc;
  final BrowseProductsBloc _productsBloc;
  final GetOneProduct _getOneProductUsecase;
  final ChangeColor _changeColorUsecase;
  final ChangeStorage _changeStorageUsecase;

  FutureOr<void> _getOneProduct(
      _GetOneProduct event, Emitter<DetailedProductState> emit) async {
    emit(state.copyWith(status: DetailedProductStatus.loading));
    final res = await _getOneProductUsecase.call(GetOneParams(id: event.id));
    res.fold((failure) => _throwFailure(emit, failure), (product) {
      emit(state.copyWith(
          status: DetailedProductStatus.success, product: product));
      if (!event.isInitial) {
        _productsBloc.add(BrowseProductsEvent.updateProductInList(product));
        _wishlistBloc.add(WishlistEvent.updateProductInList(product));
        _cartBloc.add(CartEvent.updateProductInList(product));
      }
    });
  }

  void _changeProduct(
          _ChangeProduct event, Emitter<DetailedProductState> emit) async =>
      emit(state.copyWith(product: event.product));

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

  void _reset(_Reset event, Emitter<DetailedProductState> emit) =>
      emit(const DetailedProductState());

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
}
