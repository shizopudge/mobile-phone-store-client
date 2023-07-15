import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/product.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_product_repository.dart';

class EditProduct implements UseCase<Product, EditProductParams> {
  final CreateEditProductRepository repository;

  const EditProduct(this.repository);
  @override
  FutureEither<Product> call(EditProductParams params) async =>
      await repository.editProduct(
          id: params.id,
          modelId: params.modelId,
          cost: params.cost,
          color: params.color,
          colorCode: params.colorCode,
          storage: params.storage,
          inStockCount: params.inStockCount,
          discount: params.discount);
}

class EditProductParams extends Equatable {
  final String id;
  final String modelId;
  final double cost;
  final String color;
  final String colorCode;
  final int storage;
  final int inStockCount;
  final int? discount;
  const EditProductParams({
    required this.id,
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
      [id, modelId, cost, color, colorCode, storage, inStockCount, discount];
}
