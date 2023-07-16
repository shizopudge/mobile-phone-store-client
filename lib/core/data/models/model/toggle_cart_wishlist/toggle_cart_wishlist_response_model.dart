import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/models/product/product_model.dart';

part 'toggle_cart_wishlist_response_model.freezed.dart';
part 'toggle_cart_wishlist_response_model.g.dart';

@freezed
class ToggleCartWishlistResponseModel with _$ToggleCartWishlistResponseModel {
  const factory ToggleCartWishlistResponseModel({
    required List<ProductModel> products,
  }) = _ToggleCartWishlistModel;

  factory ToggleCartWishlistResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ToggleCartWishlistResponseModelFromJson(json);
}
