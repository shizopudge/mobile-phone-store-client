import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class SliverGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item, int index) child;
  final double? childAspectRatio;
  final int? crossAxisCount;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  const SliverGridView({
    super.key,
    required this.items,
    required this.child,
    this.childAspectRatio,
    this.crossAxisCount,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        final T item = items[i];
        return child(item, i);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ??
            (SizeConfig.isMobile
                ? 2
                : SizeConfig.isTablet
                    ? 3
                    : 6),
        crossAxisSpacing: crossAxisSpacing ??
            (SizeConfig.isMobile
                ? SizeConfig.setPadding(10)
                : SizeConfig.isTablet
                    ? SizeConfig.setPadding(12)
                    : SizeConfig.setPadding(15)),
        mainAxisSpacing: mainAxisSpacing ??
            (SizeConfig.isMobile
                ? SizeConfig.setPadding(10)
                : SizeConfig.isTablet
                    ? SizeConfig.setPadding(12)
                    : SizeConfig.setPadding(15)),
        childAspectRatio: childAspectRatio ?? .7,
      ),
    );
  }
}
