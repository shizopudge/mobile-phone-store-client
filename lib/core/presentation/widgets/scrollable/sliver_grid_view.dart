import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class SliverGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) child;
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
        return child(item);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: SizeConfig.isMobile ? 2 : 4,
        crossAxisSpacing: SizeConfig.isMobile ? 15 : 40,
        mainAxisSpacing: SizeConfig.isMobile ? 15 : 40,
        childAspectRatio: .7,
      ),
    );
  }
}
