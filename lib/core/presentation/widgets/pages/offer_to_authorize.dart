import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/auth/auth_bloc.dart';
import '../../../styles/styles.dart';
import '../buttons/casual_text_button.dart';

class OfferToAuthorize extends StatelessWidget {
  const OfferToAuthorize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'To access the full functionality, you need to log in or register an account',
                textAlign: TextAlign.center,
                style: kMedium.copyWith(
                  fontSize: 21,
                  color: kDarkBlue,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CasualTextButton(
                onTap: () => context.read<AuthBloc>().add(
                    const AuthEvent.setState(
                        AuthState(status: AuthStatus.unauthorized))),
                text: 'Sign in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
