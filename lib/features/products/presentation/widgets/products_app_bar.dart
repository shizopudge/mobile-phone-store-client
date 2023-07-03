import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/text_fields/serach_field.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kWhite,
      centerTitle: true,
      floating: true,
      toolbarHeight: SizeConfig.isMobile
          ? SizeConfig.screenWidth! * .2
          : SizeConfig.isTablet
              ? SizeConfig.screenWidth! * .15
              : SizeConfig.screenWidth! * .1,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SearchField(
              searchController: _searchController,
            ),
          ),
        ),
      ),
    );
  }
}
