import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class SearchField extends StatelessWidget {
  final TextEditingController _searchController;
  final VoidCallback onClear;
  final VoidCallback onFilter;
  final bool showFilter;
  const SearchField({
    super.key,
    required TextEditingController searchController,
    this.showFilter = true,
    required this.onClear,
    required this.onFilter,
  }) : _searchController = searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      cursorColor: kDarkBlue,
      style: kMedium.copyWith(
        color: kDarkBlue,
        height: 1,
        fontSize: SizeConfig.body1,
      ),
      decoration: InputDecoration(
        fillColor: kLightWhite,
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Icon(
            Icons.search_rounded,
            color: kDarkBlue,
            size: SizeConfig.iconMedium,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                CloseButton(
                  onPressed: onClear,
                  color: kDarkBlue,
                  style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(
                      SizeConfig.iconMedium,
                    ),
                  ),
                ),
                if (showFilter)
                  IconButton(
                    onPressed: onFilter,
                    icon: Icon(
                      Icons.filter_list_rounded,
                      color: kDarkBlue,
                      size: SizeConfig.iconMedium,
                    ),
                  ),
              ],
            ),
          ),
        ),
        hintText: 'Search',
        hintStyle: kSemiBold.copyWith(
          color: kGrey,
          height: 1,
          fontSize: SizeConfig.body1,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(
            SizeConfig.radiusLarge,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(
            SizeConfig.radiusLarge,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(
            SizeConfig.radiusLarge,
          ),
        ),
      ),
    );
  }
}
