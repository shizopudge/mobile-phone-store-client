import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class CasualDismissible extends StatelessWidget {
  final void Function(DismissDirection) onDismiss;
  final Widget child;
  final DismissDirection dismissDirection;
  final String label;
  const CasualDismissible({
    super.key,
    required this.onDismiss,
    required this.child,
    this.dismissDirection = DismissDirection.horizontal,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: dismissDirection,
      background: ClipRRect(
        borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: kBold.copyWith(
                  color: kRed.withOpacity(.75), fontSize: SizeConfig.h1),
            ),
          ),
        ),
      ),
      onDismissed: onDismiss,
      child: child,
    );
  }
}
