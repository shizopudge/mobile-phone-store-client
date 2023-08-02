import 'dart:ui';

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

extension RemoveFirst on String {
  String removeFirst() {
    List<String> splitted = split('');
    splitted.removeAt(0);
    return splitted.join();
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
