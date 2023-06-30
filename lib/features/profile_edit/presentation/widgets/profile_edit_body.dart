import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/casual_button.dart';
import '../../../../core/presentation/widgets/casual_text_field.dart';
import '../../../../core/presentation/widgets/password_checkbox.dart';
import '../../../../core/presentation/widgets/password_text_field.dart';
import '../../../../core/styles/styles.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/profile_edit_bloc.dart';
import 'profile_edit_user_image.dart';

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

  void _emailListener() => context
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
  void initState() {
    print('Email: ${context.read<AuthBloc>().state.email}');
    _emailController = TextEditingController(
        text: context.read<AuthBloc>().state.currentUser?.email)
      ..addListener(_emailListener);
    _usernameController = TextEditingController(
        text: context.read<AuthBloc>().state.currentUser?.username)
      ..addListener(_usernameListener);
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
    final state = context.watch<ProfileEditBloc>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          FadeAnimationX(
            delay: .2,
            child: ProfileEditUserImage(
              userImage: state.currentUser?.image,
              pickedImage: state.image,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FadeAnimationX(
            delay: .3,
            child: CasualTextField(
              controller: _emailController,
              hintText: 'Email',
              isValidated: true,
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
              isValidated: true,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          if (state.isEditPassword)
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
            key: const ValueKey('toggle_password_anim'),
            delay: .5,
            child: TextButton(
              onPressed: () => context
                  .read<ProfileEditBloc>()
                  .add(const ProfileEditEvent.toggleEditPassword()),
              child: Text(
                state.isEditPassword ? 'Hide password' : 'Edit password',
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
              onTap: () => context
                  .read<ProfileEditBloc>()
                  .add(const ProfileEditEvent.editProfile()),
              isEnabled: state.isEdited,
              text: 'EDIT',
            ),
          ),
        ],
      ),
    );
  }
}
