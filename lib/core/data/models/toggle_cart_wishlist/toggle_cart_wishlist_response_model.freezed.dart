// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_cart_wishlist_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToggleCartWishlistResponseModel _$ToggleCartWishlistResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ToggleCartWishlistModel.fromJson(json);
}

/// @nodoc
mixin _$ToggleCartWishlistResponseModel {
  List<ProductModel> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToggleCartWishlistResponseModelCopyWith<ToggleCartWishlistResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleCartWishlistResponseModelCopyWith<$Res> {
  factory $ToggleCartWishlistResponseModelCopyWith(
          ToggleCartWishlistResponseModel value,
          $Res Function(ToggleCartWishlistResponseModel) then) =
      _$ToggleCartWishlistResponseModelCopyWithImpl<$Res,
          ToggleCartWishlistResponseModel>;
  @useResult
  $Res call({List<ProductModel> products});
}

/// @nodoc
class _$ToggleCartWishlistResponseModelCopyWithImpl<$Res,
        $Val extends ToggleCartWishlistResponseModel>
    implements $ToggleCartWishlistResponseModelCopyWith<$Res> {
  _$ToggleCartWishlistResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ToggleCartWishlistModelCopyWith<$Res>
    implements $ToggleCartWishlistResponseModelCopyWith<$Res> {
  factory _$$_ToggleCartWishlistModelCopyWith(_$_ToggleCartWishlistModel value,
          $Res Function(_$_ToggleCartWishlistModel) then) =
      __$$_ToggleCartWishlistModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductModel> products});
}

/// @nodoc
class __$$_ToggleCartWishlistModelCopyWithImpl<$Res>
    extends _$ToggleCartWishlistResponseModelCopyWithImpl<$Res,
        _$_ToggleCartWishlistModel>
    implements _$$_ToggleCartWishlistModelCopyWith<$Res> {
  __$$_ToggleCartWishlistModelCopyWithImpl(_$_ToggleCartWishlistModel _value,
      $Res Function(_$_ToggleCartWishlistModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$_ToggleCartWishlistModel(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ToggleCartWishlistModel implements _ToggleCartWishlistModel {
  const _$_ToggleCartWishlistModel({required final List<ProductModel> products})
      : _products = products;

  factory _$_ToggleCartWishlistModel.fromJson(Map<String, dynamic> json) =>
      _$$_ToggleCartWishlistModelFromJson(json);

  final List<ProductModel> _products;
  @override
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ToggleCartWishlistResponseModel(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleCartWishlistModel &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleCartWishlistModelCopyWith<_$_ToggleCartWishlistModel>
      get copyWith =>
          __$$_ToggleCartWishlistModelCopyWithImpl<_$_ToggleCartWishlistModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ToggleCartWishlistModelToJson(
      this,
    );
  }
}

abstract class _ToggleCartWishlistModel
    implements ToggleCartWishlistResponseModel {
  const factory _ToggleCartWishlistModel(
          {required final List<ProductModel> products}) =
      _$_ToggleCartWishlistModel;

  factory _ToggleCartWishlistModel.fromJson(Map<String, dynamic> json) =
      _$_ToggleCartWishlistModel.fromJson;

  @override
  List<ProductModel> get products;
  @override
  @JsonKey(ignore: true)
  _$$_ToggleCartWishlistModelCopyWith<_$_ToggleCartWishlistModel>
      get copyWith => throw _privateConstructorUsedError;
}
