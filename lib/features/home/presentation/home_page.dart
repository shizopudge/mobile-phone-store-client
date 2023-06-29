import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/failures/failure.dart';
import '../../../core/presentation/widgets/overlapping_loader.dart';

import '../../../core/styles/styles.dart';
import '../../../core/utils/popup_utils.dart';
import '../../auth/presentation/bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthBloc>().state;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        final AuthStatus status = state.status;
        status.when(
            notAuthorized: () => Navigator.of(context)
                .pushNamedAndRemoveUntil('/auth', (route) => false),
            failure: () {
              final Failure failure = state.failure;
              if (failure is ServerFailure && failure.statusCode == 401) {
                PopupUtils.showFailureSnackBar(
                  context: context,
                  failure: state.failure,
                );
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/auth', (route) => false);
              } else {
                PopupUtils.showFailureSnackBar(
                  context: context,
                  failure: state.failure,
                );
              }
            });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            backgroundColor: kWhite,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.currentUser?.email ?? 'Guest'),
                  if (state.currentUser != null)
                    TextButton(
                      onPressed: () => context
                          .read<AuthBloc>()
                          .add(const AuthEvent.logout()),
                      child: Text(
                        'Logout',
                        style: kSemiBold.copyWith(
                          fontSize: 18,
                          color: kDarkBlue,
                        ),
                      ),
                    )
                  else if (state.currentUser == null)
                    TextButton(
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(const AuthEvent.dropState());
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/auth', (route) => false);
                      },
                      child: Text(
                        'Sign in',
                        style: kSemiBold.copyWith(
                          fontSize: 18,
                          color: kDarkBlue,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          if (state.status.isLoading) const OverlappingLoader(),
        ],
      ),
    );
  }
}
