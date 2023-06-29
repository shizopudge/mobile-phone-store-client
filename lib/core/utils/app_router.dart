import 'package:flutter/material.dart';

import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/auth/presentation/pages/auth_splash_page.dart';
import '../../features/home/presentation/home_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const AuthSplashPage(),
        );
      case '/auth':
        return MaterialPageRoute(
          builder: (context) => const AuthPage(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return null;
    }
  }

  void dispose() {}
}
