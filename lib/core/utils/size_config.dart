import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static int initCount = 0;

  static void init(BuildContext context) {
    print(initCount);
    initCount++;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }

  static bool get isMobile => screenWidth! < 650;

  static bool get isTablet => screenWidth! >= 650 && screenWidth! <= 1100;

  static bool get isDesktop => screenWidth! > 1100;

  static double get h1 =>
      blockSizeHorizontal! *
      (isMobile
          ? 5.5
          : isTablet
              ? 4
              : 2.5);

  static double get h2 =>
      blockSizeHorizontal! *
      (isMobile
          ? 5
          : isTablet
              ? 3.5
              : 2);

  static double get body1 =>
      blockSizeHorizontal! *
      (isMobile
          ? 4.5
          : isTablet
              ? 3
              : 1.75);

  static double get body2 =>
      blockSizeHorizontal! *
      (isMobile
          ? 4
          : isTablet
              ? 2.5
              : 1.5);

  static double get body3 =>
      blockSizeHorizontal! *
      (isMobile
          ? 3.5
          : isTablet
              ? 2
              : 1.25);

  static double get iconLarge =>
      blockSizeHorizontal! *
      (isMobile
          ? 7
          : isTablet
              ? 4
              : 2.5);

  static double get iconMedium =>
      blockSizeHorizontal! *
      (isMobile
          ? 6
          : isTablet
              ? 3.5
              : 2);

  static double get iconSmall =>
      blockSizeHorizontal! *
      (isMobile
          ? 5
          : isTablet
              ? 3
              : 1.5);

  static double get radiusLarge =>
      blockSizeHorizontal! *
      (isMobile
          ? 18
          : isTablet
              ? 12
              : 8);

  static double get radiusSmall =>
      blockSizeHorizontal! *
      (isMobile
          ? 10
          : isTablet
              ? 8
              : 5);

  static double get borderRadiusDefault =>
      blockSizeHorizontal! *
      (isMobile
          ? 8
          : isTablet
              ? 5
              : 4);

  static double get borderRadiusSmall =>
      blockSizeHorizontal! *
      (isMobile
          ? 5
          : isTablet
              ? 4
              : 2.5);

  static double setPadding(double padding) =>
      padding *
      (isMobile
          ? 1
          : isTablet
              ? 1.5
              : 1.75);
}
