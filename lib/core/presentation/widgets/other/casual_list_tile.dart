import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class CasualListTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String? subtitle;
  const CasualListTile({
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
          fontSize: SizeConfig.body1,
          color: kDarkBlue,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: kBold.copyWith(
                fontSize: SizeConfig.body2,
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
