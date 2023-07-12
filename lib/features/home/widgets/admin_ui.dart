import 'package:flutter/material.dart';

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
        BrowseProductsPage(),
        Center(
          child: Text(
            'Add',
          ),
        ),
        ProfilePage(),
      ],
      navBottomBarItems: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_rounded,
          ),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_rounded),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
      navRailItems: [
        NavigationRailDestination(
          icon: Icon(
            Icons.search_rounded,
          ),
          label: Text('Browse'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.add_rounded),
          label: Text('Add'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_rounded),
          label: Text('Profile'),
        ),
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
            Icons.add_rounded,
          ),
          text: 'Add',
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
