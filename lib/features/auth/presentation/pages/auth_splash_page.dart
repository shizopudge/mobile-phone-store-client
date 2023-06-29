import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/utils/popup_utils.dart';
import '../bloc/auth_bloc.dart';

class AuthSplashPage extends StatelessWidget {
  const AuthSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        final AuthStatus status = state.status;
        status.when(
          authorized: () => Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false),
          notAuthorized: () => Navigator.of(context)
              .pushNamedAndRemoveUntil('/auth', (route) => false),
          guest: () => Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false),
          failure: () {
            PopupUtils.showFailureSnackBar(
                context: context, failure: state.failure);
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/auth', (route) => false);
          },
        );
      },
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
