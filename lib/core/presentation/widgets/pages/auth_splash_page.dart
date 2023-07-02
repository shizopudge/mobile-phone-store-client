import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/home/home_page.dart';
import '../../../../features/login/presentation/login_page.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../../styles/styles.dart';

class AuthSplashPage extends StatelessWidget {
  static const String path = '/';
  const AuthSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    fontSize: 42,
                    color: kDarkBlue,
                    letterSpacing: 6.4,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const CircularProgressIndicator(
                strokeWidth: 1.5,
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
