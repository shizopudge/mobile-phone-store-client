import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';
import '../../../../../core/utils/size_config.dart';
import 'products_filter_divider.dart';

class ProductsFilterItem extends StatelessWidget {
  final String title;
  final Widget? action;
  final Widget? child;
  final bool showDivider;
  const ProductsFilterItem({
    super.key,
    required this.title,
    this.child,
    this.action,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: AutoSizeText(
                title,
                overflow: TextOverflow.ellipsis,
                style: kSemiBold.copyWith(
                    fontSize: SizeConfig.body1, color: kDarkBlue),
              ),
            ),
            action ?? const SizedBox(),
          ],
        ),
        if (child != null)
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              child!,
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        if (showDivider) const ProductsFilterDivider(),
      ],
    );
  }
}
