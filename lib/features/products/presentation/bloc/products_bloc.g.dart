// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductsState _$$_ProductsStateFromJson(Map<String, dynamic> json) =>
    _$_ProductsState(
      info: json['info'] == null
          ? const Info.initial()
          : Info.fromJson(json['info'] as String),
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      filter: json['filter'] == null
          ? const ProductsFilter()
          : ProductsFilter.fromJson(json['filter'] as String),
      status: $enumDecodeNullable(_$ProductsStatusEnumMap, json['status']) ??
          ProductsStatus.loading,
      failure: json['failure'] == null
          ? const UnknownFailure()
          : Failure.fromJson(json['failure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductsStateToJson(_$_ProductsState instance) =>
    <String, dynamic>{
      'info': instance.info,
      'products': instance.products,
      'filter': instance.filter,
      'status': _$ProductsStatusEnumMap[instance.status]!,
      'failure': instance.failure,
    };

const _$ProductsStatusEnumMap = {
  ProductsStatus.loading: 'loading',
  ProductsStatus.refreshing: 'refreshing',
  ProductsStatus.success: 'success',
  ProductsStatus.failure: 'failure',
};
