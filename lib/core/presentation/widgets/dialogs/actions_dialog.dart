import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import '../other/casual_dialog.dart';

class ActionsDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> actions;
  const ActionsDialog({
    super.key,
    required this.actions,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CasualDialog(
        title: title,
        subtitle: subtitle,
        innerPadding: 12,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.setPadding(8),
            ),
            child: Column(
              children: List.generate(
                actions.length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.setPadding(12)),
                  child: actions[index],
                ),
              ),
            ),
          ),
        ));
  }
}
