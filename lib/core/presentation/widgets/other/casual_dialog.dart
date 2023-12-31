import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/styles/fonts.dart';
import '../../../utils/size_config.dart';

class CasualDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final double innerPadding;
  const CasualDialog({
    super.key,
    required this.child,
    required this.title,
    required this.subtitle,
    this.innerPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: FadeAnimationYDown(
        delay: 0,
        child: SimpleDialog(
          elevation: 0,
          backgroundColor: kLightWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              SizeConfig.borderRadiusSmall,
            ),
          ),
          insetPadding: EdgeInsets.all(
            SizeConfig.setPadding(20),
          ),
          contentPadding: EdgeInsets.all(
            SizeConfig.setPadding(20),
          ),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FadeAnimationYDown(
                        delay: .2,
                        child: Text(
                          title,
                          overflow: TextOverflow.visible,
                          style: kBold.copyWith(
                            fontSize: SizeConfig.body1,
                            color: kDarkBlue,
                          ),
                        ),
                      ),
                    ),
                    const CloseButton(
                      color: kLightBlue,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.setPadding(innerPadding),
                ),
                FadeAnimationYDown(
                  delay: .3,
                  child: Text(
                    subtitle,
                    overflow: TextOverflow.visible,
                    style: kRegular.copyWith(
                      fontSize: SizeConfig.body2,
                      color: kGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.setPadding(innerPadding),
                ),
                FadeAnimationYDown(delay: .4, child: child),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
