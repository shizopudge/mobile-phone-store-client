import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/utils/size_config.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/products_response.dart';
import '../../domain/usecases/get_products.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required GetProducts getProductsUsecase})
      : _getProductsUsecase = getProductsUsecase,
        super(const ProductsState()) {
    on<_Start>(_start);
    on<_RefreshProducts>(_refreshProducts);
    on<_GetNextProducts>(_getNextProducts);
    on<_SearchProducts>(_searchProducts);
    on<_ToggleSortBy>(_toggleSortBy);
    on<_ChangeFilter>(_changeFilter);
  }

  final GetProducts _getProductsUsecase;

  FutureOr<void> _start(_Start event, Emitter<ProductsState> emit) async {
    if (!SizeConfig.isMobile) {
      emit(state.copyWith(filter: state.filter.copyWith(limit: 30)));
    }
    final res = await _fetchProducts();
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
    print(state.filter.limit);
    if (!state.isRefreshing) {
      emit(state.copyWith(
          status: ProductsStatus.refreshing,
          filter: state.filter.copyWith(page: 1)));
      final res = await _fetchProducts();
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
      final res = await _fetchProducts();
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
    final res = await _fetchProducts();
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

  FutureOr<void> _changeFilter(
      _ChangeFilter event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(
        filter: event.filter, status: ProductsStatus.loading, products: []));
    final res = await _fetchProducts();
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

  void _toggleSortBy(_ToggleSortBy event, Emitter<ProductsState> emit) {
    if (state.filter.sort == SortBy.asc) {
      emit(state.copyWith(filter: state.filter.copyWith(sort: SortBy.desc)));
    } else {
      emit(state.copyWith(filter: state.filter.copyWith(sort: SortBy.asc)));
    }
  }

  FutureEither<ProductsResponse> _fetchProducts() async {
    return await _getProductsUsecase.call(GetProductsParams(
      page: state.filter.page,
      limit: state.filter.limit,
      query: state.filter.query,
      sort: state.filter.sort.toString(),
      withDiscount: state.filter.withDiscount,
      newArrival: state.filter.newArrival,
    ));
  }
}
