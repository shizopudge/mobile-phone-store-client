// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ManufacturersResponseModel _$$_ManufacturersResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_ManufacturersResponseModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      manufacturers: (json['manufacturers'] as List<dynamic>)
          .map((e) => ManufacturerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ManufacturersResponseModelToJson(
        _$_ManufacturersResponseModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'manufacturers': instance.manufacturers,
    };
