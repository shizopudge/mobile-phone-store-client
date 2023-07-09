import 'package:flutter/material.dart';

import '../../../../core/domain/entities/product.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import 'detailed_product_characteristic.dart';
import 'detailed_product_item.dart';

class DetailedProductInfo extends StatelessWidget {
  final Product product;
  const DetailedProductInfo({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.setPadding(20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(SizeConfig.borderRadiusDefault),
        ),
        color: kLightWhite,
        boxShadow: [
          BoxShadow(
            color: kGrey.withOpacity(.35),
            offset: const Offset(0, -1),
            blurRadius: 5,
            spreadRadius: 2.5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailedProductItem(
            title: 'Description',
            child: Text(
              product.model?.description ?? '...',
              style: kMedium.copyWith(
                fontSize: SizeConfig.body2,
                color: kDarkBlue,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          DetailedProductCharacteristic(
            title: 'Model',
            characteristic: product.model?.name.toString() ?? '...',
          ),
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          DetailedProductCharacteristic(
            title: 'Pixel Density',
            characteristic: '${product.model?.pixelDensity ?? '...'}px',
          ),
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          DetailedProductCharacteristic(
            title: 'Screen Refresh Rate',
            characteristic:
                product.model?.screenRefreshRate.toString() ?? '...',
          ),
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          DetailedProductCharacteristic(
            title: 'Screen Diagonal',
            characteristic: product.model?.screenDiagonal.toString() ?? '...',
          ),
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          DetailedProductCharacteristic(
            title: 'Weight',
            characteristic: product.model?.weight.toString() ?? '...',
          ),
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          DetailedProductCharacteristic(
            title: 'Screen Resolution',
            characteristic: product.model?.screenResolution.toString() ?? '...',
          ),
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          DetailedProductCharacteristic(
            title: 'Operating System',
            characteristic: product.model?.operatingSystem.toString() ?? '...',
          ),
          SizedBox(
            height: SizeConfig.setPadding(20),
          ),
          DetailedProductCharacteristic(
            title: 'Display Type',
            characteristic: product.model?.displayType.toString() ?? '...',
            showDivider: false,
          ),
        ],
      ),
    );
  }
}
