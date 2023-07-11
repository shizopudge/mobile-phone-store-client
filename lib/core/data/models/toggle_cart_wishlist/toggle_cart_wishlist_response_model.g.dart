// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_cart_wishlist_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ToggleCartWishlistModel _$$_ToggleCartWishlistModelFromJson(
        Map<String, dynamic> json) =>
    _$_ToggleCartWishlistModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ToggleCartWishlistModelToJson(
        _$_ToggleCartWishlistModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };
