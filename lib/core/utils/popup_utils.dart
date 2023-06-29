import 'package:flutter/material.dart';

import '../failures/failure.dart';
import '../styles/styles.dart';

class PopupUtils {
  static void showFailureSnackBar(
      {required BuildContext context, required Failure failure}) {
    //? Select an icon depending on the type of error
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
              Text(
                failure.message.toString(),
                style: kRegular.copyWith(color: kWhite, fontSize: 18),
              ),
            ],
          ),
        ),
      );
  }
}
