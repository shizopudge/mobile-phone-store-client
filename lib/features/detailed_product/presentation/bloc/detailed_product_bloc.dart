import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../../../products/presentation/bloc/products_bloc.dart';
import '../../domain/usecases/get_one_product.dart';

part 'detailed_product_bloc.freezed.dart';
part 'detailed_product_bloc.g.dart';
part 'detailed_product_event.dart';
part 'detailed_product_state.dart';

class DetailedProductBloc
    extends Bloc<DetailedProductEvent, DetailedProductState>
    with HydratedMixin {
  DetailedProductBloc(
      {required ProductsBloc productsBloc,
      required GetOneProduct getOneProductUsecase})
      : _productsBloc = productsBloc,
        _getOneProductUsecase = getOneProductUsecase,
        super(const _DetailedProductState()) {
    on<_GetOneProduct>(_getOneProduct);
    on<_ChangeProduct>(_changeProduct);
    on<_ChangeColor>(_changeColor);
    on<_ChangeStorage>(_changeStorage);
  }

  final ProductsBloc _productsBloc;
  final GetOneProduct _getOneProductUsecase;

  FutureOr<void> _getOneProduct(
      _GetOneProduct event, Emitter<DetailedProductState> emit) async {
    emit(state.copyWith(status: DetailedProductStatus.loading));
    final res = await _getOneProductUsecase.call(GetOneParams(id: event.id));
    res.fold(
        (failure) => emit(state.copyWith(
            status: DetailedProductStatus.failure,
            failure: failure)), (product) {
      emit(state.copyWith(
          status: DetailedProductStatus.success, product: product));
      if (!event.isInitial) {
        _productsBloc.add(ProductsEvent.updateProductInList(product));
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

  @override
  DetailedProductState? fromJson(Map<String, dynamic> json) {
    final hydratedState = _DetailedProductState.fromJson(json);
    if (hydratedState.product != null) {
      add(DetailedProductEvent.getOneProduct(
          id: hydratedState.product!.id, isInitial: true));
      return null;
    }
    return hydratedState;
  }

  @override
  Map<String, dynamic>? toJson(DetailedProductState state) {
    if (!state.isFailure && !state.isLoading) {
      return state.toJson();
    }
    return null;
  }

  void _changeColor(
      _ChangeColor event, Emitter<DetailedProductState> emit) async {
    try {
      if (event.newColorCode != null) {
        emit(state.copyWith(status: DetailedProductStatus.loading));
        final Product? product = state.product;
        if (product != null) {
          final Product newProduct = await _getProductOnColorChange(
              product: product, newColorCode: event.newColorCode);
          emit(state.copyWith(
              status: DetailedProductStatus.success,
              product: newProduct.copyWith(model: product.model)));
        }
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          status: DetailedProductStatus.failure,
          failure: UnknownFailure(message: e.toString())));
    }
  }

  void _changeStorage(
      _ChangeStorage event, Emitter<DetailedProductState> emit) async {
    try {
      if (event.newStorage != null) {
        emit(state.copyWith(status: DetailedProductStatus.loading));
        final Product? product = state.product;
        if (product != null) {
          final Product newProduct = await _getProductOnStorageChange(
              product: product, newStorage: event.newStorage);
          emit(state.copyWith(
              status: DetailedProductStatus.success,
              product: newProduct.copyWith(model: product.model)));
        }
      }
    } on Exception catch (e) {
      emit(state.copyWith(
          status: DetailedProductStatus.failure,
          failure: UnknownFailure(message: e.toString())));
    }
  }

  Future<Product> _getProductOnStorageChange(
      {required Product product, required int? newStorage}) async {
    return product.products.firstWhere(
      (a) => a.storage == newStorage && product.colorCode == a.colorCode,
      orElse: () => product.products
          .firstWhere((a) => a.storage == newStorage, orElse: () => product),
    );
  }

  Future<Product> _getProductOnColorChange(
      {required Product product, required String? newColorCode}) async {
    return product.products.firstWhere(
      (a) => a.colorCode == newColorCode && product.storage == a.storage,
      orElse: () => product.products.firstWhere(
          (a) => a.colorCode == newColorCode,
          orElse: () => product),
    );
  }
}
