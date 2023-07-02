import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/repositories/image/image_repository_impl.dart';
import '../../../core/di/get_it.dart';
import '../../../core/domain/entities/current_user.dart';
import '../../../core/domain/usecases/image/pick_image.dart';
import '../../../core/failure/failure.dart';
import '../../../core/logic/auth/auth_bloc.dart';
import '../../../core/presentation/widgets/access_listener.dart';
import '../../../core/presentation/widgets/casual_app_bar.dart';
import '../../../core/presentation/widgets/pages/error_page.dart';
import '../../../core/presentation/widgets/stack_loading.dart';
import '../../../core/styles/styles.dart';
import '../../../core/utils/popup_utils.dart';
import '../data/repositories/profile_edit_repository_impl.dart';
import '../domain/usecases/delete_image.dart';
import '../domain/usecases/edit_profile.dart';
import '../domain/usecases/upload_image.dart';
import 'bloc/profile_edit_bloc.dart';
import 'widgets/profile_edit_body.dart';

class ProfileEditPage extends StatefulWidget {
  static const String path = '/profile-edit';
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _newPasswordController =
      TextEditingController();

  @override
  void initState() {
    _emailController =
        TextEditingController(text: context.read<AuthBloc>().state.user?.email);
    _usernameController = TextEditingController(
        text: context.read<AuthBloc>().state.user?.username);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AccessListener(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final CurrentUser? user = state.user;
          if (user != null && state.isAuthorized) {
            return BlocProvider(
              create: (_) => ProfileEditBloc(
                  editProfileUsecase:
                      EditProfile(getIt<ProfileEditRepositoryImpl>()),
                  uploadUserImageUsecase:
                      UploadUserImage(getIt<ProfileEditRepositoryImpl>()),
                  pickImageUsecase: PickImage(getIt<ImageRepositoryImpl>()),
                  deleteUserImageUsecase:
                      DeleteUserImage(getIt<ProfileEditRepositoryImpl>()))
                ..add(ProfileEditEvent.initial(user)),
              child: BlocListener<ProfileEditBloc, ProfileEditState>(
                listenWhen: (previous, current) =>
                    current.status.isSuccess || current.status.isFailure,
                listener: (context, state) {
                  final ProfileEditStatus status = state.status;
                  status.callWhen(
                    success: () {
                      final currentUser = state.currentUser;
                      if (currentUser != null) {
                        context
                            .read<AuthBloc>()
                            .add(AuthEvent.setUser(currentUser));
                        Navigator.of(context).pop();
                      } else {
                        PopupUtils.showFailureSnackBar(
                          context: context,
                          failure: const UnknownFailure(),
                        );
                      }
                    },
                    failure: () => state.failure.call(context),
                  );
                },
                child: BlocBuilder<ProfileEditBloc, ProfileEditState>(
                  builder: (context, state) => StackLoading(
                    isLoading: state.status.isLoading,
                    child: Scaffold(
                      backgroundColor: kWhite,
                      appBar: const CasualAppBar(
                        title: 'Edit profile',
                        canGoBack: true,
                      ),
                      body: LayoutBuilder(
                        builder: (context, constraints) =>
                            SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: constraints.maxHeight),
                            child: IntrinsicHeight(
                              child: ProfileEditBody(
                                context: context,
                                userImage: user.image,
                                emailController: _emailController,
                                usernameController: _usernameController,
                                passwordController: _passwordController,
                                newPasswordController: _newPasswordController,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return const ErrorPage();
        },
      ),
    );
  }
}
