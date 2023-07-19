// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_purchase_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreatePurchaseResponseModel _$$_CreatePurchaseResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_CreatePurchaseResponseModel(
      purchase:
          PurchaseModel.fromJson(json['purchase'] as Map<String, dynamic>),
      payment: PaymentModel.fromJson(json['payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CreatePurchaseResponseModelToJson(
        _$_CreatePurchaseResponseModel instance) =>
    <String, dynamic>{
      'purchase': instance.purchase,
      'payment': instance.payment,
    };
