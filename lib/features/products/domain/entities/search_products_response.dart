import 'package:equatable/equatable.dart';

import '../../../../core/data/models/product/product_model.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/product.dart';
import '../../data/models/search_products_response/search_products_response_model.dart';

class SearchProductsResponse extends Equatable {
  final Info info;
  final List<Product> products;
  const SearchProductsResponse({
    required this.info,
    required this.products,
  });

  SearchProductsResponse copyWith({
    Info? info,
    List<Product>? products,
  }) {
    return SearchProductsResponse(
      info: info ?? this.info,
      products: products ?? this.products,
    );
  }

  factory SearchProductsResponse.fromModel(SearchProductsResponseModel model) {
    final Set<Product> products = {};
    for (ProductModel productModel in model.products) {
      products.add(Product.fromModel(productModel));
    }
    return SearchProductsResponse(
      info: Info.fromModel(model.info),
      products: products.toList(),
    );
  }

  @override
  List<Object> get props => [info, products];
}
