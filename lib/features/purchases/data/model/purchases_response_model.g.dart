// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchasesResponseModel _$$_PurchasesResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_PurchasesResponseModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      purchases: (json['purchases'] as List<dynamic>)
          .map((e) => PurchaseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PurchasesResponseModelToJson(
        _$_PurchasesResponseModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'purchases': instance.purchases,
    };
