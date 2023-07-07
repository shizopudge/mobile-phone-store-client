import 'package:flutter/material.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/profile_edit/presentation/pages/profile_edit_page.dart';
import '../presentation/widgets/pages/auth_splash_page.dart';
import 'page_transition_util.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthSplashPage.path:
        return PageTransitionUtil.go(
          page: const AuthSplashPage(),
        );
      case LoginPage.path:
        return PageTransitionUtil.go(
          page: const LoginPage(),
        );
      case HomePage.path:
        return PageTransitionUtil.go(
          page: const HomePage(),
        );
      case ProfileEditPage.path:
        return PageTransitionUtil.go(
          page: const ProfileEditPage(),
        );
      default:
        return null;
    }
  }

  void dispose() {}
}
