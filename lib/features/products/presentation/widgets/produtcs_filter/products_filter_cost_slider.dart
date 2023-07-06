import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';
import '../../../../../core/utils/size_config.dart';

class ProductsFilterCostSlider extends StatelessWidget {
  final double? minCost;
  final double? maxCost;
  final void Function(RangeValues value) onChange;
  const ProductsFilterCostSlider({
    super.key,
    required this.minCost,
    required this.maxCost,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
            values: RangeValues(
              minCost != null ? minCost! / 99999 : 0,
              maxCost != null ? maxCost! / 99999 : 1,
            ),
            onChanged: onChange),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              minCost != null ? '\$${minCost!.toStringAsFixed(0)}' : '\$0',
              style: kMedium.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
            ),
            Text(
              maxCost != null ? '\$${maxCost!.toStringAsFixed(0)}' : 'Max',
              style: kMedium.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
