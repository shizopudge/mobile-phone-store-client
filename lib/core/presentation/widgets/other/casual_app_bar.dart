import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class CasualAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onPop;
  final Color? backgroundColor;
  const CasualAppBar({
    super.key,
    required this.title,
    this.backgroundColor = kWhite,
    this.onPop,
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
      leading: onPop != null
          ? IconButton(
              onPressed: () {
                onPop!();
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
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
