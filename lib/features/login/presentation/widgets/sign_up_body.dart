import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/animations/fade_animation_y_down.dart';
import '../../../../core/presentation/widgets/buttons/casual_button.dart';
import '../../../../core/presentation/widgets/other/password_checkbox.dart';
import '../../../../core/presentation/widgets/text_fields/casual_text_field.dart';
import '../../../../core/presentation/widgets/text_fields/password_text_field.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';
import '../bloc/login_bloc.dart';
import 'sign_up_policy.dart';

class SignUpBody extends StatelessWidget {
  final BuildContext loginPageContext;
  final VoidCallback switchPage;
  final TextEditingController _emailController;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  SignUpBody({
    super.key,
    required TextEditingController emailController,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required BuildContext context,
    required this.switchPage,
  })  : _emailController = emailController,
        _usernameController = usernameController,
        _passwordController = passwordController,
        loginPageContext = context {
    _emailController.addListener(() => loginPageContext
        .read<LoginBloc>()
        .add(LoginEvent.changeEmail(_emailController.text.trim())));
    _usernameController.addListener(() => context
        .read<LoginBloc>()
        .add(LoginEvent.changeUsername(_usernameController.text.trim())));
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
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.setPadding(SizeConfig.isMobile
                        ? 20
                        : SizeConfig.isTablet
                            ? 50
                            : SizeConfig.screenWidth! * .12)),
                child: Column(
                  children: [
                    FadeAnimationYDown(
                      delay: .05,
                      child: Text(
                        'Sign up',
                        textAlign: TextAlign.center,
                        style: kBold.copyWith(
                          fontSize: SizeConfig.h1,
                          color: kDarkBlue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(10),
                    ),
                    FadeAnimationYDown(
                      delay: .1,
                      child: Text(
                        'Create your account',
                        textAlign: TextAlign.center,
                        style: kSemiBold.copyWith(
                          fontSize: SizeConfig.h2,
                          color: kDarkBlue,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(25),
                    ),
                    FadeAnimationYDown(
                      delay: .15,
                      child: CasualTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        isValidated: state.validation.isEmailValidated,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                            RegExp('[ ]'),
                          ),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-zA-Z\.@]'))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(25),
                    ),
                    FadeAnimationYDown(
                      delay: .2,
                      child: CasualTextField(
                        controller: _usernameController,
                        hintText: 'Username',
                        isValidated: state.validation.isUsernameValidated,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                            RegExp('[ ]'),
                          ),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9a-zA-Z]'))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(25),
                    ),
                    FadeAnimationYDown(
                      delay: .25,
                      child: PasswordTextField(
                        passwordController: _passwordController,
                        isAvailable: state.validation.isUsernameValidated,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(15),
                    ),
                    FadeAnimationYDown(
                      delay: .3,
                      child: SizedBox(
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
                              isValidated: state.validation.passwordValidation
                                  .isPassLongEnough,
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
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(40),
                    ),
                    FadeAnimationYDown(
                      delay: .35,
                      child: CasualButton(
                        onTap: () {
                          primaryFocus?.unfocus();
                          context
                              .read<LoginBloc>()
                              .add(const LoginEvent.register());
                        },
                        text: 'Next',
                        isEnabled: state.validation.isSignUpFormValidated,
                        fontSize: SizeConfig.body1,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(20),
                    ),
                    FadeAnimationYDown(
                      delay: .4,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: kSemiBold.copyWith(
                            color: kGrey,
                            fontSize: SizeConfig.body3,
                          ),
                          children: [
                            TextSpan(
                              text: 'Sign in',
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
                    SizedBox(
                      height: SizeConfig.setPadding(10),
                    ),
                    const Spacer(),
                    const FadeAnimationYDown(
                      delay: .45,
                      child: PolicyText(),
                    ),
                    SizedBox(
                      height: SizeConfig.setPadding(25),
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
