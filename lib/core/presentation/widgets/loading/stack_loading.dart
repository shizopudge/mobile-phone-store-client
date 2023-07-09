import 'package:flutter/material.dart';

import 'overlapping_loader.dart';

class StackLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Widget? loader;
  const StackLoading(
      {super.key, required this.isLoading, required this.child, this.loader});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        if (isLoading) loader ?? const OverlappingLoader(),
      ],
    );
  }
}
