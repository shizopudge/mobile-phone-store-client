import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class GoTopButton extends StatelessWidget {
  final VoidCallback onTap;
  const GoTopButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: UniqueKey(),
      mini: true,
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeConfig.borderRadiusDefault,
        ),
      ),
      backgroundColor: kDarkBlue,
      child: const Icon(
        Icons.arrow_upward_rounded,
        color: kWhite,
      ),
    );
  }
}
