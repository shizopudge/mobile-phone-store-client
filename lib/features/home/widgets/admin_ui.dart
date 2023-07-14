import 'package:flutter/material.dart';

import '../../admin_panel/admin_panel.dart';
import '../../products/presentation/pages/browse_products_page.dart';
import '../../profile/presentation/pages/profile_page.dart';
import 'home_body.dart';

class AdminUI extends StatelessWidget {
  const AdminUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HomeBody(
      pages: [
        AdminPanelPage(),
        BrowseProductsPage(),
        ProfilePage(),
      ],
      navBottomBarItems: [
        BottomNavigationBarItem(
          icon: Icon(Icons.admin_panel_settings),
          label: 'Admin panel',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_rounded,
          ),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
      navRailItems: [
        NavigationRailDestination(
          icon: Icon(Icons.admin_panel_settings),
          label: Text('Admin panel'),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.search_rounded,
          ),
          label: Text('Browse'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_rounded),
          label: Text('Profile'),
        ),
      ],
      navTopBarItems: [
        Tab(
          icon: Icon(
            Icons.admin_panel_settings,
          ),
          text: 'Admin panel',
        ),
        Tab(
          icon: Icon(
            Icons.search_rounded,
          ),
          text: 'Browse',
        ),
        Tab(
          icon: Icon(
            Icons.person_rounded,
          ),
          text: 'Profile',
        ),
      ],
    );
  }
}
