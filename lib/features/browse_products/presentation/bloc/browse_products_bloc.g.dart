// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_products_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BrowseProductsState _$$_BrowseProductsStateFromJson(
        Map<String, dynamic> json) =>
    _$_BrowseProductsState(
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
          $enumDecodeNullable(_$BrowseProductsStatusEnumMap, json['status']) ??
              BrowseProductsStatus.initial,
      failure: json['failure'] == null
          ? const CasualFailure()
          : Failure.fromJson(json['failure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BrowseProductsStateToJson(
        _$_BrowseProductsState instance) =>
    <String, dynamic>{
      'info': instance.info,
      'products': instance.products,
      'filter': instance.filter,
      'status': _$BrowseProductsStatusEnumMap[instance.status]!,
      'failure': instance.failure,
    };

const _$BrowseProductsStatusEnumMap = {
  BrowseProductsStatus.initial: 'initial',
  BrowseProductsStatus.loading: 'loading',
  BrowseProductsStatus.refreshing: 'refreshing',
  BrowseProductsStatus.success: 'success',
  BrowseProductsStatus.failure: 'failure',
};
