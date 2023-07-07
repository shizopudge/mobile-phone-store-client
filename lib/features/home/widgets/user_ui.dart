import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';
import '../../products/presentation/pages/products_page.dart';
import '../../profile/presentation/pages/profile_page.dart';
import 'home_body.dart';

class UserUI extends StatelessWidget {
  const UserUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const HomeBody(
      pages: [
        ProductsPage(),
        ColoredBox(color: kOrange),
        ColoredBox(color: kDarkBlue),
        ProfilePage(),
      ],
      navBottomBarItems: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
            ),
            label: 'Wishlist'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_rounded,
            ),
            label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: 'Profile'),
      ],
      navRailItems: [
        NavigationRailDestination(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: Text('Search')),
        NavigationRailDestination(
            icon: Icon(
              Icons.favorite_rounded,
            ),
            label: Text('Wishlist')),
        NavigationRailDestination(
            icon: Icon(
              Icons.shopping_bag_rounded,
            ),
            label: Text('Cart')),
        NavigationRailDestination(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: Text('Profile')),
      ],
      navTopBarItems: [
        Tab(
            icon: Icon(
              Icons.search_rounded,
            ),
            text: 'Search'),
        Tab(
            icon: Icon(
              Icons.favorite_rounded,
            ),
            text: 'Wishlist'),
        Tab(
            icon: Icon(
              Icons.shopping_bag_rounded,
            ),
            text: 'Cart'),
        Tab(
            icon: Icon(
              Icons.person_rounded,
            ),
            text: 'Profile'),
      ],
    );
  }
}
