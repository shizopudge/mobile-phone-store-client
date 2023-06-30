import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';

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
          fontSize: 21,
          color: kDarkBlue,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: kBold.copyWith(
                fontSize: 16,
                color: kGrey,
              ),
            )
          : null,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: kGrey,
      ),
    );
  }
}
