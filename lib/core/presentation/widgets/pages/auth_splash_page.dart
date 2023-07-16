import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../features/home/pages/home_page.dart';
import '../../../../features/login/presentation/pages/login_page.dart';
import '../../../utils/size_config.dart';
import 'casual_splash_page.dart';

class AuthSplashPage extends StatelessWidget {
  static const String path = '/';
  const AuthSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => state.callWhen(
        authorized: () => Navigator.of(context)
            .pushNamedAndRemoveUntil(HomePage.path, (route) => false),
        unauthorized: () => Navigator.of(context)
            .pushNamedAndRemoveUntil(LoginPage.path, (route) => false),
        guest: () => Navigator.of(context)
            .pushNamedAndRemoveUntil(HomePage.path, (route) => false),
        failure: () => Navigator.of(context)
            .pushNamedAndRemoveUntil(LoginPage.path, (route) => false),
      ),
      child: const CasualSplashPage(),
    );
  }
}
