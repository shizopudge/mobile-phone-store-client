import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/styles/styles.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController _controller;
  final String hintText;
  final bool isValidated;
  final bool showCheckIcon;
  const AuthTextField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    required this.isValidated,
    this.showCheckIcon = true,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      inputFormatters: [
        FilteringTextInputFormatter.deny(
          RegExp('[ ]'),
        ),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z\.@]'))
      ],
      style: kSemiBold.copyWith(color: kDarkBlue, fontSize: 18),
      cursorColor: kDarkBlue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: kSemiBold.copyWith(color: kGrey, fontSize: 18),
        suffixIcon: showCheckIcon
            ? isValidated
                ? const Icon(
                    Icons.check_rounded,
                    color: kLightBlue,
                  )
                : null
            : null,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: kGrey, width: .8),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kDarkBlue, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kDarkBlue, width: 1.5),
        ),
      ),
    );
  }
}
