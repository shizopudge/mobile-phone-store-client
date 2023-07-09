import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/detailed_product_repository.dart';

class GetOneProduct implements UseCase<Product, GetOneParams> {
  final DetailedProductRepository repository;

  GetOneProduct(this.repository);
  @override
  FutureEither<Product> call(params) async =>
      await repository.getOneProduct(params.id);
}

class GetOneParams extends Equatable {
  final String id;
  const GetOneParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
