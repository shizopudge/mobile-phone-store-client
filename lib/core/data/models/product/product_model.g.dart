// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      title: json['title'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      inStockCount: json['inStockCount'] as int,
      cost: (json['cost'] as num).toDouble(),
      slug: json['slug'] as String,
      color: json['color'] as String,
      colorCode: json['colorCode'] as String,
      storage: json['storage'] as int,
      discount: json['discount'] as int?,
      model: json['model'] == null
          ? null
          : ModelModel.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'title': instance.title,
      'images': instance.images,
      'inStockCount': instance.inStockCount,
      'cost': instance.cost,
      'slug': instance.slug,
      'color': instance.color,
      'colorCode': instance.colorCode,
      'storage': instance.storage,
      'discount': instance.discount,
      'model': instance.model,
    };
