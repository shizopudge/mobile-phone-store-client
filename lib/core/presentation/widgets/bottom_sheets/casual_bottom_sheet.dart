import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../../animations/fade_animation_y_down.dart';
import '../other/bottom_sheet_divider.dart';

class CasualBottomSheet extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double heightFactor;
  final Widget child;
  const CasualBottomSheet({
    super.key,
    required this.title,
    this.subtitle,
    this.heightFactor = .8,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return FractionallySizedBox(
      heightFactor: heightFactor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.setPadding(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FadeAnimationYDown(delay: .2, child: BottomSheetDivider()),
            SizedBox(height: SizeConfig.setPadding(15)),
            FadeAnimationYDown(
              delay: .3,
              child: Text(
                title,
                style:
                    kBold.copyWith(color: kDarkBlue, fontSize: SizeConfig.h1),
              ),
            ),
            SizedBox(height: SizeConfig.setPadding(15)),
            if (subtitle != null)
              FadeAnimationYDown(
                delay: .4,
                child: Text(title,
                    style: kMedium.copyWith(
                        color: kDarkBlue, fontSize: SizeConfig.body1)),
              ),
            if (subtitle != null) SizedBox(height: SizeConfig.setPadding(15)),
            child,
          ],
        ),
      ),
    );
  }
}
