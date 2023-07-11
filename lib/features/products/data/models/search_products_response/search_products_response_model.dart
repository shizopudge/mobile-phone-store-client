import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/models/info/items_info_model.dart';
import '../../../../../core/data/models/product/product_model.dart';

part 'search_products_response_model.freezed.dart';
part 'search_products_response_model.g.dart';

@freezed
class SearchProductsResponseModel with _$SearchProductsResponseModel {
  const factory SearchProductsResponseModel({
    required InfoModel info,
    required List<ProductModel> products,
  }) = _SearchProductsResponseModel;

  factory SearchProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsResponseModelFromJson(json);
}
