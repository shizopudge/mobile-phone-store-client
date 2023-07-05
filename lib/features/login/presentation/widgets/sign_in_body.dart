import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/text_fields/casual_text_field.dart';
import '../../../../core/presentation/widgets/text_fields/password_text_field.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/login_bloc.dart';

class SignInBody extends StatelessWidget {
  final BuildContext loginPageContext;
  final VoidCallback switchPage;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  SignInBody({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.switchPage,
    required BuildContext context,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        loginPageContext = context {
    _emailController.addListener(() => loginPageContext
        .read<LoginBloc>()
        .add(LoginEvent.changeEmail(_emailController.text.trim())));
    _passwordController.addListener(() => loginPageContext
        .read<LoginBloc>()
        .add(LoginEvent.changePassword(_passwordController.text.trim())));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;
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
                        textAlign: TextAlign.center,
                        style: kBold.copyWith(
                          fontSize: SizeConfig.h1,
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
                        textAlign: TextAlign.center,
                        style: kSemiBold.copyWith(
                          fontSize: SizeConfig.h2,
                          color: kDarkBlue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimationYDown(
                      delay: .15,
                      child: CasualTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        isValidated: state.validation.isEmailValidated,
                        showCheckIcon: false,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                            RegExp('[ ]'),
                          ),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-zA-Z\.@]'))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimationYDown(
                      delay: .2,
                      child: PasswordTextField(
                        passwordController: _passwordController,
                        isAvailable: state.validation.isEmailValidated,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FadeAnimationYDown(
                      delay: .25,
                      child: CasualButton(
                        onTap: () {
                          primaryFocus?.unfocus();
                          context
                              .read<LoginBloc>()
                              .add(const LoginEvent.login());
                        },
                        text: 'Sign in',
                        isEnabled: state.validation.isSignInFormValidated &&
                            state.password.isNotEmpty,
                        fontSize: SizeConfig.body1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimationYDown(
                      delay: .3,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot the password?',
                            textAlign: TextAlign.center,
                            style: kSemiBold.copyWith(
                                color: kLightBlue, fontSize: SizeConfig.body3),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Spacer(),
                    FadeAnimationYDown(
                      delay: .35,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Dont\' have an account? ',
                          style: kSemiBold.copyWith(
                            color: kGrey,
                            fontSize: SizeConfig.body3,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: kMedium.copyWith(
                                color: kLightBlue,
                                fontSize: SizeConfig.body3,
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
