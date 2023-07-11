// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_wishlist_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartWishlistResponseModel _$CartWishlistResponseModelFromJson(
    Map<String, dynamic> json) {
  return _WishlistResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CartWishlistResponseModel {
  InfoModel get info => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartWishlistResponseModelCopyWith<CartWishlistResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartWishlistResponseModelCopyWith<$Res> {
  factory $CartWishlistResponseModelCopyWith(CartWishlistResponseModel value,
          $Res Function(CartWishlistResponseModel) then) =
      _$CartWishlistResponseModelCopyWithImpl<$Res, CartWishlistResponseModel>;
  @useResult
  $Res call({InfoModel info, List<ProductModel> products});

  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class _$CartWishlistResponseModelCopyWithImpl<$Res,
        $Val extends CartWishlistResponseModel>
    implements $CartWishlistResponseModelCopyWith<$Res> {
  _$CartWishlistResponseModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_WishlistResponseModelCopyWith<$Res>
    implements $CartWishlistResponseModelCopyWith<$Res> {
  factory _$$_WishlistResponseModelCopyWith(_$_WishlistResponseModel value,
          $Res Function(_$_WishlistResponseModel) then) =
      __$$_WishlistResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InfoModel info, List<ProductModel> products});

  @override
  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class __$$_WishlistResponseModelCopyWithImpl<$Res>
    extends _$CartWishlistResponseModelCopyWithImpl<$Res,
        _$_WishlistResponseModel>
    implements _$$_WishlistResponseModelCopyWith<$Res> {
  __$$_WishlistResponseModelCopyWithImpl(_$_WishlistResponseModel _value,
      $Res Function(_$_WishlistResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? products = null,
  }) {
    return _then(_$_WishlistResponseModel(
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
class _$_WishlistResponseModel implements _WishlistResponseModel {
  const _$_WishlistResponseModel(
      {required this.info, required final List<ProductModel> products})
      : _products = products;

  factory _$_WishlistResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_WishlistResponseModelFromJson(json);

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
    return 'CartWishlistResponseModel(info: $info, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WishlistResponseModel &&
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
  _$$_WishlistResponseModelCopyWith<_$_WishlistResponseModel> get copyWith =>
      __$$_WishlistResponseModelCopyWithImpl<_$_WishlistResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WishlistResponseModelToJson(
      this,
    );
  }
}

abstract class _WishlistResponseModel implements CartWishlistResponseModel {
  const factory _WishlistResponseModel(
      {required final InfoModel info,
      required final List<ProductModel> products}) = _$_WishlistResponseModel;

  factory _WishlistResponseModel.fromJson(Map<String, dynamic> json) =
      _$_WishlistResponseModel.fromJson;

  @override
  InfoModel get info;
  @override
  List<ProductModel> get products;
  @override
  @JsonKey(ignore: true)
  _$$_WishlistResponseModelCopyWith<_$_WishlistResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
