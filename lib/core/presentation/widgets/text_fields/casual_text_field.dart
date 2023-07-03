import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

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
      style:
          kSemiBold.copyWith(color: kDarkBlue, fontSize: SizeConfig.fontTitle),
      cursorColor: kDarkBlue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            kSemiBold.copyWith(color: kGrey, fontSize: SizeConfig.fontTitle),
        suffixIcon: showCheckIcon
            ? isValidated
                ? Icon(
                    Icons.check_rounded,
                    size: SizeConfig.iconMedium,
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
