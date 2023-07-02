import 'package:flutter/material.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/casual_dialog.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/fonts.dart';

class ProfileEditUserImageDialog extends StatelessWidget {
  final VoidCallback onUpload;
  final VoidCallback onDelete;
  const ProfileEditUserImageDialog({
    super.key,
    required this.onUpload,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimationYDown(
      delay: 0,
      child: CasualDialog(
          title: 'Image actions',
          subtitle: 'What you want to do with your profile image?',
          innerPadding: 12,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: onUpload,
                    color: kDarkBlue,
                    minWidth: double.infinity,
                    height: 50,
                    child: Text(
                      'Upload image',
                      style: kSemiBold.copyWith(
                        fontSize: 18,
                        color: kWhite,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  MaterialButton(
                    onPressed: onDelete,
                    color: kRed,
                    minWidth: double.infinity,
                    height: 50,
                    child: Text(
                      'Delete image',
                      style: kSemiBold.copyWith(
                        fontSize: 18,
                        color: kWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
