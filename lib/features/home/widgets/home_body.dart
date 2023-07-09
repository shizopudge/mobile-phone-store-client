import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/styles/styles.dart';
import '../../../core/utils/size_config.dart';
import '../cubit/home_cubit.dart';

class HomeBody extends StatefulWidget {
  final List<Widget> pages;
  final List<BottomNavigationBarItem> navBottomBarItems;
  final List<NavigationRailDestination> navRailItems;
  final List<Tab> navTopBarItems;
  const HomeBody({
    super.key,
    required this.pages,
    required this.navBottomBarItems,
    required this.navRailItems,
    required this.navTopBarItems,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
      length: widget.pages.length,
      vsync: this,
      initialIndex: context.read<HomeCubit>().state.page)
    ..addListener(
        () => context.read<HomeCubit>().changePage(_tabController.index));

  @override
  void deactivate() {
    _tabController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final bool isMobile = SizeConfig.isMobile;
    final bool isTablet = SizeConfig.isTablet;
    final bool isDesktop = SizeConfig.isDesktop;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kWhite,
          body: Column(
            children: [
              if (isDesktop)
                TabBar(
                  controller: _tabController,
                  onTap: (page) => _tabController.index = page,
                  tabs: widget.navTopBarItems,
                  labelStyle: kMedium.copyWith(color: kLightBlue),
                  unselectedLabelStyle: kMedium.copyWith(color: kGrey),
                ),
              Expanded(
                child: Row(
                  children: [
                    if (isTablet)
                      NavigationRail(
                        selectedIndex: state.page,
                        onDestinationSelected: (page) =>
                            context.read<HomeCubit>().changePage(page),
                        labelType: NavigationRailLabelType.all,
                        groupAlignment: 0,
                        selectedLabelTextStyle: kMedium.copyWith(
                            fontSize: SizeConfig.body3, color: kLightBlue),
                        unselectedLabelTextStyle: kMedium.copyWith(
                            fontSize: SizeConfig.body3, color: kGrey),
                        selectedIconTheme: IconThemeData(
                            size: SizeConfig.iconSmall, color: kLightBlue),
                        unselectedIconTheme: IconThemeData(
                            size: SizeConfig.iconSmall, color: kGrey),
                        destinations: widget.navRailItems,
                      ),
                    if (isTablet) const VerticalDivider(thickness: 1, width: 1),
                    Expanded(
                      child: IndexedStack(
                        index: state.page,
                        children: widget.pages,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: isMobile
              ? BottomNavigationBar(
                  onTap: (page) => context.read<HomeCubit>().changePage(page),
                  currentIndex: state.page,
                  type: BottomNavigationBarType.fixed,
                  enableFeedback: false,
                  useLegacyColorScheme: false,
                  selectedLabelStyle: kMedium.copyWith(
                      fontSize: SizeConfig.body3, color: kLightBlue),
                  unselectedLabelStyle: kMedium.copyWith(
                      fontSize: SizeConfig.body3, color: kGrey),
                  iconSize: SizeConfig.iconSmall,
                  selectedItemColor: kLightBlue,
                  unselectedItemColor: kGrey,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  items: widget.navBottomBarItems,
                )
              : null,
        );
      },
    );
  }
}
