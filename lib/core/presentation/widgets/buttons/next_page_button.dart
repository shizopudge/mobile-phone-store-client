import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import '../../animations/fade_animation_y_down.dart';
import 'casual_button.dart';

class LoadMoreButton extends StatelessWidget {
  final VoidCallback onTap;
  final ValueNotifier<bool> _showNextButton;

  const LoadMoreButton({
    super.key,
    required this.onTap,
    required ValueNotifier<bool> showNextButton,
  }) : _showNextButton = showNextButton;

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
        child: ValueListenableBuilder(
          valueListenable: _showNextButton,
          builder: (context, showNextButton, _) => Center(
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 0),
              offset: Offset(0, showNextButton ? 0 : 1),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 0),
                opacity: showNextButton ? 1 : 0,
                child: FadeAnimationYDown(
                  delay: .1,
                  child: CasualButton(
                    onTap: onTap,
                    borderRadius: SizeConfig.borderRadiusSmall,
                    text: 'Load more',
                    expand: false,
                    fontSize: SizeConfig.body1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
