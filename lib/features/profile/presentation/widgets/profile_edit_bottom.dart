import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/utils/size_config.dart';

class ProfileEditBottom extends StatelessWidget {
  final VoidCallback onEditTap;
  final bool isAvailable;
  const ProfileEditBottom({
    super.key,
    required this.onEditTap,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return CasualButton(
      onTap: onEditTap,
      isEnabled: isAvailable,
      text: 'EDIT',
      fontSize: SizeConfig.body1,
    );
  }
}
