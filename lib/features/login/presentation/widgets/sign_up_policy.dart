import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class PolicyText extends StatelessWidget {
  const PolicyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By signing up, you agree to\n',
        style: kSemiBold.copyWith(
          color: kGrey,
          fontSize: SizeConfig.fontSmall,
        ),
        children: [
          TextSpan(
            text: 'Terms of Service & Privacy Policy',
            style: kMedium.copyWith(
              color: kLightBlue,
              fontSize: SizeConfig.fontSmall,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
