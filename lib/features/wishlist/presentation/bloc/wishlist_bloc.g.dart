// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WishlistState _$$_WishlistStateFromJson(Map<String, dynamic> json) =>
    _$_WishlistState(
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
      status: $enumDecodeNullable(_$WishlistStatusEnumMap, json['status']) ??
          WishlistStatus.initial,
      failure: json['failure'] == null
          ? const CasualFailure()
          : Failure.fromJson(json['failure'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WishlistStateToJson(_$_WishlistState instance) =>
    <String, dynamic>{
      'info': instance.info,
      'products': instance.products,
      'filter': instance.filter,
      'status': _$WishlistStatusEnumMap[instance.status]!,
      'failure': instance.failure,
    };

const _$WishlistStatusEnumMap = {
  WishlistStatus.initial: 'initial',
  WishlistStatus.loading: 'loading',
  WishlistStatus.refreshing: 'refreshing',
  WishlistStatus.success: 'success',
  WishlistStatus.failure: 'failure',
};
