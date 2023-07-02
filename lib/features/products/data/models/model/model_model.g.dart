// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModelModel _$$_ModelModelFromJson(Map<String, dynamic> json) =>
    _$_ModelModel(
      id: json['id'] as String,
      name: json['name'] as String,
      pixelDensity: json['pixelDensity'] as int,
      screenRefreshRate: json['screenRefreshRate'] as int,
      screenDiagonal: (json['screenDiagonal'] as num).toDouble(),
      weight: json['weight'] as int,
      screenResolution: json['screenResolution'] as String,
      operatingSystem:
          $enumDecode(_$OperatingSystemEnumMap, json['operatingSystem']),
      displayType: $enumDecode(_$DisplayTypeEnumMap, json['displayType']),
      manufacturer: ManufacturerModel.fromJson(
          json['manufacturer'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ModelModelToJson(_$_ModelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pixelDensity': instance.pixelDensity,
      'screenRefreshRate': instance.screenRefreshRate,
      'screenDiagonal': instance.screenDiagonal,
      'weight': instance.weight,
      'screenResolution': instance.screenResolution,
      'operatingSystem': _$OperatingSystemEnumMap[instance.operatingSystem]!,
      'displayType': _$DisplayTypeEnumMap[instance.displayType]!,
      'manufacturer': instance.manufacturer,
      'products': instance.products,
    };

const _$OperatingSystemEnumMap = {
  OperatingSystem.IOS: 'IOS',
  OperatingSystem.ANDROID: 'ANDROID',
};

const _$DisplayTypeEnumMap = {
  DisplayType.TN: 'TN',
  DisplayType.IPS: 'IPS',
  DisplayType.OLED: 'OLED',
  DisplayType.AMOLED: 'AMOLED',
  DisplayType.SuperAMOLED: 'SuperAMOLED',
};
