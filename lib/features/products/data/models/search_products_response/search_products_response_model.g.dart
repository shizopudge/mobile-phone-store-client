// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchProductsResponseModel _$$_SearchProductsResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SearchProductsResponseModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchProductsResponseModelToJson(
        _$_SearchProductsResponseModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'products': instance.products,
    };
