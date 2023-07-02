// ignore_for_file: constant_identifier_names

enum UserRole {
  CASUAL,
  ADMIN;

  bool get isAdmin => this == UserRole.ADMIN;
}

enum LoginType {
  guest,
  user;

  bool get isGuest => this == guest;

  @override
  String toString() {
    if (this == guest) return 'guest';
    return 'user';
  }

  static LoginType fromString(String str) {
    if (str == 'guest') return guest;
    return user;
  }
}
