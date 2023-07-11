import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repositories/detailed_product_repository.dart';
import '../datasources/detailed_product_remote_data_source.dart';

class DetailedProductRepositoryImpl implements DetailedProductRepository {
  final DetailedProductRemoteDataSource remoteDataSource;

  DetailedProductRepositoryImpl({required this.remoteDataSource});
  @override
  FutureEither<Product> getOneProduct(String id) async {
    try {
      final res = await remoteDataSource.getOneProduct(id);
      return Right(Product.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  Either<Failure, Product> changeColor(
      {required Product product, required String newColorCode}) {
    try {
      final res = product.products.firstWhere(
        (a) => a.colorCode == newColorCode && product.storage == a.storage,
        orElse: () => product.products.firstWhere(
            (a) => a.colorCode == newColorCode,
            orElse: () => product),
      );
      return Right(res);
    } on Failure catch (e) {
      return Left(CasualFailure(message: e.toString()));
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  Either<Failure, Product> changeStorage(
      {required Product product, required int newStorage}) {
    try {
      final res = product.products.firstWhere(
        (a) => a.storage == newStorage && product.colorCode == a.colorCode,
        orElse: () => product.products
            .firstWhere((a) => a.storage == newStorage, orElse: () => product),
      );
      return Right(res);
    } on Failure catch (e) {
      return Left(CasualFailure(message: e.toString()));
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
