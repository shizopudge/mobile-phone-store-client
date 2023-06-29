// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthResponseModel _$$_AuthResponseModelFromJson(Map<String, dynamic> json) =>
    _$_AuthResponseModel(
      user: CurrentUserModel.fromJson(json['user'] as Map<String, dynamic>),
      tokens: TokensModel.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthResponseModelToJson(
        _$_AuthResponseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };
