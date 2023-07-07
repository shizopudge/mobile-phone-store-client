import 'package:flutter/material.dart';
import '../../../utils/size_config.dart';

import '../../../styles/colors.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double? innerPadding;
  const RoundedIconButton({
    super.key,
    required this.onTap,
    required this.child,
    this.innerPadding,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        padding: EdgeInsets.all(innerPadding ?? SizeConfig.setPadding(8)),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: kGrey.withOpacity(.75),
          ),
        ),
        child: child,
      ),
    );
  }
}
