import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';

class ProductCardMessage extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;

  const ProductCardMessage({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: MediaQuery.of(context).size.width * .2,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          50,
        ),
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
