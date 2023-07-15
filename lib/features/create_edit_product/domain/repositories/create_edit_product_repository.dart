import 'dart:io';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/product.dart';

abstract interface class CreateEditProductRepository {
  FutureEither<Product> createProduct({
    required String modelId,
    required double cost,
    required String color,
    required String colorCode,
    required int storage,
    required int inStockCount,
    required int? discount,
  });
  FutureEither<Product> editProduct({
    required String id,
    required String modelId,
    required double cost,
    required String color,
    required String colorCode,
    required int storage,
    required int inStockCount,
    required int? discount,
  });
  FutureEither<void> uploadImages({
    required String id,
    required List<File> images,
  });
  FutureEither<void> deleteImage({
    required String id,
    required String imageLink,
  });
  FutureEither<void> deleteProduct(String id);
}
