import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/widgets/pages/offer_to_authorize.dart';
import '../../../core/styles/styles.dart';
import '../cubit/home_cubit.dart';

class GuestInterface extends StatelessWidget {
  const GuestInterface({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        backgroundColor: kWhite,
        body: IndexedStack(
          index: state.page,
          children: const [
            Text('Search'),
            Text('Cart'),
            OfferToAuthorize(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (page) => context.read<HomeCubit>().changePage(page),
          currentIndex: state.page,
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          useLegacyColorScheme: false,
          selectedLabelStyle: kMedium.copyWith(fontSize: 14, color: kLightBlue),
          unselectedLabelStyle: kMedium.copyWith(fontSize: 14, color: kGrey),
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
                  Icons.shopping_bag_rounded,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.login_rounded,
                ),
                label: 'Sign in'),
          ],
        ),
      ),
    );
  }
}
