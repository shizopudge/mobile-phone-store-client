import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';

class PasswordCheckBox extends StatelessWidget {
  final String requirement;
  final bool isFits;
  const PasswordCheckBox({
    super.key,
    required this.requirement,
    required this.isFits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isFits ? kLightBlue.withOpacity(.25) : kGrey.withOpacity(.25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline,
            color: isFits ? kLightBlue : kDarkBlue.withOpacity(.5),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            requirement,
            style: kMedium.copyWith(
              color: isFits ? kLightBlue : kDarkBlue.withOpacity(.5),
              fontSize: 18,
              height: .5,
            ),
          ),
        ],
      ),
    );
  }
}
