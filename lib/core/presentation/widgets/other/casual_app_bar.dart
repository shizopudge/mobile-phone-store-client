import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class CasualAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final bool canGoBack;
  const CasualAppBar({
    super.key,
    required this.title,
    this.backgroundColor = kWhite,
    this.actions,
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
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: kBold.copyWith(
          fontSize: SizeConfig.h3,
          color: kDarkBlue,
        ),
      ),
      leading: canGoBack
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back,
                size: SizeConfig.iconMedium,
                color: kDarkBlue,
              ),
            )
          : null,
      actions: actions,
    );
  }
}
