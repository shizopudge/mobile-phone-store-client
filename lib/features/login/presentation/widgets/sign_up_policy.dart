import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import 'sign_up_policy_bottom_sheet.dart';

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
          fontSize: SizeConfig.body3,
        ),
        children: [
          TextSpan(
            text: 'Terms of Service & Privacy Policy',
            style: kMedium.copyWith(
              color: kLightBlue,
              fontSize: SizeConfig.body3,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => showModalBottomSheet(
                    context: context,
                    backgroundColor: kLightWhite,
                    useSafeArea: true,
                    isScrollControlled: true,
                    builder: (_) => const SignUpPolicyBottomSheet(),
                  ),
          ),
        ],
      ),
    );
  }
}
