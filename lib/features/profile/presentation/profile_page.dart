import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/failure/failure.dart';
import '../../../core/presentation/widgets/access_failure_listener.dart';
import '../../../core/presentation/widgets/casual_app_bar.dart';
import '../../../core/presentation/widgets/error_page.dart';
import '../../../core/presentation/widgets/overlapping_loader.dart';
import '../../../core/styles/styles.dart';
import '../../auth/domain/entities/current_user.dart';
import '../../auth/presentation/bloc/auth_bloc.dart';
import '../../auth/presentation/pages/auth_page.dart';
import 'widgets/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.select<AuthBloc, CurrentUser?>(
      (bloc) => bloc.state.currentUser,
    );
    final isLoading =
        context.select<AuthBloc, bool>((bloc) => bloc.state.status.isLoading);
    if (currentUser == null) {
      return ErrorPage(
        failure: const ServerFailure(
            message: 'You are not authorized', statusCode: 401),
        action: TextButton(
          onPressed: () => Navigator.of(context)
              .pushNamedAndRemoveUntil(AuthPage.path, (route) => false),
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
    return AccessListener(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            backgroundColor: kWhite,
            appBar: const CasualAppBar(
              title: 'My profile',
            ),
            body: SingleChildScrollView(
                child: ProfileBody(currentUser: currentUser)),
          ),
          if (isLoading) const OverlappingLoader(),
        ],
      ),
    );
  }
}
