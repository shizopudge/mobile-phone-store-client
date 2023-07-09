// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  int get inStockCount => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get colorCode => throw _privateConstructorUsedError;
  int get storage => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  ModelModel? get model => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String title,
      List<String> images,
      int inStockCount,
      double cost,
      String slug,
      String color,
      String colorCode,
      int storage,
      int? discount,
      ModelModel? model});

  $ModelModelCopyWith<$Res>? get model;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? title = null,
    Object? images = null,
    Object? inStockCount = null,
    Object? cost = null,
    Object? slug = null,
    Object? color = null,
    Object? colorCode = null,
    Object? storage = null,
    Object? discount = freezed,
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inStockCount: null == inStockCount
          ? _value.inStockCount
          : inStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      storage: null == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as int,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ModelModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ModelModelCopyWith<$Res>? get model {
    if (_value.model == null) {
      return null;
    }

    return $ModelModelCopyWith<$Res>(_value.model!, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      String title,
      List<String> images,
      int inStockCount,
      double cost,
      String slug,
      String color,
      String colorCode,
      int storage,
      int? discount,
      ModelModel? model});

  @override
  $ModelModelCopyWith<$Res>? get model;
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? title = null,
    Object? images = null,
    Object? inStockCount = null,
    Object? cost = null,
    Object? slug = null,
    Object? color = null,
    Object? colorCode = null,
    Object? storage = null,
    Object? discount = freezed,
    Object? model = freezed,
  }) {
    return _then(_$_ProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      inStockCount: null == inStockCount
          ? _value.inStockCount
          : inStockCount // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String,
      storage: null == storage
          ? _value.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as int,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ModelModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel extends _ProductModel {
  const _$_ProductModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.title,
      required final List<String> images,
      required this.inStockCount,
      required this.cost,
      required this.slug,
      required this.color,
      required this.colorCode,
      required this.storage,
      required this.discount,
      required this.model})
      : _images = images,
        super._();

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String title;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final int inStockCount;
  @override
  final double cost;
  @override
  final String slug;
  @override
  final String color;
  @override
  final String colorCode;
  @override
  final int storage;
  @override
  final int? discount;
  @override
  final ModelModel? model;

  @override
  String toString() {
    return 'ProductModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, images: $images, inStockCount: $inStockCount, cost: $cost, slug: $slug, color: $color, colorCode: $colorCode, storage: $storage, discount: $discount, model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.inStockCount, inStockCount) ||
                other.inStockCount == inStockCount) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.storage, storage) || other.storage == storage) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.model, model) || other.model == model));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      title,
      const DeepCollectionEquality().hash(_images),
      inStockCount,
      cost,
      slug,
      color,
      colorCode,
      storage,
      discount,
      model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel extends ProductModel {
  const factory _ProductModel(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final String title,
      required final List<String> images,
      required final int inStockCount,
      required final double cost,
      required final String slug,
      required final String color,
      required final String colorCode,
      required final int storage,
      required final int? discount,
      required final ModelModel? model}) = _$_ProductModel;
  const _ProductModel._() : super._();

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get title;
  @override
  List<String> get images;
  @override
  int get inStockCount;
  @override
  double get cost;
  @override
  String get slug;
  @override
  String get color;
  @override
  String get colorCode;
  @override
  int get storage;
  @override
  int? get discount;
  @override
  ModelModel? get model;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
