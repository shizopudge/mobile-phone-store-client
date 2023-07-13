import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onClear;
  final VoidCallback? onFilter;
  final VoidCallback toggleSearchResult;
  final bool showClose;
  final bool isFilterActive;
  final bool showSearchResults;
  const SearchField({
    super.key,
    required this.searchController,
    required this.showClose,
    required this.onClear,
    required this.onFilter,
    required this.isFilterActive,
    required this.toggleSearchResult,
    required this.showSearchResults,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
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
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.setPadding(15)),
          child: Icon(
            Icons.search_rounded,
            color: kDarkBlue,
            size: SizeConfig.iconMedium,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.setPadding(15)),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showClose)
                  CloseButton(
                    onPressed: onClear,
                    color: kDarkBlue,
                    style: ButtonStyle(
                      iconSize: MaterialStatePropertyAll(
                        SizeConfig.iconMedium,
                      ),
                    ),
                  ),
                if (onFilter != null)
                  IconButton(
                    onPressed: onFilter,
                    icon: Icon(
                      Icons.filter_list_rounded,
                      color: isFilterActive
                          ? kLightBlue
                          : kDarkBlue.withOpacity(.5),
                      size: SizeConfig.iconMedium,
                    ),
                  ),
                IconButton(
                  onPressed: toggleSearchResult,
                  icon: Icon(
                    Icons.info_rounded,
                    color: showSearchResults
                        ? kLightBlue
                        : kDarkBlue.withOpacity(.5),
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
            SizeConfig.borderRadiusDefault,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadiusDefault,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadiusDefault,
          ),
        ),
      ),
    );
  }
}
