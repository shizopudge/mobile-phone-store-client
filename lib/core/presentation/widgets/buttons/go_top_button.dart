import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class GoTopButton extends StatelessWidget {
  const GoTopButton({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      onPressed: () => _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 250), curve: Curves.easeOut),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SizeConfig.borderRadiusDefault,
        ),
      ),
      backgroundColor: kDarkBlue,
      child: const Icon(
        Icons.arrow_upward_rounded,
        color: kWhite,
      ),
    );
  }
}
