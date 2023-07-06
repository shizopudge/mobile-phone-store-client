import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class BottomSheetDivider extends StatelessWidget {
  const BottomSheetDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 6,
        width: SizeConfig.screenWidth! * .18,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: kLightBlue,
            ),
          ),
        ),
      ),
    );
  }
}
