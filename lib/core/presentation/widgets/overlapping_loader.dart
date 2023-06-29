import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import '../animations/fade_animation_y_down.dart';

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
            child: SizedBox.expand(
              child: GestureDetector(),
            ),
          ),
          FadeAnimationYDown(
            delay: 0,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  32,
                ),
                color: kDarkBlue.withOpacity(.65),
              ),
              height: MediaQuery.of(context).size.height * .18,
              width: MediaQuery.of(context).size.width * .32,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: kWhite,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AutoSizeText(
                    text,
                    textAlign: TextAlign.center,
                    style: kRegular.copyWith(
                      fontSize: 18,
                      color: kWhite,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    minFontSize: 12,
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
