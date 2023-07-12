import 'package:equatable/equatable.dart';

import '../../../../core/data/models/product/product_model.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/product.dart';
import '../../data/models/search_products_response/browse_products_response_model.dart';

class BrowseProductsResponse extends Equatable {
  final Info info;
  final List<Product> products;
  const BrowseProductsResponse({
    required this.info,
    required this.products,
  });

  BrowseProductsResponse copyWith({
    Info? info,
    List<Product>? products,
  }) {
    return BrowseProductsResponse(
      info: info ?? this.info,
      products: products ?? this.products,
    );
  }

  factory BrowseProductsResponse.fromModel(BrowseProductsResponseModel model) {
    final Set<Product> products = {};
    for (ProductModel productModel in model.products) {
      products.add(Product.fromModel(productModel));
    }
    return BrowseProductsResponse(
      info: Info.fromModel(model.info),
      products: products.toList(),
    );
  }

  @override
  List<Object> get props => [info, products];
}
