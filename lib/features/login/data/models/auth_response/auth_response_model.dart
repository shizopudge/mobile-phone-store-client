import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/models/current_user/current_user_model.dart';
import '../../../../../core/data/models/tokens/tokens_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required CurrentUserModel user,
    required TokensModel tokens,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
