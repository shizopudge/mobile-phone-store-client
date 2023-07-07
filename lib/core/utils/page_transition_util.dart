import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PageTransitionUtil {
  static PageTransition go({
    required Widget page,
    Duration duration = const Duration(milliseconds: 200),
    PageTransitionType type = PageTransitionType.fade,
  }) =>
      PageTransition(
        child: page,
        type: type,
        duration: duration,
      );
}
