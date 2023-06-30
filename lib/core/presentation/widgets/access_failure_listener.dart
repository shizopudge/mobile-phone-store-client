import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../features/auth/presentation/pages/auth_page.dart';
import '../../failure/failure.dart';
import '../../utils/popup_utils.dart';

class AccessListener extends StatelessWidget {
  final Widget child;
  const AccessListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        final AuthStatus status = state.status;
        status.when(failure: () {
          final Failure failure = state.failure;
          if (failure is ServerFailure && failure.statusCode == 401) {
            PopupUtils.showFailureSnackBar(
              context: context,
              failure: state.failure,
            );
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AuthPage.path, (route) => false);
          } else {
            PopupUtils.showFailureSnackBar(
              context: context,
              failure: state.failure,
            );
          }
        });
      },
      child: child,
    );
  }
}
