import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class SliverGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item, int index) child;
  const SliverGridView({
    super.key,
    required this.items,
    required this.child,
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
        crossAxisCount: SizeConfig.isMobile
            ? 2
            : SizeConfig.isTablet
                ? 3
                : 5,
        crossAxisSpacing: SizeConfig.isMobile
            ? SizeConfig.setPadding(10)
            : SizeConfig.isTablet
                ? SizeConfig.setPadding(12)
                : SizeConfig.setPadding(15),
        mainAxisSpacing: SizeConfig.isMobile
            ? SizeConfig.setPadding(10)
            : SizeConfig.isTablet
                ? SizeConfig.setPadding(12)
                : SizeConfig.setPadding(15),
        childAspectRatio: .7,
      ),
    );
  }
}
