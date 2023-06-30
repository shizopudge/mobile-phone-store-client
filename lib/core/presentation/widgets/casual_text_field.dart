import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/styles.dart';

class CasualTextField extends StatelessWidget {
  final TextEditingController _controller;
  final String hintText;
  final bool isValidated;
  final bool showCheckIcon;
  final List<TextInputFormatter>? inputFormatters;
  const CasualTextField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    required this.isValidated,
    this.showCheckIcon = true,
    this.inputFormatters,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      inputFormatters: inputFormatters,
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
