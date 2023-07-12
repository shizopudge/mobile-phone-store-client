import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../styles/styles.dart';
import '../../../utils/size_config.dart';

class PasswordTextFieldCubit extends Cubit<bool> {
  PasswordTextFieldCubit() : super(false);

  void toggleVisibility() => state ? emit(false) : emit(true);
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController _passwordController;
  final bool isAvailable;
  final bool autofocus;
  final String hint;
  const PasswordTextField({
    super.key,
    required TextEditingController passwordController,
    required this.isAvailable,
    this.hint = 'Password',
    this.autofocus = false,
  }) : _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordTextFieldCubit(),
      child: BlocBuilder<PasswordTextFieldCubit, bool>(
        builder: (context, state) => TextField(
          controller: _passwordController,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp('[ ]'),
            ),
            FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z]'))
          ],
          autofocus: autofocus,
          enabled: isAvailable,
          style:
              kSemiBold.copyWith(color: kDarkBlue, fontSize: SizeConfig.body1),
          cursorColor: kDarkBlue,
          obscureText: !state,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                kSemiBold.copyWith(color: kGrey, fontSize: SizeConfig.body1),
            contentPadding: EdgeInsets.all(SizeConfig.setPadding(12)),
            suffixIcon: isAvailable
                ? state
                    ? IconButton(
                        onPressed: () => context
                            .read<PasswordTextFieldCubit>()
                            .toggleVisibility(),
                        icon: Icon(
                          Icons.visibility_off_outlined,
                          size: SizeConfig.iconMedium,
                          color: kLightBlue,
                        ),
                      )
                    : IconButton(
                        onPressed: () => context
                            .read<PasswordTextFieldCubit>()
                            .toggleVisibility(),
                        icon: Icon(
                          Icons.visibility_outlined,
                          size: SizeConfig.iconMedium,
                          color: kLightBlue,
                        ),
                      )
                : null,
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
        ),
      ),
    );
  }
}
