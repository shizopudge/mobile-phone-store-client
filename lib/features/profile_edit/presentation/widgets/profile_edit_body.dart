import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/casual_text_field.dart';
import '../../../../core/presentation/widgets/password_checkbox.dart';
import '../../../../core/presentation/widgets/password_text_field.dart';
import '../../../../core/styles/styles.dart';
import '../bloc/profile_edit_bloc.dart';
import 'profile_edit_password_verify_dialog.dart';
import 'profile_edit_user_image.dart';
import 'profile_edit_user_image_dialog.dart';

class ProfileEditBody extends StatelessWidget {
  final BuildContext profileEditPageContext;
  final String? userImage;
  final TextEditingController _emailController;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final TextEditingController _newPasswordController;
  ProfileEditBody({
    super.key,
    required this.userImage,
    required TextEditingController emailController,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required TextEditingController newPasswordController,
    required BuildContext context,
  })  : _emailController = emailController,
        _usernameController = usernameController,
        _passwordController = passwordController,
        _newPasswordController = newPasswordController,
        profileEditPageContext = context {
    _emailController.addListener(() => profileEditPageContext
        .read<ProfileEditBloc>()
        .add(ProfileEditEvent.changeEmail(_emailController.text.trim())));
    _usernameController.addListener(() => profileEditPageContext
        .read<ProfileEditBloc>()
        .add(ProfileEditEvent.changeUsername(_usernameController.text.trim())));
    _passwordController.addListener(() => profileEditPageContext
        .read<ProfileEditBloc>()
        .add(ProfileEditEvent.changePassword(_passwordController.text.trim())));
    _newPasswordController.addListener(() => profileEditPageContext
        .read<ProfileEditBloc>()
        .add(ProfileEditEvent.changeNewPassword(
            _newPasswordController.text.trim())));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProfileEditBloc>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
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
                  builder: (dialogContext) => ProfileEditUserImageDialog(
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
            height: 25,
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
            height: 25,
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
            height: 25,
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
                          isValidated: state
                              .validation.passwordValidation.isPassLongEnough,
                        ),
                        PasswordCheckBox(
                          requirement: '1 upper case letter',
                          isValidated: state.validation.passwordValidation
                              .isPassHasUpperCaseLetter,
                        ),
                        PasswordCheckBox(
                          requirement: '1 lower case letter',
                          isValidated: state.validation.passwordValidation
                              .isPassHasLowerCaseLetter,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
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
                state.newPassword != null ? 'Hide password' : 'Edit password',
                style: kMedium.copyWith(color: kLightBlue, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FadeAnimationX(
            delay: .6,
            child: CasualButton(
              onTap: () => showDialog(
                context: context,
                builder: (dialogContext) => ProfileEditPasswordVerifyDialog(
                  onTap: () {
                    profileEditPageContext
                        .read<ProfileEditBloc>()
                        .add(const ProfileEditEvent.editProfile());
                    Navigator.of(dialogContext).pop();
                  },
                  passwordController: _passwordController,
                ),
              ),
              isEnabled: state.isAvailable,
              text: 'EDIT',
            ),
          ),
        ],
      ),
    );
  }
}
