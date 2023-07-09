import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/other/casual_dialog.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/size_config.dart';

class EditUserImageDialog extends StatelessWidget {
  final VoidCallback onUpload;
  final VoidCallback onDelete;
  const EditUserImageDialog({
    super.key,
    required this.onUpload,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return CasualDialog(
        title: 'Image actions',
        subtitle: 'What you want to do with your profile image?',
        innerPadding: 12,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.setPadding(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CasualButton(
                  text: 'Upload image',
                  onTap: onUpload,
                  enabledBgColor: kDarkBlue,
                  height: 45,
                  fontSize: SizeConfig.body2,
                ),
                SizedBox(
                  height: SizeConfig.setPadding(12),
                ),
                CasualButton(
                  text: 'Delete image',
                  onTap: onDelete,
                  enabledBgColor: kRed,
                  height: 45,
                  fontSize: SizeConfig.body2,
                ),
              ],
            ),
          ),
        ));
  }
}
