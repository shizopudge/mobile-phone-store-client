import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_store/core/di/get_it.dart';
import 'package:phone_store/features/manufacturers/domain/usecases/get_manufacturers.dart';
import 'package:phone_store/features/manufacturers/presentation/bloc/manufacturers_bloc.dart';

import '../../manufacturers/data/repositories/manufacturers_repository_impl.dart';
import '../../manufacturers/presentation/pages/manufacturers_page.dart';
import '../../products/presentation/pages/browse_products_page.dart';
import '../../profile/presentation/pages/profile_page.dart';
import 'home_body.dart';

class AdminUI extends StatelessWidget {
  const AdminUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeBody(
      pages: [
        const BrowseProductsPage(),
        BlocProvider(
          create: (context) => ManufacturersBloc(
              getManufacturersUsecase:
                  GetManufacturers(getIt<ManufacturersRepositoryImpl>()))
            ..add(const ManufacturersEvent.initial()),
          child: const ManufacturersPage(),
        ),
        const ProfilePage(),
      ],
      navBottomBarItems: const [
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
      navRailItems: const [
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
      navTopBarItems: const [
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
