import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/domain/entities/current_user.dart';
import '../../core/styles/styles.dart';
import '../products/presentation/pages/products_page.dart';

import '../../core/logic/auth/auth_bloc.dart';
import '../../core/presentation/widgets/loading/stack_loading.dart';
import '../../core/presentation/widgets/other/access_listener.dart';
import '../../core/presentation/widgets/pages/unauthorized_page.dart';
import '../../core/utils/size_config.dart';
import '../profile/presentation/profile_page.dart';
import 'cubit/home_cubit.dart';
import 'widgets/home_body.dart';

class HomePage extends StatelessWidget {
  static const String path = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final isAuthLoading =
        context.select<AuthBloc, bool>((bloc) => bloc.state.isLoading);
    final bool isMobile = SizeConfig.isMobile;
    return AccessListener(
      child: StackLoading(
        isLoading: isAuthLoading,
        child: BlocProvider(
          create: (_) => HomeCubit(),
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            final CurrentUser? user = state.user;
            if (user != null) {
              if (user.isAdmin) {
                return HomeBody(
                  pages: const [
                    ProductsPage(),
                    Center(
                      child: Text(
                        'Add',
                      ),
                    ),
                    ProfilePage(),
                  ],
                  navBottomBarItems: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search_rounded,
                      ),
                      label: 'Search',
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
                  isMobile: isMobile,
                  navRailItems: const [
                    NavigationRailDestination(
                      icon: Icon(
                        Icons.search_rounded,
                      ),
                      label: Text('Search'),
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
                );
              }
              return HomeBody(
                pages: const [
                  ProductsPage(),
                  ColoredBox(color: kOrange),
                  ColoredBox(color: kDarkBlue),
                  ProfilePage(),
                ],
                navBottomBarItems: const [
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
                navRailItems: const [
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
                isMobile: isMobile,
              );
            }
            return HomeBody(
              pages: const [
                ProductsPage(),
                ColoredBox(color: kDarkBlue),
                UnauthorizedPage(
                  text:
                      'To access the full functionality, you need to log in or register an account',
                ),
              ],
              navBottomBarItems: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search_rounded,
                    ),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_bag_rounded,
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.login_rounded,
                    ),
                    label: 'Sign in'),
              ],
              isMobile: isMobile,
              navRailItems: const [
                NavigationRailDestination(
                    icon: Icon(
                      Icons.search_rounded,
                    ),
                    label: Text('Search')),
                NavigationRailDestination(
                    icon: Icon(
                      Icons.shopping_bag_rounded,
                    ),
                    label: Text('Cart')),
                NavigationRailDestination(
                    icon: Icon(
                      Icons.login_rounded,
                    ),
                    label: Text('Sign in')),
              ],
            );
          }),
        ),
      ),
    );
  }
}
