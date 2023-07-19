import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class CasualTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;
  final double? fontSize;
  const CasualTextButton({
    super.key,
    required this.onTap,
    this.color = kLightBlue,
    required this.text,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: kMedium.copyWith(
          fontSize: fontSize ?? SizeConfig.body1,
          color: kLightBlue,
        ),
      ),
    );
  }
}
