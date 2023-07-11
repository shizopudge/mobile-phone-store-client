// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CasualFailure _$$CasualFailureFromJson(Map<String, dynamic> json) =>
    _$CasualFailure(
      message: json['message'] as String? ?? 'Something went wrong...',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CasualFailureToJson(_$CasualFailure instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$ServerFailure _$$ServerFailureFromJson(Map<String, dynamic> json) =>
    _$ServerFailure(
      message: json['message'],
      error: json['error'] as String?,
      statusCode: json['statusCode'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ServerFailureToJson(_$ServerFailure instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'statusCode': instance.statusCode,
      'runtimeType': instance.$type,
    };

_$CacheFailure _$$CacheFailureFromJson(Map<String, dynamic> json) =>
    _$CacheFailure(
      message: json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CacheFailureToJson(_$CacheFailure instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
