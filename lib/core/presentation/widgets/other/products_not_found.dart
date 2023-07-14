import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class NothingWasFound extends StatelessWidget {
  const NothingWasFound({
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
