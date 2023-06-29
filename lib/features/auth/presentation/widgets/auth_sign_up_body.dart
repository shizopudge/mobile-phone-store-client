import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/styles/styles.dart';
import '../bloc/auth_bloc.dart';
import 'auth_button.dart';
import 'auth_password_checkbox.dart';
import 'auth_password_text_field.dart';
import 'auth_policy.dart';
import 'auth_text_field.dart';

class SignUpBody extends StatelessWidget {
  final VoidCallback switchPage;
  final TextEditingController _emailController;

  final TextEditingController _usernameController;

  final TextEditingController _passwordController;

  const SignUpBody({
    super.key,
    required TextEditingController emailController,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required this.switchPage,
  })  : _emailController = emailController,
        _usernameController = usernameController,
        _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthBloc>().state;
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    FadeAnimationYDown(
                      delay: .05,
                      child: Text(
                        'Sign up',
                        style: kBold.copyWith(
                          fontSize: 38,
                          color: kDarkBlue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeAnimationYDown(
                      delay: .1,
                      child: Text(
                        'Create your account',
                        style: kSemiBold.copyWith(
                          fontSize: 21,
                          color: kDarkBlue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FadeAnimationYDown(
                      delay: .15,
                      child: AuthTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        isValidated: state.validation.isEmailValidated,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FadeAnimationYDown(
                      delay: .2,
                      child: AuthTextField(
                        controller: _usernameController,
                        hintText: 'Username',
                        isValidated: state.validation.isUsernameValidated,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FadeAnimationYDown(
                      delay: .25,
                      child: AuthPasswordTextField(
                        passwordController: _passwordController,
                        hintText: 'Password',
                        isAvailable: state.validation.isUsernameValidated,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FadeAnimationYDown(
                      delay: .3,
                      child: SizedBox(
                        height: 32,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            PasswordCheckBox(
                              requirement: '6+ characters',
                              isFits: state.validation.passwordValidation
                                  .isPassLongEnough,
                            ),
                            PasswordCheckBox(
                              requirement: '1 upper case letter',
                              isFits: state.validation.passwordValidation
                                  .isPassHasUpperCaseLetter,
                            ),
                            PasswordCheckBox(
                              requirement: '1 lower case letter',
                              isFits: state.validation.passwordValidation
                                  .isPassHasLowerCaseLetter,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FadeAnimationYDown(
                      delay: .35,
                      child: AuthButton(
                        onTap: () {
                          primaryFocus?.unfocus();
                          context
                              .read<AuthBloc>()
                              .add(const AuthEvent.register());
                        },
                        text: 'Next',
                        isEnabled: state.validation.isSignUpFormValidated,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimationYDown(
                      delay: .4,
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: kSemiBold.copyWith(
                            color: kGrey,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign in',
                              style: kMedium.copyWith(
                                color: kLightBlue,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = switchPage,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Spacer(),
                    const FadeAnimationYDown(
                      delay: .45,
                      child: PolicyText(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
