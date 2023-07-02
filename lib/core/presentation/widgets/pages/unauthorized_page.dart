import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../failure/failure.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../../styles/styles.dart';
import 'error_page.dart';

class UnauthorizedPage extends StatelessWidget {
  const UnauthorizedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorPage(
      failure: const UnknownFailure(message: 'You are not authorized'),
      action: TextButton(
        onPressed: () => context.read<AuthBloc>().add(const AuthEvent.setState(
            AuthState(status: AuthStatus.unauthorized))),
        child: Text(
          'Sign in',
          style: kSemiBold.copyWith(
            fontSize: 21,
            color: kLightBlue,
          ),
        ),
      ),
    );
  }
}
