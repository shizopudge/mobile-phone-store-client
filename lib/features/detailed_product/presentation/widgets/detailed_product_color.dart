import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/constants/extensions.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class DetailedProductColor extends StatelessWidget {
  final VoidCallback onTap;
  final String selectedColorCode;
  final String colorCode;
  final bool isAvailable;
  const DetailedProductColor({
    super.key,
    required this.selectedColorCode,
    required this.colorCode,
    required this.onTap,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.setPadding(2)),
        margin: EdgeInsets.only(right: SizeConfig.setPadding(8)),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: selectedColorCode == colorCode
              ? Border.all(
                  color: kDarkBlue,
                  width: 2.5,
                )
              : null,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(
                .25,
                1.5,
              ),
              color: kGrey.withOpacity(
                .5,
              ),
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: HexColor.fromHex(
            colorCode,
          ).withOpacity(isAvailable ? 1 : .75),
          child: isAvailable
              ? null
              : Transform.rotate(
                  angle: -math.pi * .25,
                  child: const Divider(
                    color: kGrey,
                    thickness: 3,
                  ),
                ),
        ),
      ),
    );
  }
}
