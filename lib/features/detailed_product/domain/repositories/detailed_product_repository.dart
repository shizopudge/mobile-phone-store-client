import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/product.dart';

abstract interface class DetailedProductRepository {
  FutureEither<Product> getOneProduct(String id);
  Either<Failure, Product> changeStorage(
      {required Product product, required int newStorage});
  Either<Failure, Product> changeColor(
      {required Product product, required String newColorCode});
}
