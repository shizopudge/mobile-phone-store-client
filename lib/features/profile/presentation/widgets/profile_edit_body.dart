import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_x.dart';
import '../../../../core/presentation/widgets/buttons/casual_text_button.dart';
import '../../../../core/presentation/widgets/other/editable_circle_image.dart';
import '../../../../core/presentation/widgets/other/password_checkbox.dart';
import '../../../../core/presentation/widgets/text_fields/casual_text_field.dart';
import '../../../../core/presentation/widgets/text_fields/password_text_field.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/profile_bloc.dart';

class ProfileEditBody extends StatelessWidget {
  final void Function(String? userImage) onProfileImageTap;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController newPasswordController;
  const ProfileEditBody({
    super.key,
    required this.onProfileImageTap,
    required this.emailController,
    required this.usernameController,
    required this.newPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProfileBloc>().state;
    final userImage =
        context.select<AuthBloc, String?>((bloc) => bloc.state.user?.image);
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.setPadding(SizeConfig.isMobile
                      ? 20
                      : SizeConfig.isTablet
                          ? 40
                          : 100)),
              child: Column(
                children: [
                  EditableCircleImage(
                    onTap: () => onProfileImageTap(userImage),
                    image: userImage,
                    pickedImage: state.image,
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(15),
                  ),
                  FadeAnimationX(
                    delay: .3,
                    child: CasualTextField(
                      controller: emailController,
                      hintText: 'Email',
                      isValidated: state.validation.isEmailValidated,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(15),
                  ),
                  FadeAnimationX(
                    delay: .4,
                    child: CasualTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      isValidated: state.validation.isUsernameValidated,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(15),
                  ),
                  if (state.newPassword != null)
                    FadeAnimationX(
                      delay: .3,
                      child: Column(
                        children: [
                          PasswordTextField(
                            passwordController: newPasswordController,
                            hint: 'New password',
                            isAvailable: true,
                          ),
                          SizedBox(
                            height: SizeConfig.setPadding(15),
                          ),
                          SizedBox(
                            height: SizeConfig.isMobile
                                ? SizeConfig.screenWidth! * .085
                                : SizeConfig.isTablet
                                    ? SizeConfig.screenWidth! * .055
                                    : SizeConfig.screenWidth! * .03,
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
                          SizedBox(
                            height: SizeConfig.setPadding(15),
                          ),
                        ],
                      ),
                    ),
                  FadeAnimationX(
                    key: const ValueKey('toggle_password_button_anim'),
                    delay: .5,
                    child: CasualTextButton(
                      onTap: () => context
                          .read<ProfileBloc>()
                          .add(const ProfileEvent.toggleEditPassword()),
                      text: state.newPassword != null
                          ? 'Hide password'
                          : 'Edit password',
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.setPadding(15),
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
