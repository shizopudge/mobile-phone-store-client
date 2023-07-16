import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';
import '../loading/casual_loader.dart';

class CasualSplashPage extends StatelessWidget {
  const CasualSplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'MOBILE STORE',
                textAlign: TextAlign.center,
                style: kSemiBold.copyWith(
                  fontSize: SizeConfig.h3,
                  color: kDarkBlue,
                  letterSpacing: 6.4,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            const CasualLoader(
              color: kDarkBlue,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
