// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseNotficationModel _$$_PurchaseNotficationModelFromJson(
        Map<String, dynamic> json) =>
    _$_PurchaseNotficationModel(
      paymentId: json['paymentId'] as String,
      cost: json['cost'] as String,
      currency: json['currency'] as String,
      status: $enumDecode(_$PurchaseStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_PurchaseNotficationModelToJson(
        _$_PurchaseNotficationModel instance) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
      'cost': instance.cost,
      'currency': instance.currency,
      'status': _$PurchaseStatusEnumMap[instance.status]!,
    };

const _$PurchaseStatusEnumMap = {
  PurchaseStatus.PENDING: 'PENDING',
  PurchaseStatus.PAID: 'PAID',
  PurchaseStatus.SHIPPED: 'SHIPPED',
  PurchaseStatus.DELIVERED: 'DELIVERED',
  PurchaseStatus.CANCELLED: 'CANCELLED',
};
