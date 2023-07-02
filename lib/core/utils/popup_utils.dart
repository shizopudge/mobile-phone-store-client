import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../failure/failure.dart';
import '../styles/styles.dart';

class PopupUtils {
  static void showFailureSnackBar(
      {required BuildContext context, required Failure failure}) {
    final message = Failure.dynamicMessageToString(failure.message);
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          elevation: 8,
          backgroundColor: kDarkBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          duration: const Duration(milliseconds: 10000),
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: kRed),
              const SizedBox(width: 10),
              Flexible(
                child: AutoSizeText(
                  message,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: kRegular.copyWith(color: kWhite, fontSize: 16),
                  minFontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
