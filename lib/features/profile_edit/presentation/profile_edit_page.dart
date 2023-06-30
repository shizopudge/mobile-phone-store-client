import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/api/dio_client.dart';
import '../../../core/di/get_it.dart';
import '../../../core/failure/failure.dart';
import '../../../core/presentation/widgets/access_failure_listener.dart';
import '../../../core/presentation/widgets/casual_app_bar.dart';
import '../../../core/presentation/widgets/error_page.dart';
import '../../../core/styles/styles.dart';
import '../../auth/domain/entities/current_user.dart';
import '../../auth/presentation/bloc/auth_bloc.dart';
import '../../auth/presentation/pages/auth_page.dart';
import '../data/datasources/profile_edit_remote_data_source.dart';
import '../data/repositories/profile_edit_repository_impl.dart';
import '../domain/usecases/edit_profile.dart';
import 'bloc/profile_edit_bloc.dart';
import 'widgets/profile_edit_body.dart';

class ProfileEditPage extends StatelessWidget {
  static const String path = '/profile-edit';
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.select<AuthBloc, CurrentUser?>(
      (bloc) => bloc.state.currentUser,
    );
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
      child: BlocProvider(
        create: (_) => ProfileEditBloc(
            editProfileUsecase: EditProfile(ProfileEditRepositoryImpl(
                ProfileEditRemoteDataSourceImpl(getIt<DioClient>()))))
          ..add(ProfileEditEvent.initial(currentUser)),
        child: BlocListener<ProfileEditBloc, ProfileEditState>(
          listenWhen: (previous, current) => current.status.isSuccess,
          listener: (context, state) {
            // context.read<AuthBloc>().add(AuthEvent.updateUser);
          },
          child: Scaffold(
            backgroundColor: kWhite,
            appBar: const CasualAppBar(
              title: 'Edit profile',
              canGoBack: true,
            ),
            body: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: const IntrinsicHeight(
                    child: ProfileEditBody(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
