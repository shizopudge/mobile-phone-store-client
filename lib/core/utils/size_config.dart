import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }

  static bool get isMobile => screenWidth! < 850;

  static bool get isTablet => screenWidth! < 1100 && screenWidth! >= 850;

  static bool get isDesktop => screenWidth! >= 1100;

  static double get fontHeaderLarge => isMobile
      ? blockSizeHorizontal! * 8
      : isTablet
          ? blockSizeHorizontal! * 6
          : blockSizeHorizontal! * 5;

  static double get fontHeaderSmall => isMobile
      ? blockSizeHorizontal! * 7
      : isTablet
          ? blockSizeHorizontal! * 5
          : blockSizeHorizontal! * 4;

  static double get fontTitle => isMobile
      ? blockSizeHorizontal! * 6
      : isTablet
          ? blockSizeHorizontal! * 4
          : blockSizeHorizontal! * 3;

  static double get fontSubtitle => isMobile
      ? blockSizeHorizontal! * 5
      : isTablet
          ? blockSizeHorizontal! * 3
          : blockSizeHorizontal! * 2;

  static double get fontSmall => isMobile
      ? blockSizeHorizontal! * 4
      : isTablet
          ? blockSizeHorizontal! * 2.5
          : blockSizeHorizontal! * 1.5;

  static double get iconLarge => isMobile
      ? blockSizeHorizontal! * 7
      : isTablet
          ? blockSizeHorizontal! * 5
          : blockSizeHorizontal! * 4;

  static double get iconMedium => isMobile
      ? blockSizeHorizontal! * 6
      : isTablet
          ? blockSizeHorizontal! * 4
          : blockSizeHorizontal! * 3;

  static double get iconSmall => isMobile
      ? blockSizeHorizontal! * 5
      : isTablet
          ? blockSizeHorizontal! * 3
          : blockSizeHorizontal! * 2;

  static double get radiusLarge => isMobile
      ? blockSizeHorizontal! * 20
      : isTablet
          ? blockSizeHorizontal! * 16
          : blockSizeHorizontal! * 10;

  static double get radiusSmall => isMobile
      ? blockSizeHorizontal! * 8
      : isTablet
          ? blockSizeHorizontal! * 7
          : blockSizeHorizontal! * 6;

  static double get buttonSmallHeight => isMobile
      ? blockSizeHorizontal! * 14
      : isTablet
          ? blockSizeHorizontal! * 13
          : blockSizeHorizontal! * 8;
}
