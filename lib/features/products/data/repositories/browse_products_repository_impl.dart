import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/browse_products_response.dart';
import '../../domain/repositories/browse_products_repository.dart';
import '../datasources/browse_products_remote_data_source.dart';

class BrowseProductsRepositoryImpl implements BrowseProductsRepository {
  final BrowseProductsRemoteDataSource remoteDataSource;

  BrowseProductsRepositoryImpl({required this.remoteDataSource});
  @override
  FutureEither<BrowseProductsResponse> getManyProducts({
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
      final res = await remoteDataSource.getManyProducts(
        page: page,
        limit: limit,
        query: query,
        sort: sort,
        minCost: minCost,
        maxCost: maxCost,
        withDiscount: withDiscount,
        newArrival: newArrival,
      );
      final productsResponse = BrowseProductsResponse.fromModel(res);
      return Right(productsResponse);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
