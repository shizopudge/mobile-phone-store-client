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

  static bool get isMobile => screenWidth! < 650;

  static bool get isDesktop => screenWidth! >= 900;

  static double setHeightByFactor(double factor) {
    assert(!factor.isNegative, 'Factor cant be negative');
    assert(factor <= 1.0, 'Factor should be between 0.0 and 1.0');
    return screenHeight! * factor;
  }

  static double get h1 =>
      isMobile ? blockSizeHorizontal! * 8 : blockSizeVertical! * 5;

  static double get h2 =>
      isMobile ? blockSizeHorizontal! * 6.5 : blockSizeVertical! * 4.5;

  static double get body1 =>
      isMobile ? blockSizeHorizontal! * 5.5 : blockSizeVertical! * 4;

  static double get body2 =>
      isMobile ? blockSizeHorizontal! * 4.5 : blockSizeVertical! * 3.5;

  static double get body3 =>
      isMobile ? blockSizeHorizontal! * 4 : blockSizeVertical! * 3;

  static double get iconLarge =>
      isMobile ? blockSizeHorizontal! * 16 : blockSizeVertical! * 8;

  static double get iconMedium =>
      isMobile ? blockSizeHorizontal! * 8 : blockSizeVertical! * 6;

  static double get iconSmall =>
      isMobile ? blockSizeHorizontal! * 6 : blockSizeVertical! * 4;

  static double get radiusLarge =>
      isMobile ? blockSizeHorizontal! * 20 : blockSizeHorizontal! * 12;

  static double get radiusSmall =>
      isMobile ? blockSizeHorizontal! * 8 : blockSizeHorizontal! * 4;

  static double get borderRadius =>
      isMobile ? blockSizeHorizontal! * 5 : blockSizeHorizontal! * 3;
}
