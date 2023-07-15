import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/models/info/info_model.dart';
import '../../../../../core/data/models/product/product_model.dart';

part 'browse_products_response_model.freezed.dart';
part 'browse_products_response_model.g.dart';

@freezed
class BrowseProductsResponseModel with _$BrowseProductsResponseModel {
  const factory BrowseProductsResponseModel({
    required InfoModel info,
    required List<ProductModel> products,
  }) = _BrowseProductsResponseModel;

  factory BrowseProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BrowseProductsResponseModelFromJson(json);
}
