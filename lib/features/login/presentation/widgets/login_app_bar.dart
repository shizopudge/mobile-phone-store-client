import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/styles/styles.dart';
import '../bloc/login_bloc.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return FadeAnimationYDown(
      delay: 0,
      child: AppBar(
        backgroundColor: kWhite,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () =>
                context.read<LoginBloc>().add(const LoginEvent.loginAsGuest()),
            child: Text(
              'Skip',
              style: kBold.copyWith(color: kGrey, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}