import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  const CartRepositoryImpl({required this.remoteDataSource});
  @override
  FutureEither<CartWishlistResponse> getCart({
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
      final res = await remoteDataSource.getCart(
          page: page,
          limit: limit,
          query: query,
          sort: sort,
          minCost: minCost,
          maxCost: maxCost,
          withDiscount: withDiscount,
          newArrival: newArrival);
      return Right(CartWishlistResponse.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
