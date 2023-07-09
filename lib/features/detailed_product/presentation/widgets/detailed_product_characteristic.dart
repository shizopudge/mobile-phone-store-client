import 'package:flutter/material.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/utils/size_config.dart';

class DetailedProductCharacteristic extends StatelessWidget {
  final String title;
  final String characteristic;
  final bool showDivider;
  const DetailedProductCharacteristic({
    super.key,
    required this.title,
    required this.characteristic,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$title:',
              style: kSemiBold.copyWith(
                fontSize: SizeConfig.body1,
                color: kGrey,
              ),
            ),
            SizedBox(
              width: SizeConfig.setPadding(8),
            ),
            Text(
              characteristic,
              style: kMedium.copyWith(
                fontSize: SizeConfig.body2,
                color: kDarkBlue,
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.setPadding(4)),
        if (showDivider)
          Divider(
            color: kGrey.withOpacity(.5),
            thickness: .75,
          ),
      ],
    );
  }
}
