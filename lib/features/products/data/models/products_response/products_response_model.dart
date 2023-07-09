import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/models/info/items_info_model.dart';
import '../../../../../core/data/models/product/product_model.dart';

part 'products_response_model.freezed.dart';
part 'products_response_model.g.dart';

@freezed
class ProductsResponseModel with _$ProductsResponseModel {
  const factory ProductsResponseModel({
    required InfoModel info,
    required List<ProductModel> products,
  }) = _ProductsResponseModel;

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}
