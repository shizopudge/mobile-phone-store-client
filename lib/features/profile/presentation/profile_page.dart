import 'package:flutter/material.dart';

import '../../../core/presentation/widgets/other/casual_app_bar.dart';
import '../../../core/styles/styles.dart';
import '../../../core/utils/size_config.dart';
import 'widgets/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      backgroundColor: kWhite,
      appBar: CasualAppBar(
        title: 'My profile',
      ),
      body: ProfileBody(),
    );
  }
}
