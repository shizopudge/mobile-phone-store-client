import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../../animations/fade_animation_y_down.dart';

class ResultsEnd extends StatelessWidget {
  const ResultsEnd({
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
              'You have viewed all results that match your search',
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
