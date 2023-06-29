extension PasswordValidators on String {
  bool containsUpperCase() {
    RegExp regEx = RegExp(r'(?=.*[A-Z])\w+');
    return regEx.hasMatch(this);
  }

  bool containsLowercase() {
    RegExp regEx = RegExp(r'(?=.*[a-z])\w+');
    return regEx.hasMatch(this);
  }
}
