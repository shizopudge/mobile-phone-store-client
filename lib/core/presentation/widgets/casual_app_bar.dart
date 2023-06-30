import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class CasualAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool canGoBack;
  final Color? backgroundColor;
  const CasualAppBar({
    super.key,
    required this.title,
    this.backgroundColor = kWhite,
    this.canGoBack = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: canGoBack
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kDarkBlue,
              ),
            )
          : null,
      title: Text(
        title,
        style: kBold.copyWith(
          fontSize: 32,
          color: kDarkBlue,
        ),
      ),
    );
  }
}
