import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../failure/failure.dart';
import '../styles/styles.dart';
import 'size_config.dart';

class PopupUtils {
  static void showFailureSnackBar(
      {required BuildContext context, required Failure failure}) {
    final message = Failure.dynamicMessageToString(failure.message);
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          elevation: 8,
          backgroundColor: kBlack,
          duration: const Duration(milliseconds: 5000),
          content: Row(
            children: [
              Icon(Icons.error_outline,
                  size: SizeConfig.iconMedium, color: kRed),
              const SizedBox(width: 10),
              Flexible(
                child: AutoSizeText(
                  message,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: kSemiBold.copyWith(
                      color: kLightWhite, fontSize: SizeConfig.body1),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
