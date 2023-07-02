import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';

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
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: 'Terms of Service & Privacy Policy',
            style: kMedium.copyWith(
              color: kLightBlue,
              fontSize: 16,
              height: 1.5,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
