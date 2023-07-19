import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/get_it.dart';
import '../../admin_panel/admin_panel.dart';
import '../../browse_products/presentation/pages/browse_products_page.dart';
import '../../detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../../profile/presentation/pages/profile_page.dart';
import '../../purchases/presentation/bloc/purchases_bloc.dart';
import '../../purchases/presentation/pages/purchases_page.dart';
import 'home_body.dart';

class AdminUI extends StatelessWidget {
  const AdminUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeBody(
      pages: [
        const AdminPanelPage(),
        const BrowseProductsPage(),
        MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt<PurchasesBloc>(),
            ),
            BlocProvider.value(
              value: getIt<DetailedProductBloc>(),
            ),
          ],
          child: const PurchasesPage(),
        ),
        BlocProvider.value(
            value: getIt<PurchasesBloc>()..add(const PurchasesEvent.initial()),
            child: const ProfilePage()),
      ],
      navBottomBarItems: const [
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
          icon: Icon(
            Icons.shopping_bag_rounded,
          ),
          label: 'Purchases',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
      navRailItems: const [
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
          icon: Icon(
            Icons.shopping_bag_rounded,
          ),
          label: Text('Purchases'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_rounded),
          label: Text('Profile'),
        ),
      ],
      navTopBarItems: const [
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
            Icons.shopping_bag_rounded,
          ),
          text: 'Purchases',
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
