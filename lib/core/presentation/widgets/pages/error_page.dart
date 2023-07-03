import 'package:flutter/material.dart';

import '../../../failure/failure.dart';
import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class ErrorPage extends StatelessWidget {
  final Failure? failure;
  final Widget? action;
  const ErrorPage({super.key, this.failure, this.action});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  failure?.message ?? 'Something went wrong...',
                  textAlign: TextAlign.center,
                  style: kSemiBold.copyWith(
                    fontSize: SizeConfig.fontHeaderSmall,
                    color: kDarkBlue,
                  ),
                ),
                action ?? const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
