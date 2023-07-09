import 'package:flutter/material.dart';

import '../../../../../../core/styles/styles.dart';

class PFilterDivider extends StatelessWidget {
  const PFilterDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Divider(
          thickness: 1,
          color: kGrey,
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
