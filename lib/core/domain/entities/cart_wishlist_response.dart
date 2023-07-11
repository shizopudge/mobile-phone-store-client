import 'package:equatable/equatable.dart';

import '../../data/models/cart_wishlist_response/cart_wishlist_response_model.dart';
import '../../data/models/product/product_model.dart';
import 'info.dart';
import 'product.dart';

class CartWishlistResponse extends Equatable {
  final Info info;
  final List<Product> products;

  const CartWishlistResponse({required this.info, required this.products});

  factory CartWishlistResponse.fromModel(CartWishlistResponseModel model) {
    final List<Product> products = [];
    for (ProductModel productModel in model.products) {
      products.add(Product.fromModel(productModel));
    }
    return CartWishlistResponse(
        info: Info.fromModel(model.info), products: products);
  }

  factory CartWishlistResponse.fromJson(Map<String, dynamic> json) =>
      CartWishlistResponse.fromModel(CartWishlistResponseModel.fromJson(json));

  Map<String, dynamic> toJson() =>
      CartWishlistResponseModel.fromEntity(this).toJson();

  @override
  List<Object?> get props => [info, products];
}
