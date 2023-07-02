import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class CasualButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isEnabled;
  const CasualButton({
    super.key,
    required this.isEnabled,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isEnabled ? onTap : () {},
      enableFeedback: isEnabled,
      minWidth: double.infinity,
      height: 70,
      color: isEnabled ? kBlack : kGrey,
      elevation: 0,
      child: Text(
        text,
        style: kMedium.copyWith(
          color: kWhite,
          fontSize: 24,
        ),
      ),
    );
  }
}
