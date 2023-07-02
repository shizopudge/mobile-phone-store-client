import 'package:equatable/equatable.dart';

import '../../constants/enums.dart';
import '../../data/models/current_user/current_user_model.dart';

class CurrentUser extends Equatable {
  final String id;
  final String email;
  final String username;
  final String? image;
  final UserRole role;
  final String? phone;
  const CurrentUser({
    required this.id,
    required this.email,
    required this.username,
    required this.image,
    required this.role,
    required this.phone,
  });

  CurrentUser copyWith({
    String? id,
    String? email,
    String? username,
    String? image,
    UserRole? role,
    String? phone,
  }) {
    return CurrentUser(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      image: image ?? this.image,
      role: role ?? this.role,
      phone: phone ?? this.phone,
    );
  }

  CurrentUser copyWithNewImage({
    required String? image,
  }) {
    return CurrentUser(
      id: id,
      email: email,
      username: username,
      image: image,
      role: role,
      phone: phone,
    );
  }

  factory CurrentUser.fromModel(CurrentUserModel model) => CurrentUser(
        id: model.id,
        email: model.email,
        username: model.username,
        role: model.role,
        image: model.image,
        phone: model.phone,
      );

  bool get isAdmin => role.isAdmin;

  @override
  List<Object?> get props => [id, email, username, image, role, phone];
}
