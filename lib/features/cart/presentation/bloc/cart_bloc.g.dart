// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartState _$$_CartStateFromJson(Map<String, dynamic> json) => _$_CartState(
      info: json['info'] == null
          ? const Info.initial()
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      filter: json['filter'] == null
          ? const ProductsFilter()
          : ProductsFilter.fromJson(json['filter'] as String),
      status: $enumDecodeNullable(_$CartStatusEnumMap, json['status']) ??
          CartStatus.initial,
      failure: json['failure'] == null
          ? const CasualFailure()
          : Failure.fromJson(json['failure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CartStateToJson(_$_CartState instance) =>
    <String, dynamic>{
      'info': instance.info,
      'products': instance.products,
      'filter': instance.filter,
      'status': _$CartStatusEnumMap[instance.status]!,
      'failure': instance.failure,
    };

const _$CartStatusEnumMap = {
  CartStatus.initial: 'initial',
  CartStatus.loading: 'loading',
  CartStatus.refreshing: 'refreshing',
  CartStatus.success: 'success',
  CartStatus.failure: 'failure',
};
