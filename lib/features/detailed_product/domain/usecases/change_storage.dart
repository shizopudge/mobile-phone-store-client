import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/failure/failure.dart';
import '../repositories/detailed_product_repository.dart';

class ChangeStorage {
  final DetailedProductRepository repository;

  const ChangeStorage(this.repository);

  Either<Failure, Product> call(ChangeStorageParams params) => repository
      .changeStorage(product: params.product, newStorage: params.newStorage);
}

class ChangeStorageParams extends Equatable {
  final Product product;
  final int newStorage;

  const ChangeStorageParams({
    required this.product,
    required this.newStorage,
  });

  @override
  List<Object?> get props => [product, newStorage];
}
