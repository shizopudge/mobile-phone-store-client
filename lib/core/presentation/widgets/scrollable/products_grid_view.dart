import 'package:flutter/material.dart';

import '../../../../features/products/domain/entities/product.dart';
import '../../../utils/size_config.dart';
import '../cards/product/product_card.dart';

class ProductsGridView extends StatelessWidget {
  final List<Product> products;
  const ProductsGridView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
          top: SizeConfig.screenHeight! * .0015,
          bottom: SizeConfig.screenHeight! * .1),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        itemBuilder: (context, i) {
          final Product product = products[i];
          return ProductCard(product: product);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: SizeConfig.isMobile
              ? 2
              : SizeConfig.isTablet
                  ? 3
                  : 4,
          crossAxisSpacing: SizeConfig.isMobile
              ? 10
              : SizeConfig.isTablet
                  ? 20
                  : 40,
          mainAxisSpacing: SizeConfig.isMobile
              ? 10
              : SizeConfig.isTablet
                  ? 20
                  : 40,
          childAspectRatio: .7,
        ),
      ),
    );
  }
}
