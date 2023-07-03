import 'package:equatable/equatable.dart';

class PasswordValidation extends Equatable {
  final bool isPassHasUpperCaseLetter;
  final bool isPassHasLowerCaseLetter;
  final bool isPassLongEnough;
  const PasswordValidation({
    this.isPassHasUpperCaseLetter = false,
    this.isPassHasLowerCaseLetter = false,
    this.isPassLongEnough = false,
  });

  PasswordValidation copyWith({
    bool? isPassHasUpperCaseLetter,
    bool? isPassHasLowerCaseLetter,
    bool? isPassLongEnough,
  }) {
    return PasswordValidation(
      isPassHasUpperCaseLetter:
          isPassHasUpperCaseLetter ?? this.isPassHasUpperCaseLetter,
      isPassHasLowerCaseLetter:
          isPassHasLowerCaseLetter ?? this.isPassHasLowerCaseLetter,
      isPassLongEnough: isPassLongEnough ?? this.isPassLongEnough,
    );
  }

  bool _validate() {
    if (isPassHasUpperCaseLetter &&
        isPassHasLowerCaseLetter &&
        isPassLongEnough) {
      return true;
    }
    return false;
  }

  bool get isValidated => _validate();

  @override
  List<Object?> get props =>
      [isPassHasUpperCaseLetter, isPassHasLowerCaseLetter, isPassLongEnough];
}
