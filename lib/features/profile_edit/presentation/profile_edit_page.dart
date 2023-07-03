import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/repositories/image/image_repository_impl.dart';
import '../../../core/di/get_it.dart';
import '../../../core/domain/usecases/image/pick_image.dart';
import '../../../core/logic/auth/auth_bloc.dart';
import '../../../core/presentation/widgets/loading/stack_loading.dart';
import '../../../core/presentation/widgets/other/access_listener.dart';
import '../../../core/presentation/widgets/other/casual_app_bar.dart';
import '../../../core/styles/styles.dart';
import '../../../core/utils/size_config.dart';
import '../data/repositories/profile_edit_repository_impl.dart';
import '../domain/usecases/delete_image.dart';
import '../domain/usecases/edit_profile.dart';
import '../domain/usecases/upload_image.dart';
import 'bloc/profile_edit_bloc.dart';
import 'widgets/profile_edit_body.dart';

class ProfileEditPage extends StatelessWidget {
  static const String path = '/profile-edit';
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AccessListener(
      child: BlocProvider(
        create: (_) => ProfileEditBloc(
            authBloc: getIt<AuthBloc>(),
            editProfileUsecase: EditProfile(getIt<ProfileEditRepositoryImpl>()),
            uploadUserImageUsecase:
                UploadUserImage(getIt<ProfileEditRepositoryImpl>()),
            pickImageUsecase: PickImage(getIt<ImageRepositoryImpl>()),
            deleteUserImageUsecase:
                DeleteUserImage(getIt<ProfileEditRepositoryImpl>()))
          ..add(const ProfileEditEvent.initial()),
        child: BlocConsumer<ProfileEditBloc, ProfileEditState>(
          listenWhen: (previous, current) =>
              current.status.isSuccess || current.status.isFailure,
          listener: (context, state) {
            final ProfileEditStatus status = state.status;
            status.callWhen(
              success: () => Navigator.of(context).pop(),
              failure: () => state.failure.call(context),
            );
          },
          builder: (context, state) => StackLoading(
            isLoading: state.status.isLoading,
            child: const Scaffold(
              backgroundColor: kWhite,
              appBar: CasualAppBar(
                title: 'Edit profile',
                canGoBack: true,
              ),
              body: ProfileEditBody(),
            ),
          ),
        ),
      ),
    );
  }
}
