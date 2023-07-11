import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/cart_wishlist_response.dart';
import '../../../domain/entities/product.dart';
import '../info/items_info_model.dart';
import '../product/product_model.dart';

part 'cart_wishlist_response_model.freezed.dart';
part 'cart_wishlist_response_model.g.dart';

@freezed
class CartWishlistResponseModel with _$CartWishlistResponseModel {
  const factory CartWishlistResponseModel({
    required InfoModel info,
    required List<ProductModel> products,
  }) = _WishlistResponseModel;

  factory CartWishlistResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartWishlistResponseModelFromJson(json);

  factory CartWishlistResponseModel.fromEntity(CartWishlistResponse entity) {
    final List<ProductModel> productModels = [];
    for (Product product in entity.products) {
      productModels.add(ProductModel.fromEntity(product));
    }
    return CartWishlistResponseModel(
      info: InfoModel.fromEntity(entity.info),
      products: productModels,
    );
  }
}
