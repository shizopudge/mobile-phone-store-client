// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browse_products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BrowseProductsResponseModel _$$_BrowseProductsResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_BrowseProductsResponseModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BrowseProductsResponseModelToJson(
        _$_BrowseProductsResponseModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'products': instance.products,
    };
