import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/login/presentation/login_page.dart';
import '../../../logic/auth/auth_bloc.dart';

class AccessListener extends StatelessWidget {
  final Widget child;
  const AccessListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => state.callWhen(
        unauthorized: () => Navigator.of(context)
            .pushNamedAndRemoveUntil(LoginPage.path, (route) => false),
        failure: () => state.failure.callUnauthorized(context),
      ),
      child: child,
    );
  }
}
