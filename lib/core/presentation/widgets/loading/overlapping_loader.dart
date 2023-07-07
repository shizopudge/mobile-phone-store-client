import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../../animations/fade_animation_y_down.dart';
import 'casual_loader.dart';

class OverlappingLoader extends StatelessWidget {
  final String text;
  const OverlappingLoader({
    super.key,
    this.text = 'Loading...',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.5,
          sigmaY: 3.5,
        ),
        child: FadeAnimationYDown(
          delay: 0,
          child: Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SizeConfig.borderRadiusSmall,
                ),
                color: kDarkBlue.withOpacity(.65),
              ),
              height: SizeConfig.isMobile
                  ? SizeConfig.screenWidth! * .28
                  : SizeConfig.isTablet
                      ? SizeConfig.screenWidth! * .18
                      : SizeConfig.screenWidth! * .12,
              width: SizeConfig.isMobile
                  ? SizeConfig.screenWidth! * .25
                  : SizeConfig.isTablet
                      ? SizeConfig.screenWidth! * .15
                      : SizeConfig.screenWidth! * .1,
              padding: const EdgeInsets.all(2.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: CasualLoader(),
                  ),
                  Flexible(
                    child: AutoSizeText(
                      text,
                      textAlign: TextAlign.center,
                      style: kRegular.copyWith(
                        fontSize: SizeConfig.body3,
                        color: kWhite,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      minFontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
