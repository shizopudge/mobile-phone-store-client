import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/overlapping_loader.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/popup_utils.dart';
import '../../../home/home_page.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_app_bar.dart';
import '../widgets/auth_sign_up_body.dart';
import '../widgets/auth_sing_in_body.dart';

class AuthPage extends StatefulWidget {
  static const String path = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final TextEditingController _emailController = TextEditingController()
    ..addListener(_emailListener);
  late final TextEditingController _usernameController = TextEditingController()
    ..addListener(_usernameListener);
  late final TextEditingController _passwordController = TextEditingController()
    ..addListener(_passwordListener);
  final PageController _pageController = PageController(initialPage: 1);

  void _emailListener() => context
      .read<AuthBloc>()
      .add(AuthEvent.changeEmail(_emailController.text.trim()));

  void _usernameListener() => context
      .read<AuthBloc>()
      .add(AuthEvent.changeUsername(_usernameController.text.trim()));

  void _passwordListener() => context
      .read<AuthBloc>()
      .add(AuthEvent.changePassword(_passwordController.text.trim()));

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

  @override
  void initState() {
    context.read<AuthBloc>().add(const AuthEvent.dropState());
    super.initState();
  }

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
    final isLoading =
        context.select<AuthBloc, bool>((bloc) => bloc.state.status.isLoading);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        final AuthStatus status = state.status;
        status.when(
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            backgroundColor: kWhite,
            appBar: const AuthAppBar(),
            body: PageView(
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
          if (isLoading) const OverlappingLoader(),
        ],
      ),
    );
  }
}
