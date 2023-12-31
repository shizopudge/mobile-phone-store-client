import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../utils/size_config.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double? innerPadding;
  final Color? backgroundColor;
  const RoundedIconButton({
    super.key,
    required this.onTap,
    required this.child,
    this.innerPadding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        padding: EdgeInsets.all(innerPadding ?? SizeConfig.setPadding(8)),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(
            color: kGrey.withOpacity(.75),
          ),
        ),
        child: child,
      ),
    );
  }
}
