import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/filters.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/browse_products_response.dart';
import '../../domain/usecases/browse_products.dart';

part 'browse_products_bloc.freezed.dart';
part 'browse_products_bloc.g.dart';
part 'browse_products_event.dart';
part 'browse_products_state.dart';

class BrowseProductsBloc extends Bloc<BrowseProductsEvent, BrowseProductsState>
    with HydratedMixin {
  BrowseProductsBloc({required BrowseProducts getManyProductsUsecase})
      : _getManyProductsUsecase = getManyProductsUsecase,
        super(const BrowseProductsState()) {
    on<_Initial>(_initial);
    on<_Refresh>(_refresh);
    on<_GetNextProducts>(_getNextProducts);
    on<_SearchProducts>(_searchProducts);
    on<_UpdateProductInList>(_updateProductInList);
    on<_ChangeFilter>(_changeFilter);
  }

  final BrowseProducts _getManyProductsUsecase;

  FutureOr<void> _initial(
      _Initial event, Emitter<BrowseProductsState> emit) async {
    emit(state.copyWith(status: BrowseProductsStatus.loading));
    final res = await _getProducts();
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) => emit(
        state.copyWith(
          status: BrowseProductsStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  FutureOr<void> _refresh(event, Emitter<BrowseProductsState> emit) async {
    if (!state.isRefreshing) {
      emit(state.copyWith(
          status: BrowseProductsStatus.refreshing,
          filter: state.filter.copyWith(page: 1)));
      final res = await _getProducts();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) => emit(
          state.copyWith(
            status: BrowseProductsStatus.success,
            products: r.products,
            info: r.info,
          ),
        ),
      );
    }
  }

  FutureOr<void> _getNextProducts(
      _GetNextProducts event, Emitter<BrowseProductsState> emit) async {
    if (!state.isLastPage && !state.isPaginating && !state.isRefreshing) {
      emit(state.copyWith(
          status: BrowseProductsStatus.loading,
          filter: state.filter.copyWith(page: state.filter.page + 1)));
      final res = await _getProducts();
      res.fold(
        (failure) => _throwFailure(emit, failure),
        (r) {
          emit(
            state.copyWith(
              status: BrowseProductsStatus.success,
              info: r.info,
              products: [...state.products, ...r.products],
            ),
          );
        },
      );
    }
  }

  void _searchProducts(
      _SearchProducts event, Emitter<BrowseProductsState> emit) async {
    emit(state.copyWith(
        filter: state.filter.copyWith(query: event.query, page: 1),
        status: BrowseProductsStatus.refreshing));
    final res = await _getProducts();
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) => emit(
        state.copyWith(
          status: BrowseProductsStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  void _updateProductInList(
      _UpdateProductInList event, Emitter<BrowseProductsState> emit) {
    final List<Product> products = [...state.products];
    final int index =
        products.indexWhere((product) => product.id == event.product.id);
    if (index != -1) {
      products[index] = event.product;
      emit(state.copyWith(products: products));
    }
  }

  void _changeFilter(
      _ChangeFilter event, Emitter<BrowseProductsState> emit) async {
    emit(state.copyWith(
        filter: event.filter.copyWith(page: 1),
        status: BrowseProductsStatus.loading,
        products: []));
    final res = await _getProducts();
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) => emit(
        state.copyWith(
          status: BrowseProductsStatus.success,
          info: r.info,
          products: r.products,
        ),
      ),
    );
  }

  FutureEither<BrowseProductsResponse> _getProducts() async =>
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

  void _throwFailure(Emitter<BrowseProductsState> emit, Failure failure) {
    emit(
        state.copyWith(status: BrowseProductsStatus.failure, failure: failure));
    emit(state.copyWith(
        status: BrowseProductsStatus.initial, failure: const CasualFailure()));
  }

  @override
  BrowseProductsState? fromJson(Map<String, dynamic> json) =>
      _BrowseProductsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(BrowseProductsState state) {
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
