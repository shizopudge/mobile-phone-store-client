import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class CasualTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? isValidated;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChange;
  final double? fontSize;
  final String? label;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? counterText;
  final TextStyle? counterStyle;
  final bool? isAvailable;
  const CasualTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isValidated,
    this.inputFormatters,
    this.onChange,
    this.fontSize,
    this.label,
    this.labelStyle,
    this.keyboardType,
    this.maxLength,
    this.counterText,
    this.counterStyle,
    this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      style: kSemiBold.copyWith(
          color: kDarkBlue, fontSize: fontSize ?? SizeConfig.body1),
      cursorColor: kDarkBlue,
      onChanged: onChange,
      maxLength: maxLength,
      enabled: isAvailable,
      decoration: InputDecoration(
        counterText: counterText,
        counterStyle: counterStyle,
        hintText: hintText,
        hintStyle: kSemiBold.copyWith(
            color: kGrey, fontSize: fontSize ?? SizeConfig.body1),
        contentPadding: EdgeInsets.all(SizeConfig.setPadding(12)),
        suffixIcon: isValidated != null && isValidated!
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.setPadding(8)),
                child: Icon(
                  Icons.check_rounded,
                  size: SizeConfig.iconMedium,
                  color: kLightBlue,
                ),
              )
            : null,
        labelText: label,
        labelStyle: labelStyle,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: kGrey),
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadiusDefault,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kDarkBlue),
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadiusDefault,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kLightBlue),
          borderRadius: BorderRadius.circular(
            SizeConfig.borderRadiusDefault,
          ),
        ),
      ),
    );
  }
}
