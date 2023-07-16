// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchaseModel _$$_PurchaseModelFromJson(Map<String, dynamic> json) =>
    _$_PurchaseModel(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      status: $enumDecode(_$PurchaseStatusEnumMap, json['status']),
      userId: json['userId'] as String,
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$$_PurchaseModelToJson(_$_PurchaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'status': _$PurchaseStatusEnumMap[instance.status]!,
      'userId': instance.userId,
      'productId': instance.productId,
    };

const _$PurchaseStatusEnumMap = {
  PurchaseStatus.PENDING: 'PENDING',
  PurchaseStatus.PAID: 'PAID',
  PurchaseStatus.SHIPPED: 'SHIPPED',
  PurchaseStatus.DELIVERED: 'DELIVERED',
  PurchaseStatus.CANCELLED: 'CANCELLED',
};
