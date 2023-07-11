// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_products_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchProductsState _$$_SearchProductsStateFromJson(
        Map<String, dynamic> json) =>
    _$_SearchProductsState(
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
      status:
          $enumDecodeNullable(_$SearchProductsStatusEnumMap, json['status']) ??
              SearchProductsStatus.initial,
      failure: json['failure'] == null
          ? const CasualFailure()
          : Failure.fromJson(json['failure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SearchProductsStateToJson(
        _$_SearchProductsState instance) =>
    <String, dynamic>{
      'info': instance.info,
      'products': instance.products,
      'filter': instance.filter,
      'status': _$SearchProductsStatusEnumMap[instance.status]!,
      'failure': instance.failure,
    };

const _$SearchProductsStatusEnumMap = {
  SearchProductsStatus.initial: 'initial',
  SearchProductsStatus.loading: 'loading',
  SearchProductsStatus.refreshing: 'refreshing',
  SearchProductsStatus.success: 'success',
  SearchProductsStatus.failure: 'failure',
};
