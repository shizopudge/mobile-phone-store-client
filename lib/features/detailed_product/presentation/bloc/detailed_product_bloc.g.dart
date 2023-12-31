// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_product_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailedProductState _$$_DetailedProductStateFromJson(
        Map<String, dynamic> json) =>
    _$_DetailedProductState(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      purchase: json['purchase'] == null
          ? null
          : CreatePurchaseResponse.fromJson(json['purchase'] as String),
      status:
          $enumDecodeNullable(_$DetailedProductStatusEnumMap, json['status']) ??
              DetailedProductStatus.initial,
      failure: json['failure'] == null
          ? const CasualFailure()
          : Failure.fromJson(json['failure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DetailedProductStateToJson(
        _$_DetailedProductState instance) =>
    <String, dynamic>{
      'product': instance.product,
      'purchase': instance.purchase,
      'status': _$DetailedProductStatusEnumMap[instance.status]!,
      'failure': instance.failure,
    };

const _$DetailedProductStatusEnumMap = {
  DetailedProductStatus.initial: 'initial',
  DetailedProductStatus.loading: 'loading',
  DetailedProductStatus.creatingPurchase: 'creatingPurchase',
  DetailedProductStatus.success: 'success',
  DetailedProductStatus.failure: 'failure',
};
