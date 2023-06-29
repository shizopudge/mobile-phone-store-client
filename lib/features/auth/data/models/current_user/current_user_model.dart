import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/constants/enums.dart';

part 'current_user_model.freezed.dart';
part 'current_user_model.g.dart';

@freezed
class CurrentUserModel with _$CurrentUserModel {
  const factory CurrentUserModel({
    required String id,
    required String email,
    required String username,
    required String? image,
    required UserRole role,
    required String? phone,
  }) = _CurrentUserModel;

  factory CurrentUserModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserModelFromJson(json);
}
