import 'package:flutter/material.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/presentation/widgets/other/tag.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class DetailedProductTags extends StatelessWidget {
  final Product product;
  const DetailedProductTags({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          if (product.isDiscounted)
            Tag(
              text: 'Discounted by ${product.discount}%',
              textColor: kLightWhite,
              backgroundColor: kOrange,
            ),
          if (product.isDiscounted)
            SizedBox(
              width: SizeConfig.setPadding(8),
            ),
          if (product.isOutOfStock)
            const Tag(
              text: 'Out of stock',
              textColor: kLightWhite,
              backgroundColor: kGrey,
            ),
          if (product.isOutOfStock)
            SizedBox(
              width: SizeConfig.setPadding(8),
            ),
          if (product.isNew)
            const Tag(
              text: 'New arrival',
              textColor: kLightWhite,
              backgroundColor: kOrange,
            ),
        ],
      ),
    );
  }
}
