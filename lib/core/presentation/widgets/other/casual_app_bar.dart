import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

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
  Size get preferredSize => Size.fromHeight(SizeConfig.isMobile
      ? SizeConfig.screenWidth! * .12
      : SizeConfig.isTablet
          ? SizeConfig.screenWidth! * .07
          : SizeConfig.screenWidth! * .05);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AppBar(
      toolbarHeight: preferredSize.height,
      centerTitle: false,
      backgroundColor: backgroundColor,
      leading: canGoBack
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios,
                size: SizeConfig.iconMedium,
                color: kDarkBlue,
              ),
            )
          : null,
      title: Text(
        title,
        style: kBold.copyWith(
          fontSize: SizeConfig.h3,
          color: kDarkBlue,
        ),
      ),
    );
  }
}
