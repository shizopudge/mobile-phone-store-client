import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class CasualLoader extends StatefulWidget {
  final Color color;
  final double? height;
  const CasualLoader({
    super.key,
    this.color = kWhite,
    this.height,
  });

  @override
  State<CasualLoader> createState() => _CasualLoaderState();
}

class _CasualLoaderState extends State<CasualLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.rotate(
        angle: _controller.value * 2 * math.pi,
        child: SvgPicture.asset(
          'assets/icons/loader.svg',
          height: widget.height ??
              (SizeConfig.isMobile
                  ? SizeConfig.screenWidth! * .15
                  : SizeConfig.isTablet
                      ? SizeConfig.screenWidth! * .1
                      : SizeConfig.screenWidth! * .055),
          colorFilter: ColorFilter.mode(widget.color, BlendMode.srcIn),
        ),
      ),
    );
  }
}
