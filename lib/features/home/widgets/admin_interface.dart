import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';

class AdminInterface extends StatelessWidget {
  const AdminInterface({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Text(
          'ADMIN PANEL',
          style: kMedium.copyWith(fontSize: 21, color: kDarkBlue),
        ),
      ),
    );
  }
}
