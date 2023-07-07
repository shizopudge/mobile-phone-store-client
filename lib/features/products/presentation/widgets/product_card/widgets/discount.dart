import 'package:flutter/material.dart';

import '../../../../../../core/styles/styles.dart';

class Discount extends StatelessWidget {
  final double padding;
  final double fontSize;
  final int? discount;
  const Discount({
    super.key,
    required this.padding,
    required this.fontSize,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: kOrange,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: kDarkBlue.withOpacity(.3),
            blurRadius: 5,
            spreadRadius: 2.5,
            offset: const Offset(
              0,
              1.5,
            ),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$discount%',
          style: kBold.copyWith(color: kWhite, fontSize: fontSize),
        ),
      ),
    );
  }
}
