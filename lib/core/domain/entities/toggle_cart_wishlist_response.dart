import 'package:equatable/equatable.dart';

import '../../data/models/model/toggle_cart_wishlist/toggle_cart_wishlist_response_model.dart';
import '../../data/models/product/product_model.dart';
import 'product.dart';

class ToggleCartWishlistResponse extends Equatable {
  final List<Product> products;

  const ToggleCartWishlistResponse({required this.products});

  factory ToggleCartWishlistResponse.fromModel(
      ToggleCartWishlistResponseModel model) {
    final List<Product> products = [];
    for (ProductModel productModel in model.products) {
      products.add(Product.fromModel(productModel));
    }
    return ToggleCartWishlistResponse(products: products);
  }

  @override
  List<Object?> get props => [products];
}
