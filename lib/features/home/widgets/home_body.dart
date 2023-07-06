import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/styles.dart';
import '../../../core/utils/size_config.dart';
import '../cubit/home_cubit.dart';

class HomeBody extends StatelessWidget {
  final List<Widget> pages;
  final List<BottomNavigationBarItem> navBottomBarItems;
  final List<NavigationRailDestination> navRailItems;
  final bool isMobile;
  const HomeBody({
    super.key,
    required this.pages,
    required this.navBottomBarItems,
    required this.isMobile,
    required this.navRailItems,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (isMobile) {
        return Scaffold(
          backgroundColor: kWhite,
          body: IndexedStack(
            index: state.page,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (page) => context.read<HomeCubit>().changePage(page),
            currentIndex: state.page,
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            useLegacyColorScheme: false,
            selectedLabelStyle:
                kMedium.copyWith(fontSize: SizeConfig.body3, color: kLightBlue),
            unselectedLabelStyle:
                kMedium.copyWith(fontSize: SizeConfig.body3, color: kGrey),
            iconSize: SizeConfig.iconSmall,
            selectedItemColor: kLightBlue,
            unselectedItemColor: kGrey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: navBottomBarItems,
          ),
        );
      }
      return Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: state.page,
              onDestinationSelected: (page) =>
                  context.read<HomeCubit>().changePage(page),
              labelType: NavigationRailLabelType.all,
              useIndicator: true,
              groupAlignment: 0,
              selectedLabelTextStyle: kMedium.copyWith(
                  fontSize: SizeConfig.body3, color: kLightBlue),
              unselectedLabelTextStyle:
                  kMedium.copyWith(fontSize: SizeConfig.body3, color: kGrey),
              selectedIconTheme:
                  IconThemeData(size: SizeConfig.iconSmall, color: kLightBlue),
              unselectedIconTheme:
                  IconThemeData(size: SizeConfig.iconSmall, color: kGrey),
              destinations: navRailItems,
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: IndexedStack(
                index: state.page,
                children: pages,
              ),
            )
          ],
        ),
      );
    });
  }
}
