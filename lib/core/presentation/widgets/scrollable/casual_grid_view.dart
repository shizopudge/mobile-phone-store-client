import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../utils/size_config.dart';
import '../loading/casual_loader.dart';

class CasualGridView<T> extends StatelessWidget {
  final ScrollController scrollController;
  final List<T> items;
  final Widget Function(T item) child;
  final bool isRefreshing;
  final bool isPaginating;
  const CasualGridView({
    super.key,
    required this.scrollController,
    required this.items,
    required this.isRefreshing,
    required this.isPaginating,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isRefreshing) const CasualLoader(color: kLightBlue),
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              GridView.builder(
                controller: scrollController,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
                    top: SizeConfig.screenHeight! * .0015,
                    bottom: SizeConfig.screenHeight! * .1),
                itemCount: items.length,
                itemBuilder: (context, i) {
                  final T item = items[i];
                  return child(item);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: SizeConfig.isMobile ? 2 : 4,
                  crossAxisSpacing: SizeConfig.isMobile ? 10 : 20,
                  mainAxisSpacing: SizeConfig.isMobile ? 10 : 20,
                  childAspectRatio: .7,
                ),
              ),
            ],
          ),
        ),
        if (isPaginating) const CasualLoader(color: kLightBlue)
      ],
    );
  }
}
