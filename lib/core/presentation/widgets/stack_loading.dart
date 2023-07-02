import 'package:flutter/material.dart';

import 'overlapping_loader.dart';

class StackLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const StackLoading({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (isLoading) const OverlappingLoader(),
      ],
    );
  }
}
