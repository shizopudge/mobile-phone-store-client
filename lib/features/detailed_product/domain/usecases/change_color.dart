import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/failure/failure.dart';
import '../repositories/detailed_product_repository.dart';

import '../../../../core/domain/entities/product.dart';

class ChangeColor {
  final DetailedProductRepository repository;

  const ChangeColor(this.repository);

  Either<Failure, Product> call(ChangeColorParams params) => repository
      .changeColor(product: params.product, newColorCode: params.newColorCode);
}

class ChangeColorParams extends Equatable {
  final Product product;
  final String newColorCode;

  const ChangeColorParams({
    required this.product,
    required this.newColorCode,
  });

  @override
  List<Object?> get props => [product, newColorCode];
}
