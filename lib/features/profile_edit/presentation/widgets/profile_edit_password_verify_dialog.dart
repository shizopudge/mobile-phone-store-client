import 'package:flutter/material.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/other/casual_dialog.dart';
import '../../../../core/presentation/widgets/text_fields/password_text_field.dart';

class ProfileEditPasswordVerifyDialog extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController _passwordController;
  const ProfileEditPasswordVerifyDialog({
    super.key,
    required TextEditingController passwordController,
    required this.onTap,
  }) : _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    return FadeAnimationYDown(
      delay: 0,
      child: CasualDialog(
        title: 'Password verify',
        subtitle: 'We need to verify your password to edit profile',
        innerPadding: 12,
        child: Column(
          children: [
            PasswordTextField(
              passwordController: _passwordController,
              isAvailable: true,
              autofocus: true,
            ),
            const SizedBox(
              height: 24,
            ),
            CasualButton(
              isEnabled: true,
              text: 'Next',
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
