// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModelsResponseModel _$$_ModelsResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_ModelsResponseModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      models: (json['models'] as List<dynamic>)
          .map((e) => ModelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ModelsResponseModelToJson(
        _$_ModelsResponseModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'models': instance.models,
    };
