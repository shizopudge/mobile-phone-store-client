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
      cost: json['cost'] as String,
      paymentUrl: json['paymentUrl'] as String,
      currency: json['currency'] as String,
      description: json['description'] as String,
      userId: json['userId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PurchaseModelToJson(_$_PurchaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'status': _$PurchaseStatusEnumMap[instance.status]!,
      'cost': instance.cost,
      'paymentUrl': instance.paymentUrl,
      'currency': instance.currency,
      'description': instance.description,
      'userId': instance.userId,
      'products': instance.products,
    };

const _$PurchaseStatusEnumMap = {
  PurchaseStatus.PENDING: 'PENDING',
  PurchaseStatus.PAID: 'PAID',
  PurchaseStatus.SHIPPED: 'SHIPPED',
  PurchaseStatus.DELIVERED: 'DELIVERED',
  PurchaseStatus.CANCELLED: 'CANCELLED',
};
