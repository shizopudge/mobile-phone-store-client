import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/products_response.dart';
import '../repositories/products_repository.dart';

class GetProducts implements UseCase<ProductsResponse, GetProductsParams> {
  final ProductsRepository repository;

  GetProducts(this.repository);
  @override
  FutureEither<ProductsResponse> call(params) async =>
      await repository.getProducts(
        page: params.page,
        limit: params.limit,
        query: params.query,
        sort: params.sort,
        minCost: params.minCost,
        maxCost: params.maxCost,
        withDiscount: params.withDiscount,
        newArrival: params.newArrival,
      );
}

class GetProductsParams extends Equatable {
  final int page;
  final int limit;
  final String query;
  final String sort;
  final double? minCost;
  final double? maxCost;
  final bool withDiscount;
  final bool newArrival;
  const GetProductsParams({
    required this.page,
    required this.limit,
    required this.query,
    required this.sort,
    required this.minCost,
    required this.maxCost,
    required this.withDiscount,
    required this.newArrival,
  });

  @override
  List<Object?> get props {
    return [
      page,
      limit,
      query,
      sort,
      minCost,
      maxCost,
      withDiscount,
      newArrival,
    ];
  }
}
