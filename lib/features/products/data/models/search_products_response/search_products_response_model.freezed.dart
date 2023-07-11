// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_products_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchProductsResponseModel _$SearchProductsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SearchProductsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SearchProductsResponseModel {
  InfoModel get info => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchProductsResponseModelCopyWith<SearchProductsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProductsResponseModelCopyWith<$Res> {
  factory $SearchProductsResponseModelCopyWith(
          SearchProductsResponseModel value,
          $Res Function(SearchProductsResponseModel) then) =
      _$SearchProductsResponseModelCopyWithImpl<$Res,
          SearchProductsResponseModel>;
  @useResult
  $Res call({InfoModel info, List<ProductModel> products});

  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class _$SearchProductsResponseModelCopyWithImpl<$Res,
        $Val extends SearchProductsResponseModel>
    implements $SearchProductsResponseModelCopyWith<$Res> {
  _$SearchProductsResponseModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_SearchProductsResponseModelCopyWith<$Res>
    implements $SearchProductsResponseModelCopyWith<$Res> {
  factory _$$_SearchProductsResponseModelCopyWith(
          _$_SearchProductsResponseModel value,
          $Res Function(_$_SearchProductsResponseModel) then) =
      __$$_SearchProductsResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InfoModel info, List<ProductModel> products});

  @override
  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class __$$_SearchProductsResponseModelCopyWithImpl<$Res>
    extends _$SearchProductsResponseModelCopyWithImpl<$Res,
        _$_SearchProductsResponseModel>
    implements _$$_SearchProductsResponseModelCopyWith<$Res> {
  __$$_SearchProductsResponseModelCopyWithImpl(
      _$_SearchProductsResponseModel _value,
      $Res Function(_$_SearchProductsResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? products = null,
  }) {
    return _then(_$_SearchProductsResponseModel(
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
class _$_SearchProductsResponseModel implements _SearchProductsResponseModel {
  const _$_SearchProductsResponseModel(
      {required this.info, required final List<ProductModel> products})
      : _products = products;

  factory _$_SearchProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SearchProductsResponseModelFromJson(json);

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
    return 'SearchProductsResponseModel(info: $info, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchProductsResponseModel &&
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
  _$$_SearchProductsResponseModelCopyWith<_$_SearchProductsResponseModel>
      get copyWith => __$$_SearchProductsResponseModelCopyWithImpl<
          _$_SearchProductsResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchProductsResponseModelToJson(
      this,
    );
  }
}

abstract class _SearchProductsResponseModel
    implements SearchProductsResponseModel {
  const factory _SearchProductsResponseModel(
          {required final InfoModel info,
          required final List<ProductModel> products}) =
      _$_SearchProductsResponseModel;

  factory _SearchProductsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SearchProductsResponseModel.fromJson;

  @override
  InfoModel get info;
  @override
  List<ProductModel> get products;
  @override
  @JsonKey(ignore: true)
  _$$_SearchProductsResponseModelCopyWith<_$_SearchProductsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
