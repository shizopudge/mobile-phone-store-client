import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../../animations/fade_animation_y_down.dart';

class ProductsEnd extends StatelessWidget {
  const ProductsEnd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
          top: SizeConfig.setPadding(20),
          bottom: SizeConfig.setPadding(SizeConfig.isMobile
              ? 75
              : SizeConfig.isTablet
                  ? 60
                  : 50)),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: FadeAnimationYDown(
            delay: .5,
            child: Text(
              'You have viewed all products that match your search',
              textAlign: TextAlign.center,
              style: kMedium.copyWith(
                color: kDarkBlue,
                fontSize: SizeConfig.body2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
