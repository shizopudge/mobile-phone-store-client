import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/get_it.dart';
import '../../browse_products/presentation/pages/browse_products_page.dart';
import '../../cart/presentation/bloc/cart_bloc.dart';
import '../../cart/presentation/pages/cart_page.dart';
import '../../profile/presentation/pages/profile_page.dart';
import '../../purchases/presentation/bloc/purchases_bloc.dart';
import '../../wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../wishlist/presentation/pages/wishlist_page.dart';
import 'home_body.dart';

class UserUI extends StatelessWidget {
  const UserUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeBody(
      pages: [
        const BrowseProductsPage(),
        BlocProvider.value(
          value: getIt<WishlistBloc>()..add(const WishlistEvent.initial()),
          child: const WishlistPage(),
        ),
        BlocProvider.value(
          value: getIt<CartBloc>()..add(const CartEvent.initial()),
          child: const CartPage(),
        ),
        BlocProvider.value(
          value: getIt<PurchasesBloc>()..add(const PurchasesEvent.initial()),
          child: const ProfilePage(),
        ),
      ],
      navBottomBarItems: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: 'Browse'),
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
      navRailItems: const [
        NavigationRailDestination(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: Text('Browse')),
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
      navTopBarItems: const [
        Tab(
            icon: Icon(
              Icons.search_rounded,
            ),
            text: 'Browse'),
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
