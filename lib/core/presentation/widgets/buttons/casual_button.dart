import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class CasualButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isEnabled;
  final Color enabledBgColor;
  final Color disabledBgColor;
  final double height;
  final double fontSize;
  const CasualButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.fontSize,
    this.isEnabled = true,
    this.enabledBgColor = kBlack,
    this.disabledBgColor = kGrey,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isEnabled ? onTap : () {},
      enableFeedback: isEnabled,
      minWidth: double.infinity,
      height: height,
      color: isEnabled ? enabledBgColor : disabledBgColor,
      elevation: 0,
      child: Text(
        text,
        style: kMedium.copyWith(
          color: kWhite,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
