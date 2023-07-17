// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentModel _$$_PaymentModelFromJson(Map<String, dynamic> json) =>
    _$_PaymentModel(
      id: json['id'] as String,
      cost: json['cost'] as String,
      currency: json['currency'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_PaymentModelToJson(_$_PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cost': instance.cost,
      'currency': instance.currency,
      'description': instance.description,
      'url': instance.url,
    };
