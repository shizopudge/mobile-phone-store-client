import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class ProfileListTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String? subtitle;
  const ProfileListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: kBold.copyWith(
          fontSize: SizeConfig.fontTitle,
          color: kDarkBlue,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: kBold.copyWith(
                fontSize: SizeConfig.fontSubtitle,
                color: kGrey,
              ),
            )
          : null,
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: SizeConfig.iconSmall,
        color: kGrey,
      ),
    );
  }
}
