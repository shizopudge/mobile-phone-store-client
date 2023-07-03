import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

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
      height: SizeConfig.buttonSmallHeight,
      color: isEnabled ? kBlack : kGrey,
      elevation: 0,
      child: Text(
        text,
        style: kMedium.copyWith(
          color: kWhite,
          fontSize: SizeConfig.fontTitle,
        ),
      ),
    );
  }
}
