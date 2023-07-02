// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsEventCopyWith<$Res> {
  factory $ProductsEventCopyWith(
          ProductsEvent value, $Res Function(ProductsEvent) then) =
      _$ProductsEventCopyWithImpl<$Res, ProductsEvent>;
}

/// @nodoc
class _$ProductsEventCopyWithImpl<$Res, $Val extends ProductsEvent>
    implements $ProductsEventCopyWith<$Res> {
  _$ProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartCopyWith<$Res> {
  factory _$$_StartCopyWith(_$_Start value, $Res Function(_$_Start) then) =
      __$$_StartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$_Start>
    implements _$$_StartCopyWith<$Res> {
  __$$_StartCopyWithImpl(_$_Start _value, $Res Function(_$_Start) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Start implements _Start {
  const _$_Start();

  @override
  String toString() {
    return 'ProductsEvent.start()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Start);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _Start implements ProductsEvent {
  const factory _Start() = _$_Start;
}

/// @nodoc
mixin _$ProductsState {
  List<Product> get products => throw _privateConstructorUsedError;
  Info get info => throw _privateConstructorUsedError;
  ProductsFilter get filter => throw _privateConstructorUsedError;
  ProductStatus get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;
  Product? get selectedProduct => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call(
      {List<Product> products,
      Info info,
      ProductsFilter filter,
      ProductStatus status,
      Failure failure,
      Product? selectedProduct});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? info = null,
    Object? filter = null,
    Object? status = null,
    Object? failure = null,
    Object? selectedProduct = freezed,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ProductsFilter,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductsStateCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$_ProductsStateCopyWith(
          _$_ProductsState value, $Res Function(_$_ProductsState) then) =
      __$$_ProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Product> products,
      Info info,
      ProductsFilter filter,
      ProductStatus status,
      Failure failure,
      Product? selectedProduct});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_ProductsStateCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$_ProductsState>
    implements _$$_ProductsStateCopyWith<$Res> {
  __$$_ProductsStateCopyWithImpl(
      _$_ProductsState _value, $Res Function(_$_ProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? info = null,
    Object? filter = null,
    Object? status = null,
    Object? failure = null,
    Object? selectedProduct = freezed,
  }) {
    return _then(_$_ProductsState(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ProductsFilter,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      selectedProduct: freezed == selectedProduct
          ? _value.selectedProduct
          : selectedProduct // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc

class _$_ProductsState extends _ProductsState {
  const _$_ProductsState(
      {final List<Product> products = const [],
      this.info = const Info.initial(),
      this.filter = const ProductsFilter(),
      this.status = ProductStatus.loading,
      this.failure = const UnknownFailure(),
      this.selectedProduct})
      : _products = products,
        super._();

  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final Info info;
  @override
  @JsonKey()
  final ProductsFilter filter;
  @override
  @JsonKey()
  final ProductStatus status;
  @override
  @JsonKey()
  final Failure failure;
  @override
  final Product? selectedProduct;

  @override
  String toString() {
    return 'ProductsState(products: $products, info: $info, filter: $filter, status: $status, failure: $failure, selectedProduct: $selectedProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsState &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      info,
      filter,
      status,
      failure,
      selectedProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsStateCopyWith<_$_ProductsState> get copyWith =>
      __$$_ProductsStateCopyWithImpl<_$_ProductsState>(this, _$identity);
}

abstract class _ProductsState extends ProductsState {
  const factory _ProductsState(
      {final List<Product> products,
      final Info info,
      final ProductsFilter filter,
      final ProductStatus status,
      final Failure failure,
      final Product? selectedProduct}) = _$_ProductsState;
  const _ProductsState._() : super._();

  @override
  List<Product> get products;
  @override
  Info get info;
  @override
  ProductsFilter get filter;
  @override
  ProductStatus get status;
  @override
  Failure get failure;
  @override
  Product? get selectedProduct;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsStateCopyWith<_$_ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
