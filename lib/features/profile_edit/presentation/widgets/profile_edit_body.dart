import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/auth/auth_bloc.dart';
import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/other/password_checkbox.dart';
import '../../../../core/presentation/widgets/text_fields/casual_text_field.dart';
import '../../../../core/presentation/widgets/text_fields/password_text_field.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/profile_edit_bloc.dart';
import 'profile_edit_password_verify_dialog.dart';
import 'profile_edit_user_image.dart';
import 'profile_edit_user_image_dialog.dart';

class ProfileEditBody extends StatefulWidget {
  const ProfileEditBody({
    super.key,
  });

  @override
  State<ProfileEditBody> createState() => _ProfileEditBodyState();
}

class _ProfileEditBodyState extends State<ProfileEditBody> {
  late final TextEditingController _emailController;
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController = TextEditingController()
    ..addListener(_passwordListener);
  late final TextEditingController _newPasswordController =
      TextEditingController()..addListener(_newPasswordListener);

  @override
  void initState() {
    _emailController =
        TextEditingController(text: context.read<AuthBloc>().state.user?.email)
          ..addListener(_emailListener);
    _usernameController = TextEditingController(
        text: context.read<AuthBloc>().state.user?.username)
      ..addListener(_usernameListener);
    super.initState();
  }

  void _emailListener() => () => context
      .read<ProfileEditBloc>()
      .add(ProfileEditEvent.changeEmail(_emailController.text.trim()));

  void _usernameListener() => context
      .read<ProfileEditBloc>()
      .add(ProfileEditEvent.changeUsername(_usernameController.text.trim()));

  void _passwordListener() => context
      .read<ProfileEditBloc>()
      .add(ProfileEditEvent.changePassword(_passwordController.text.trim()));

  void _newPasswordListener() => context.read<ProfileEditBloc>().add(
      ProfileEditEvent.changeNewPassword(_newPasswordController.text.trim()));

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
    final state = context.watch<ProfileEditBloc>().state;
    final userImage =
        context.select<AuthBloc, String?>((bloc) => bloc.state.user?.image);
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  ProfileEditUserImage(
                    onTap: () {
                      if (userImage == null) {
                        context
                            .read<ProfileEditBloc>()
                            .add(const ProfileEditEvent.pickImage());
                      } else {
                        showDialog(
                          context: context,
                          builder: (dialogContext) =>
                              ProfileEditUserImageDialog(
                            onUpload: () {
                              context
                                  .read<ProfileEditBloc>()
                                  .add(const ProfileEditEvent.pickImage());
                              Navigator.of(dialogContext).pop();
                            },
                            onDelete: () {
                              context
                                  .read<ProfileEditBloc>()
                                  .add(const ProfileEditEvent.deleteImage());
                              Navigator.of(dialogContext).pop();
                            },
                          ),
                        );
                      }
                    },
                    userImage: userImage,
                    pickedImage: state.image,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeAnimationX(
                    delay: .3,
                    child: CasualTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      isValidated: state.validation.isEmailValidated,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeAnimationX(
                    delay: .4,
                    child: CasualTextField(
                      controller: _usernameController,
                      hintText: 'Username',
                      isValidated: state.validation.isUsernameValidated,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (state.newPassword != null)
                    FadeAnimationX(
                      delay: .3,
                      child: Column(
                        children: [
                          PasswordTextField(
                            passwordController: _newPasswordController,
                            hint: 'New password',
                            isAvailable: true,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 32,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                PasswordCheckBox(
                                  requirement: '6+ characters',
                                  isValidated: state.validation
                                      .passwordValidation.isPassLongEnough,
                                ),
                                PasswordCheckBox(
                                  requirement: '1 upper case letter',
                                  isValidated: state
                                      .validation
                                      .passwordValidation
                                      .isPassHasUpperCaseLetter,
                                ),
                                PasswordCheckBox(
                                  requirement: '1 lower case letter',
                                  isValidated: state
                                      .validation
                                      .passwordValidation
                                      .isPassHasLowerCaseLetter,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  FadeAnimationX(
                    key: const ValueKey('toggle_password_button_anim'),
                    delay: .5,
                    child: TextButton(
                      onPressed: () => context
                          .read<ProfileEditBloc>()
                          .add(const ProfileEditEvent.toggleEditPassword()),
                      child: Text(
                        state.newPassword != null
                            ? 'Hide password'
                            : 'Edit password',
                        style: kMedium.copyWith(
                          color: kLightBlue,
                          fontSize: SizeConfig.body2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadeAnimationX(
                    delay: .6,
                    child: CasualButton(
                      onTap: () => showDialog(
                        context: context,
                        builder: (dialogContext) =>
                            ProfileEditPasswordVerifyDialog(
                          onTap: () {
                            context
                                .read<ProfileEditBloc>()
                                .add(const ProfileEditEvent.editProfile());
                            Navigator.of(dialogContext).pop();
                          },
                          passwordController: _passwordController,
                        ),
                      ),
                      isEnabled: state.isAvailable,
                      text: 'EDIT',
                      fontSize: SizeConfig.body1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
