import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/login_bloc.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.setHeightByFactor(.075));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: preferredSize.height,
      backgroundColor: kWhite,
      titleSpacing: 0,
      actions: [
        TextButton(
          onPressed: () =>
              context.read<LoginBloc>().add(const LoginEvent.loginAsGuest()),
          child: AutoSizeText(
            'Skip',
            minFontSize: 0,
            style: kBold.copyWith(
              color: kGrey,
              fontSize: SizeConfig.body2,
            ),
          ),
        ),
      ],
    );
  }
}
