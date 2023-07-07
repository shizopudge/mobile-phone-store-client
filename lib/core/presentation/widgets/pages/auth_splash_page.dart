import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../features/home/pages/home_page.dart';
import '../../../../features/login/presentation/pages/login_page.dart';
import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../loading/casual_loader.dart';

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
      child: Scaffold(
        backgroundColor: kWhite,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'MOBILE STORE',
                  textAlign: TextAlign.center,
                  style: kSemiBold.copyWith(
                    fontSize: SizeConfig.h3,
                    color: kDarkBlue,
                    letterSpacing: 6.4,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const CasualLoader(
                color: kDarkBlue,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
