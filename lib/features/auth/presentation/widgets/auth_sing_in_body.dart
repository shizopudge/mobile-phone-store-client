import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/styles/styles.dart';
import '../bloc/auth_bloc.dart';
import 'auth_button.dart';
import 'auth_password_text_field.dart';
import 'auth_text_field.dart';

class SignInBody extends StatelessWidget {
  final VoidCallback switchPage;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  const SignInBody({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.switchPage,
  })  : _emailController = emailController,
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
                        'Sign in',
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
                        'Access your account',
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
                        showCheckIcon: false,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    FadeAnimationYDown(
                      delay: .2,
                      child: AuthPasswordTextField(
                        passwordController: _passwordController,
                        hintText: 'Password',
                        isAvailable: state.validation.isEmailValidated,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FadeAnimationYDown(
                      delay: .25,
                      child: AuthButton(
                        onTap: () {
                          primaryFocus?.unfocus();
                          context.read<AuthBloc>().add(const AuthEvent.login());
                        },
                        text: 'Sign in',
                        isEnabled: state.validation.isSignInFormValidated &&
                            state.password.isNotEmpty,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FadeAnimationYDown(
                      delay: .3,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot the password?',
                            style: kSemiBold.copyWith(
                                color: kLightBlue, fontSize: 18),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Spacer(),
                    FadeAnimationYDown(
                      delay: .35,
                      child: RichText(
                        text: TextSpan(
                          text: 'Dont\' have an account? ',
                          style: kSemiBold.copyWith(
                            color: kGrey,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign up',
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
