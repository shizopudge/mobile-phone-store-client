import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/products_response.dart';
import '../../domain/repositories/products_repository.dart';
import '../datasources/products_remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource});
  @override
  FutureEither<ProductsResponse> getProducts({
    required int page,
    required int limit,
    required String query,
    required String sort,
    required double? minCost,
    required double? maxCost,
    required bool withDiscount,
    required bool newArrival,
  }) async {
    try {
      final res = await remoteDataSource.getProducts(
        page: page,
        limit: limit,
        query: query,
        sort: sort,
        minCost: minCost,
        maxCost: maxCost,
        withDiscount: withDiscount,
        newArrival: newArrival,
      );
      final productsResponse = ProductsResponse.fromModel(res);
      return Right(productsResponse);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
