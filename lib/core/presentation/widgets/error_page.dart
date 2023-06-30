import 'package:flutter/material.dart';

import '../../failure/failure.dart';
import '../../styles/styles.dart';

class ErrorPage extends StatelessWidget {
  final Failure? failure;
  final Widget? action;
  const ErrorPage({super.key, this.failure, this.action});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                failure?.message ?? 'Something went wrong...',
                textAlign: TextAlign.center,
                style: kSemiBold.copyWith(
                  fontSize: 32,
                  color: kDarkBlue,
                ),
              ),
              action ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
