import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class DetailedProductItem extends StatelessWidget {
  final String title;
  final Widget child;
  const DetailedProductItem({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kSemiBold.copyWith(
            fontSize: SizeConfig.body1,
            color: kGrey,
          ),
        ),
        SizedBox(
          height: SizeConfig.setPadding(8),
        ),
        child,
      ],
    );
  }
}
