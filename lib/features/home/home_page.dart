import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/styles/styles.dart';
import '../auth/presentation/bloc/auth_bloc.dart';
import '../auth/presentation/pages/auth_page.dart';
import '../profile/presentation/profile_page.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  static const String path = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          final AuthStatus status = state.status;
          status.when(
            notAuthorized: () => Navigator.of(context)
                .pushNamedAndRemoveUntil(AuthPage.path, (route) => false),
          );
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) => Scaffold(
            backgroundColor: kWhite,
            body: IndexedStack(
              index: state.page,
              children: const [
                Text('Search'),
                Text('Wishlist'),
                Text('Cart'),
                ProfilePage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (page) => context.read<HomeCubit>().changePage(page),
              currentIndex: state.page,
              type: BottomNavigationBarType.fixed,
              enableFeedback: false,
              useLegacyColorScheme: false,
              selectedLabelStyle:
                  kMedium.copyWith(fontSize: 14, color: kLightBlue),
              unselectedLabelStyle:
                  kMedium.copyWith(fontSize: 14, color: kGrey),
              selectedItemColor: kLightBlue,
              unselectedItemColor: kGrey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
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
            ),
          ),
        ),
      ),
    );
  }
}
