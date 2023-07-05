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
      body: Stack(
        alignment: Alignment.center,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.5,
              sigmaY: 3.5,
            ),
            child: const SizedBox.expand(),
          ),
          FadeAnimationYDown(
            delay: 0,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  SizeConfig.borderRadius,
                ),
                color: kDarkBlue.withOpacity(.65),
              ),
              height: SizeConfig.isMobile
                  ? SizeConfig.screenHeight! * .15
                  : SizeConfig.screenHeight! * .2,
              width: SizeConfig.isMobile
                  ? SizeConfig.screenHeight! * .14
                  : SizeConfig.screenHeight! * .2,
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: CasualLoader(height: double.maxFinite),
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
                      minFontSize: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
