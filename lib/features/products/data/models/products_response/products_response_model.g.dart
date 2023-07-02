// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductsResponseModel _$$_ProductsResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProductsResponseModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductsResponseModelToJson(
        _$_ProductsResponseModel instance) =>
    <String, dynamic>{
      'info': instance.info,
      'products': instance.products,
    };
