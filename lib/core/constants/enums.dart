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

enum OperatingSystem {
  IOS,
  ANDROID;

  @override
  String toString() {
    if (this == IOS) {
      return 'IOS';
    }
    return 'ANDROID';
  }
}

enum DisplayType {
  TN,
  IPS,
  OLED,
  AMOLED,
  SuperAMOLED;

  @override
  String toString() {
    switch (this) {
      case DisplayType.TN:
        return 'TN';
      case DisplayType.IPS:
        return 'IPS';
      case DisplayType.OLED:
        return 'OLED';
      case DisplayType.AMOLED:
        return 'AMOLED';
      case DisplayType.SuperAMOLED:
        return 'SuperAMOLED';
      default:
        return 'Display Type';
    }
  }
}

enum SortBy {
  asc,
  desc;

  @override
  String toString() {
    if (this == SortBy.asc) return 'asc';
    return 'desc';
  }

  static SortBy fromString(String string) {
    if (string == 'asc') return SortBy.asc;
    return SortBy.desc;
  }
}
