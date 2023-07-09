import 'package:flutter/material.dart';

import '../../../../../../core/styles/styles.dart';
import '../../../../../../core/utils/size_config.dart';

class ProductMessage extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double height;
  const ProductMessage({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          SizeConfig.borderRadiusDefault,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            color: kDarkBlue.withOpacity(.35),
            offset: const Offset(
              0,
              -.5,
            ),
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          text,
          style: kBold.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
