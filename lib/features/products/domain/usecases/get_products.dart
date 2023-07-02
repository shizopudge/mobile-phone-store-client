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
      );
}

class GetProductsParams extends Equatable {
  final int page;
  final int limit;
  final String query;
  final String sort;
  const GetProductsParams({
    required this.page,
    required this.limit,
    required this.query,
    required this.sort,
  });

  @override
  List<Object> get props => [page, limit, query, sort];
}
