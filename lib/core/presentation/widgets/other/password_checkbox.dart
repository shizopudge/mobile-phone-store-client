import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class PasswordCheckBox extends StatelessWidget {
  final String requirement;
  final bool isValidated;
  const PasswordCheckBox({
    super.key,
    required this.requirement,
    required this.isValidated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.borderRadiusDefault),
        color:
            isValidated ? kLightBlue.withOpacity(.25) : kGrey.withOpacity(.25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: SizeConfig.iconSmall,
            color: isValidated ? kLightBlue : kDarkBlue.withOpacity(.5),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            requirement,
            style: kMedium.copyWith(
              color: isValidated ? kLightBlue : kDarkBlue.withOpacity(.5),
              fontSize: SizeConfig.body2,
            ),
          ),
        ],
      ),
    );
  }
}
