import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required GetProducts getProductsUsecase})
      : _getProductsUsecase = getProductsUsecase,
        super(const ProductsState()) {
    on<_Start>(_start);
  }

  final GetProducts _getProductsUsecase;

  FutureOr<void> _start(_Start event, Emitter<ProductsState> emit) async {
    final res = await _getProductsUsecase.call(GetProductsParams(
      page: state.filter.page,
      limit: state.filter.limit,
      query: state.filter.query,
      sort: state.filter.sort.toString(),
    ));
    res.fold(
      (failure) =>
          emit(ProductsState(status: ProductStatus.failure, failure: failure)),
      (r) => emit(
        ProductsState(
          status: ProductStatus.success,
          products: r.products,
          info: r.info,
        ),
      ),
    );
  }
}
