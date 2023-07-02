import 'package:flutter/material.dart';

import '../../features/home/home_page.dart';
import '../../features/login/presentation/login_page.dart';
import '../../features/profile_edit/presentation/profile_edit_page.dart';
import '../presentation/widgets/pages/auth_splash_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthSplashPage.path:
        return MaterialPageRoute(
          builder: (context) => const AuthSplashPage(),
        );
      case LoginPage.path:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case HomePage.path:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case ProfileEditPage.path:
        return MaterialPageRoute(
          builder: (context) => const ProfileEditPage(),
        );
      default:
        return null;
    }
  }

  void dispose() {}
}
