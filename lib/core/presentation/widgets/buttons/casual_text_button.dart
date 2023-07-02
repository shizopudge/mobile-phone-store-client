import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class CasualTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;
  const CasualTextButton({
    super.key,
    required this.onTap,
    this.color = kLightBlue,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: kMedium.copyWith(
          fontSize: 18,
          color: kLightBlue,
        ),
      ),
    );
  }
}
