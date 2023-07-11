import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class SearchProductsNotFound extends StatelessWidget {
  const SearchProductsNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.search_off_rounded,
          size: SizeConfig.iconLarger,
          color: kDarkBlue,
        ),
        SizedBox(
          height: SizeConfig.setPadding(8),
        ),
        Text(
          'Nothing was found',
          textAlign: TextAlign.center,
          style: kBold.copyWith(color: kDarkBlue, fontSize: SizeConfig.body1),
        ),
      ],
    );
  }
}
