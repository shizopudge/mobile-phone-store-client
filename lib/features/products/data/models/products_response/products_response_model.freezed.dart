// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductsResponseModel _$ProductsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ProductsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProductsResponseModel {
  InfoModel get info => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsResponseModelCopyWith<ProductsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsResponseModelCopyWith<$Res> {
  factory $ProductsResponseModelCopyWith(ProductsResponseModel value,
          $Res Function(ProductsResponseModel) then) =
      _$ProductsResponseModelCopyWithImpl<$Res, ProductsResponseModel>;
  @useResult
  $Res call({InfoModel info, List<ProductModel> products});

  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class _$ProductsResponseModelCopyWithImpl<$Res,
        $Val extends ProductsResponseModel>
    implements $ProductsResponseModelCopyWith<$Res> {
  _$ProductsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InfoModelCopyWith<$Res> get info {
    return $InfoModelCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductsResponseModelCopyWith<$Res>
    implements $ProductsResponseModelCopyWith<$Res> {
  factory _$$_ProductsResponseModelCopyWith(_$_ProductsResponseModel value,
          $Res Function(_$_ProductsResponseModel) then) =
      __$$_ProductsResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InfoModel info, List<ProductModel> products});

  @override
  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class __$$_ProductsResponseModelCopyWithImpl<$Res>
    extends _$ProductsResponseModelCopyWithImpl<$Res, _$_ProductsResponseModel>
    implements _$$_ProductsResponseModelCopyWith<$Res> {
  __$$_ProductsResponseModelCopyWithImpl(_$_ProductsResponseModel _value,
      $Res Function(_$_ProductsResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? products = null,
  }) {
    return _then(_$_ProductsResponseModel(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductsResponseModel implements _ProductsResponseModel {
  const _$_ProductsResponseModel(
      {required this.info, required final List<ProductModel> products})
      : _products = products;

  factory _$_ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductsResponseModelFromJson(json);

  @override
  final InfoModel info;
  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductsResponseModel(info: $info, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsResponseModel &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsResponseModelCopyWith<_$_ProductsResponseModel> get copyWith =>
      __$$_ProductsResponseModelCopyWithImpl<_$_ProductsResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductsResponseModelToJson(
      this,
    );
  }
}

abstract class _ProductsResponseModel implements ProductsResponseModel {
  const factory _ProductsResponseModel(
      {required final InfoModel info,
      required final List<ProductModel> products}) = _$_ProductsResponseModel;

  factory _ProductsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ProductsResponseModel.fromJson;

  @override
  InfoModel get info;
  @override
  List<ProductModel> get products;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsResponseModelCopyWith<_$_ProductsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
