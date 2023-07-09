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
      final product = Product.fromModel(res);
      return Right(product);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
