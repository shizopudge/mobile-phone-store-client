import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class Tag extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double? height;
  final List<BoxShadow>? boxShadow;
  const Tag({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    this.height,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          SizeConfig.borderRadiusSmall,
        ),
        boxShadow: boxShadow,
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
