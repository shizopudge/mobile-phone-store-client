import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/failure/failure.dart';
import '../../../domain/entities/toggle_cart_wishlist_response.dart';
import '../../../domain/repositories/products/products_repository.dart';
import '../../datasources/products/products_remote_data_source.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  FutureEither<ToggleCartWishlistResponse> toggleCart(String id) async {
    try {
      final res = await remoteDataSource.toggleCart(id);
      return Right(ToggleCartWishlistResponse.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<ToggleCartWishlistResponse> toggleWishlist(String id) async {
    try {
      final res = await remoteDataSource.toggleWishlist(id);
      return Right(ToggleCartWishlistResponse.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
