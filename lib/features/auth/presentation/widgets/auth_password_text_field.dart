import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/styles.dart';

class AuthPasswordTextFieldCubit extends Cubit<bool> {
  AuthPasswordTextFieldCubit() : super(false);

  void toggleVisibility() => state ? emit(false) : emit(true);
}

class AuthPasswordTextField extends StatelessWidget {
  final TextEditingController _passwordController;
  final String hintText;
  final bool isAvailable;
  const AuthPasswordTextField({
    super.key,
    required TextEditingController passwordController,
    required this.isAvailable,
    required this.hintText,
  }) : _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthPasswordTextFieldCubit(),
      child: BlocBuilder<AuthPasswordTextFieldCubit, bool>(
        builder: (context, state) => TextField(
          controller: _passwordController,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp('[ ]'),
            ),
            FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z]'))
          ],
          enabled: isAvailable,
          style: kSemiBold.copyWith(color: kDarkBlue, fontSize: 18),
          cursorColor: kDarkBlue,
          obscureText: !state,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: kSemiBold.copyWith(color: kGrey, fontSize: 18),
            suffixIcon: isAvailable
                ? state
                    ? IconButton(
                        onPressed: () => context
                            .read<AuthPasswordTextFieldCubit>()
                            .toggleVisibility(),
                        icon: const Icon(
                          Icons.visibility_off_outlined,
                          color: kLightBlue,
                        ),
                      )
                    : IconButton(
                        onPressed: () => context
                            .read<AuthPasswordTextFieldCubit>()
                            .toggleVisibility(),
                        icon: const Icon(
                          Icons.visibility_outlined,
                          color: kLightBlue,
                        ),
                      )
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
        ),
      ),
    );
  }
}
