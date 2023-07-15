import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_product_repository.dart';

class CreateProduct implements UseCase<Product, CreateProductParams> {
  final CreateEditProductRepository repository;

  const CreateProduct(this.repository);
  @override
  FutureEither<Product> call(CreateProductParams params) async =>
      await repository.createProduct(
          modelId: params.modelId,
          cost: params.cost,
          color: params.color,
          colorCode: params.colorCode,
          storage: params.storage,
          inStockCount: params.inStockCount,
          discount: params.discount);
}

class CreateProductParams extends Equatable {
  final String modelId;
  final double cost;
  final String color;
  final String colorCode;
  final int storage;
  final int inStockCount;
  final int? discount;

  const CreateProductParams({
    required this.modelId,
    required this.cost,
    required this.color,
    required this.colorCode,
    required this.storage,
    required this.inStockCount,
    required this.discount,
  });

  @override
  List<Object?> get props =>
      [modelId, cost, color, colorCode, storage, inStockCount, discount];
}
