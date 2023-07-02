import 'package:equatable/equatable.dart';

import '../../../../core/domain/entities/info.dart';
import '../../data/models/product/product_model.dart';
import '../../data/models/products_response/products_response_model.dart';
import 'product.dart';

class ProductsResponse extends Equatable {
  final Info info;
  final List<Product> products;
  const ProductsResponse({
    required this.info,
    required this.products,
  });

  ProductsResponse copyWith({
    Info? info,
    List<Product>? products,
  }) {
    return ProductsResponse(
      info: info ?? this.info,
      products: products ?? this.products,
    );
  }

  factory ProductsResponse.fromModel(ProductsResponseModel model) {
    final Set<Product> products = {};
    for (ProductModel productModel in model.products) {
      products.add(Product.fromModel(productModel));
    }
    return ProductsResponse(
      info: Info.fromModel(model.info),
      products: products.toList(),
    );
  }

  @override
  List<Object> get props => [info, products];
}
