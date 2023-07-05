import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/auth/auth_bloc.dart';
import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../buttons/casual_text_button.dart';

class UnauthorizedPage extends StatelessWidget {
  final String text;
  const UnauthorizedPage({
    super.key,
    this.text = 'You are not authorized',
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: kMedium.copyWith(
                    fontSize: SizeConfig.h2,
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
      ),
    );
  }
}
