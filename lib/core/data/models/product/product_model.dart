import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';
import '../model/model_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String title,
    required List<String> images,
    required int inStockCount,
    required double cost,
    required String slug,
    required String color,
    required String colorCode,
    required int storage,
    required int? discount,
    required ModelModel? model,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromEntity(Product entity) => ProductModel(
      id: entity.id,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      title: entity.title,
      images: entity.images,
      inStockCount: entity.inStockCount,
      cost: entity.cost,
      slug: entity.slug,
      color: entity.color,
      colorCode: entity.colorCode,
      storage: entity.storage,
      discount: entity.discount,
      model:
          entity.model != null ? ModelModel.fromEntity(entity.model!) : null);
}
