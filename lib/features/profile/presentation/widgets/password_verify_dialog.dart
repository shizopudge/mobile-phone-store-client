import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/other/casual_dialog.dart';
import '../../../../core/presentation/widgets/text_fields/password_text_field.dart';
import '../../../../core/utils/size_config.dart';

class PasswordVerifyDialog extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController _passwordController;
  const PasswordVerifyDialog({
    super.key,
    required TextEditingController passwordController,
    required this.onTap,
  }) : _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    return CasualDialog(
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
          SizedBox(
            height: SizeConfig.setPadding(15),
          ),
          CasualButton(
            text: 'Next',
            onTap: onTap,
            fontSize: SizeConfig.body2,
          ),
        ],
      ),
    );
  }
}
