import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class CasualDismissible extends StatelessWidget {
  final void Function(DismissDirection) onDismiss;
  final Widget child;
  const CasualDismissible({
    super.key,
    required this.onDismiss,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: ClipRRect(
        borderRadius: BorderRadius.circular(SizeConfig.borderRadiusSmall),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                blurRadius: 16,
                spreadRadius: 4,
                color: kRed.withOpacity(.15),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Remove product',
              textAlign: TextAlign.center,
              style:
                  kBold.copyWith(color: kLightWhite, fontSize: SizeConfig.h2),
            ),
          ),
        ),
      ),
      onDismissed: onDismiss,
      child: child,
    );
  }
}
