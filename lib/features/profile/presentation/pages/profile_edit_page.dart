import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_y_up.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/dialogs/actions_dialog.dart';
import '../../../../core/presentation/widgets/loading/stack_loading.dart';
import '../../../../core/presentation/widgets/other/access_listener.dart';
import '../../../../core/presentation/widgets/other/casual_app_bar.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/password_verify_dialog.dart';
import '../widgets/profile_edit_body.dart';

class ProfileEditPage extends StatefulWidget {
  static const String path = '/profile-edit';
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late final TextEditingController _emailController =
      TextEditingController(text: context.read<AuthBloc>().state.user?.email)
        ..addListener(_emailListener);
  late final TextEditingController _usernameController =
      TextEditingController(text: context.read<AuthBloc>().state.user?.username)
        ..addListener(_usernameListener);
  late final TextEditingController _passwordController = TextEditingController()
    ..addListener(_passwordListener);
  late final TextEditingController _newPasswordController =
      TextEditingController()..addListener(_newPasswordListener);

  void _emailListener() => context
      .read<ProfileBloc>()
      .add(ProfileEvent.changeEmail(_emailController.text.trim()));

  void _usernameListener() => context
      .read<ProfileBloc>()
      .add(ProfileEvent.changeUsername(_usernameController.text.trim()));

  void _passwordListener() => context
      .read<ProfileBloc>()
      .add(ProfileEvent.changePassword(_passwordController.text.trim()));

  void _newPasswordListener() => context
      .read<ProfileBloc>()
      .add(ProfileEvent.changeNewPassword(_newPasswordController.text.trim()));

  void _onProfileImageTap(String? userImage) {
    if (userImage == null) {
      context.read<ProfileBloc>().add(const ProfileEvent.pickImage());
    } else {
      showDialog(
        context: context,
        builder: (dialogContext) => ActionsDialog(
          title: 'Image actions',
          subtitle: 'What you want to do with image?',
          actions: [
            CasualButton(
              text: 'Upload image',
              onTap: () {
                context.read<ProfileBloc>().add(const ProfileEvent.pickImage());
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kDarkBlue,
              height: 45,
              fontSize: SizeConfig.body2,
            ),
            CasualButton(
              text: 'Delete image',
              onTap: () {
                context
                    .read<ProfileBloc>()
                    .add(const ProfileEvent.deleteImage());
                Navigator.of(dialogContext).pop();
              },
              enabledBgColor: kRed,
              height: 45,
              fontSize: SizeConfig.body2,
            ),
          ],
        ),
      );
    }
  }

  void _onEditTap() => showDialog(
        context: context,
        builder: (dialogContext) => PasswordVerifyDialog(
          onTap: () {
            context.read<ProfileBloc>().add(const ProfileEvent.editProfile());
            Navigator.of(dialogContext).pop();
          },
          passwordController: _passwordController,
        ),
      );

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
    SizeConfig.init(context);
    return AccessListener(
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listenWhen: (previous, current) =>
            current.status.isSuccess || current.status.isFailure,
        listener: (context, state) => state.callWhen(
          success: () => Navigator.of(context).pop(),
          failure: () => state.failure.call(context),
        ),
        builder: (context, state) => StackLoading(
          isLoading: state.status.isLoading,
          child: Scaffold(
            backgroundColor: kWhite,
            appBar: CasualAppBar(
              title: 'Edit profile',
              onPop: () {},
            ),
            body: Column(
              children: [
                Expanded(
                  child: ProfileEditBody(
                    onProfileImageTap: _onProfileImageTap,
                    emailController: _emailController,
                    usernameController: _usernameController,
                    newPasswordController: _newPasswordController,
                  ),
                ),
                FadeAnimationYUp(
                  delay: .6,
                  child: CasualButton(
                    onTap: _onEditTap,
                    isEnabled: state.isAvailable,
                    text: 'EDIT',
                    fontSize: SizeConfig.body1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
