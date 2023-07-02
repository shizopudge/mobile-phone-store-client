import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/entities/current_user.dart';
import '../../../core/logic/auth/auth_bloc.dart';
import '../../../core/presentation/widgets/casual_app_bar.dart';
import '../../../core/presentation/widgets/pages/unauthorized_page.dart';
import '../../../core/styles/styles.dart';
import 'widgets/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final CurrentUser? user = state.user;
        if (user != null) {
          return Scaffold(
            backgroundColor: kWhite,
            appBar: const CasualAppBar(
              title: 'My profile',
            ),
            body: ProfileBody(
              currentUser: user,
            ),
          );
        }
        return const UnauthorizedPage();
      },
    );
  }
}
