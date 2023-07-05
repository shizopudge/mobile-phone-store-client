import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/text_fields/search_field.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class ProductsAppBar extends StatelessWidget {
  final VoidCallback onFilter;
  final TextEditingController _searchController;
  const ProductsAppBar({
    super.key,
    required TextEditingController searchController,
    required this.onFilter,
  }) : _searchController = searchController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kWhite,
      toolbarHeight: SizeConfig.isMobile
          ? SizeConfig.screenWidth! * .2
          : SizeConfig.screenWidth! * .1,
      centerTitle: true,
      title: SearchField(
        searchController: _searchController,
        onClear: () => _searchController.clear(),
        onFilter: onFilter,
      ),
    );
  }
}
