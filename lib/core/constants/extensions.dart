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

extension FirstToUpperCase on String {
  String firstToUpperCase() {
    String str = '';
    List<String> msg = split('');
    msg[0] = msg[0].toUpperCase();
    for (var item in msg) {
      str += item;
    }
    return str;
  }
}
