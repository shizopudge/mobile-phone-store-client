import 'package:flutter/material.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/fonts.dart';

class CasualDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final double innerPadding;
  const CasualDialog({
    super.key,
    required this.child,
    required this.title,
    required this.subtitle,
    this.innerPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationYDown(
      delay: 0,
      child: SimpleDialog(
        elevation: 0,
        backgroundColor: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        insetPadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.all(20.0),
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Image actions',
                      overflow: TextOverflow.visible,
                      style: kBold.copyWith(
                        fontSize: 24,
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                  CloseButton(
                    color: kLightBlue,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              SizedBox(
                height: innerPadding,
              ),
              Text(
                'What you want to do with your profile image?',
                overflow: TextOverflow.visible,
                style: kRegular.copyWith(
                  fontSize: 16,
                  color: kGrey,
                ),
              ),
              SizedBox(
                height: innerPadding,
              ),
              child,
            ],
          ),
        ],
      ),
    );
  }
}
