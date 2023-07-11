// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_wishlist_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WishlistResponseModel _$$_WishlistResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_WishlistResponseModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WishlistResponseModelToJson(
        _$_WishlistResponseModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'products': instance.products,
    };
