import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/loading/stack_loading.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../../../core/utils/size_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../home/pages/home_page.dart';
import '../bloc/login_bloc.dart';
import '../widgets/login_app_bar.dart';
import '../widgets/sign_in_body.dart';
import '../widgets/sign_up_body.dart';

class LoginPage extends StatefulWidget {
  static const String path = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController()
    ..addListener(_emailListener);
  late final TextEditingController _usernameController = TextEditingController()
    ..addListener(_usernameListener);
  late final TextEditingController _passwordController = TextEditingController()
    ..addListener(_passwordListener);
  final PageController _pageController = PageController(initialPage: 1);

  void _switchPage() {
    if (_pageController.page == 0) {
      _clearTextFields();
      _pageController.animateToPage(1,
          duration: const Duration(milliseconds: 150), curve: Curves.linear);
    } else {
      _clearTextFields();
      _pageController.animateToPage(0,
          duration: const Duration(milliseconds: 150), curve: Curves.linear);
    }
  }

  void _emailListener() => context
      .read<LoginBloc>()
      .add(LoginEvent.changeEmail(_emailController.text.trim()));

  void _usernameListener() => context
      .read<LoginBloc>()
      .add(LoginEvent.changeUsername(_usernameController.text.trim()));

  void _passwordListener() => context
      .read<LoginBloc>()
      .add(LoginEvent.changePassword(_passwordController.text.trim()));

  void _clearTextFields() {
    _emailController.clear();
    _usernameController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.callWhen(
          authorized: () => Navigator.of(context)
              .pushNamedAndRemoveUntil(HomePage.path, (route) => false),
          guest: () => Navigator.of(context)
              .pushNamedAndRemoveUntil(HomePage.path, (route) => false),
          failure: () => PopupUtils.showFailureSnackBar(
            context: context,
            failure: state.failure,
          ),
        );
      },
      child: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (previous, current) => current.status.isFailure,
        listener: (context, state) {
          if (state.status.isFailure) state.failure.call(context);
        },
        builder: (context, state) => StackLoading(
          isLoading: state.status.isLoading,
          child: Scaffold(
            backgroundColor: kWhite,
            appBar: LoginAppBar(
              key: UniqueKey(),
            ),
            body: SafeArea(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SignUpBody(
                    switchPage: _switchPage,
                    emailController: _emailController,
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                  ),
                  SignInBody(
                    switchPage: _switchPage,
                    emailController: _emailController,
                    passwordController: _passwordController,
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
