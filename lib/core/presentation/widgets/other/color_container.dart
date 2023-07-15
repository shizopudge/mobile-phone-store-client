import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class ColorContainer extends StatelessWidget {
  final Color color;
  final double height;
  const ColorContainer({
    super.key,
    required this.color,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: kDarkBlue.withOpacity(
              .75,
            ),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, -1),
          ),
        ],
      ),
    );
  }
}
