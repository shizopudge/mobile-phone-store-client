import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/utils/size_config.dart';
import '../../domain/entities/products_response.dart';
import '../../domain/usecases/get_many_products.dart';

part 'products_bloc.freezed.dart';
part 'products_bloc.g.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState>
    with HydratedMixin {
  ProductsBloc({required GetManyProduct getManyProductsUsecase})
      : _getManyProductsUsecase = getManyProductsUsecase,
        super(const ProductsState()) {
    on<_Initial>(_initial);
    on<_RefreshProducts>(_refreshProducts);
    on<_GetNextProducts>(_getNextProducts);
    on<_SearchProducts>(_searchProducts);
    on<_UpdateProductInList>(_updateProductInList);
    on<_ChangeFilter>(_changeFilter);
  }

  final GetManyProduct _getManyProductsUsecase;

  FutureOr<void> _initial(_Initial event, Emitter<ProductsState> emit) async {
    if (!SizeConfig.isMobile) {
      emit(state.copyWith(filter: state.filter.copyWith(limit: 30)));
    }
    final res = await _getManyProducts();
    res.fold(
      (failure) => emit(
          state.copyWith(status: ProductsStatus.failure, failure: failure)),
      (r) => emit(
        state.copyWith(
          status: ProductsStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  FutureOr<void> _refreshProducts(event, Emitter<ProductsState> emit) async {
    if (!state.isRefreshing) {
      emit(state.copyWith(
          status: ProductsStatus.refreshing,
          filter: state.filter.copyWith(page: 1)));
      final res = await _getManyProducts();
      res.fold(
        (failure) => emit(
            state.copyWith(status: ProductsStatus.failure, failure: failure)),
        (r) => emit(
          state.copyWith(
            status: ProductsStatus.success,
            products: r.products,
            info: r.info,
          ),
        ),
      );
    }
  }

  FutureOr<void> _getNextProducts(
      _GetNextProducts event, Emitter<ProductsState> emit) async {
    if (!state.isLastPage && !state.isPaginating && !state.isRefreshing) {
      emit(state.copyWith(
          status: ProductsStatus.loading,
          filter: state.filter.copyWith(page: state.filter.page + 1)));
      final res = await _getManyProducts();
      res.fold(
        (failure) => emit(
            state.copyWith(status: ProductsStatus.failure, failure: failure)),
        (r) {
          emit(
            state.copyWith(
              status: ProductsStatus.success,
              info: r.info,
              products: [...state.products, ...r.products],
            ),
          );
        },
      );
    }
  }

  void _searchProducts(
      _SearchProducts event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(
        filter: state.filter.copyWith(query: event.query, page: 1),
        status: ProductsStatus.refreshing));
    final res = await _getManyProducts();
    res.fold(
      (failure) => emit(
          state.copyWith(status: ProductsStatus.failure, failure: failure)),
      (r) => emit(
        state.copyWith(
          status: ProductsStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  void _updateProductInList(
      _UpdateProductInList event, Emitter<ProductsState> emit) {
    final List<Product> products = [...state.products];
    final int index =
        products.indexWhere((product) => product.id == event.product.id);
    products[index] = event.product;
    emit(state.copyWith(products: products));
  }

  void _changeFilter(_ChangeFilter event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(
        filter: event.filter.copyWith(page: 1),
        status: ProductsStatus.loading,
        products: []));
    final res = await _getManyProducts();
    res.fold(
      (failure) => emit(
          state.copyWith(status: ProductsStatus.failure, failure: failure)),
      (r) => emit(
        state.copyWith(
          status: ProductsStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  FutureEither<ProductsResponse> _getManyProducts() async =>
      await _getManyProductsUsecase.call(GetProductsParams(
        page: state.filter.page,
        limit: state.filter.limit,
        query: state.filter.query,
        sort: state.filter.sort.toString(),
        minCost: state.filter.minCost,
        maxCost: state.filter.maxCost,
        withDiscount: state.filter.withDiscount,
        newArrival: state.filter.newArrival,
      ));

  @override
  ProductsState? fromJson(Map<String, dynamic> json) =>
      _ProductsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ProductsState state) {
    if (!state.isFailure &&
        !state.isLoading &&
        !state.isRefreshing &&
        !state.isPaginating) {
      return state.copyWith(filter: state.filter.copyWith(page: 1)).toJson();
    }
    return null;
  }
}
