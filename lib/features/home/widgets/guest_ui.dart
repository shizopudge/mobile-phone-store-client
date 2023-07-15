import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/pages/unauthorized_page.dart';
import '../../browse_products/presentation/pages/browse_products_page.dart';
import 'home_body.dart';

class GuestUI extends StatelessWidget {
  const GuestUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HomeBody(
      pages: [
        BrowseProductsPage(),
        UnauthorizedPage(
          text:
              'To access the full functionality, you need to log in or register an account',
        ),
      ],
      navBottomBarItems: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: 'Browse'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.login_rounded,
            ),
            label: 'Sign in'),
      ],
      navRailItems: [
        NavigationRailDestination(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: Text('Browse')),
        NavigationRailDestination(
            icon: Icon(
              Icons.login_rounded,
            ),
            label: Text('Sign in')),
      ],
      navTopBarItems: [
        Tab(
          icon: Icon(
            Icons.search_rounded,
          ),
          text: 'Browse',
        ),
        Tab(
            icon: Icon(
              Icons.login_rounded,
            ),
            text: 'Sign in'),
      ],
    );
  }
}
