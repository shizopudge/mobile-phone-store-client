import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../utils/size_config.dart';
import '../buttons/casual_button.dart';
import '../other/casual_dialog.dart';

class EditImageDialog extends StatelessWidget {
  final VoidCallback onUpload;
  final VoidCallback onDelete;
  const EditImageDialog({
    super.key,
    required this.onUpload,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return CasualDialog(
        title: 'Image actions',
        subtitle: 'What you want to do with image?',
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
