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
    required TResult Function() refreshProducts,
    required TResult Function() getNextProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(ProductsFilter filter) changeFilter,
    required TResult Function(Product? product) changeProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? refreshProducts,
    TResult? Function()? getNextProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(ProductsFilter filter)? changeFilter,
    TResult? Function(Product? product)? changeProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? refreshProducts,
    TResult Function()? getNextProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(ProductsFilter filter)? changeFilter,
    TResult Function(Product? product)? changeProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_RefreshProducts value) refreshProducts,
    required TResult Function(_GetNextProducts value) getNextProducts,
    required TResult Function(_SearchProducts value) searchProducts,
    required TResult Function(_ChangeFilter value) changeFilter,
    required TResult Function(_ChangeProduct value) changeProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_RefreshProducts value)? refreshProducts,
    TResult? Function(_GetNextProducts value)? getNextProducts,
    TResult? Function(_SearchProducts value)? searchProducts,
    TResult? Function(_ChangeFilter value)? changeFilter,
    TResult? Function(_ChangeProduct value)? changeProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_RefreshProducts value)? refreshProducts,
    TResult Function(_GetNextProducts value)? getNextProducts,
    TResult Function(_SearchProducts value)? searchProducts,
    TResult Function(_ChangeFilter value)? changeFilter,
    TResult Function(_ChangeProduct value)? changeProduct,
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
    required TResult Function() refreshProducts,
    required TResult Function() getNextProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(ProductsFilter filter) changeFilter,
    required TResult Function(Product? product) changeProduct,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? refreshProducts,
    TResult? Function()? getNextProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(ProductsFilter filter)? changeFilter,
    TResult? Function(Product? product)? changeProduct,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? refreshProducts,
    TResult Function()? getNextProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(ProductsFilter filter)? changeFilter,
    TResult Function(Product? product)? changeProduct,
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
    required TResult Function(_RefreshProducts value) refreshProducts,
    required TResult Function(_GetNextProducts value) getNextProducts,
    required TResult Function(_SearchProducts value) searchProducts,
    required TResult Function(_ChangeFilter value) changeFilter,
    required TResult Function(_ChangeProduct value) changeProduct,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_RefreshProducts value)? refreshProducts,
    TResult? Function(_GetNextProducts value)? getNextProducts,
    TResult? Function(_SearchProducts value)? searchProducts,
    TResult? Function(_ChangeFilter value)? changeFilter,
    TResult? Function(_ChangeProduct value)? changeProduct,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_RefreshProducts value)? refreshProducts,
    TResult Function(_GetNextProducts value)? getNextProducts,
    TResult Function(_SearchProducts value)? searchProducts,
    TResult Function(_ChangeFilter value)? changeFilter,
    TResult Function(_ChangeProduct value)? changeProduct,
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
abstract class _$$_RefreshProductsCopyWith<$Res> {
  factory _$$_RefreshProductsCopyWith(
          _$_RefreshProducts value, $Res Function(_$_RefreshProducts) then) =
      __$$_RefreshProductsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshProductsCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$_RefreshProducts>
    implements _$$_RefreshProductsCopyWith<$Res> {
  __$$_RefreshProductsCopyWithImpl(
      _$_RefreshProducts _value, $Res Function(_$_RefreshProducts) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RefreshProducts implements _RefreshProducts {
  const _$_RefreshProducts();

  @override
  String toString() {
    return 'ProductsEvent.refreshProducts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RefreshProducts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() refreshProducts,
    required TResult Function() getNextProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(ProductsFilter filter) changeFilter,
    required TResult Function(Product? product) changeProduct,
  }) {
    return refreshProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? refreshProducts,
    TResult? Function()? getNextProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(ProductsFilter filter)? changeFilter,
    TResult? Function(Product? product)? changeProduct,
  }) {
    return refreshProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? refreshProducts,
    TResult Function()? getNextProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(ProductsFilter filter)? changeFilter,
    TResult Function(Product? product)? changeProduct,
    required TResult orElse(),
  }) {
    if (refreshProducts != null) {
      return refreshProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_RefreshProducts value) refreshProducts,
    required TResult Function(_GetNextProducts value) getNextProducts,
    required TResult Function(_SearchProducts value) searchProducts,
    required TResult Function(_ChangeFilter value) changeFilter,
    required TResult Function(_ChangeProduct value) changeProduct,
  }) {
    return refreshProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_RefreshProducts value)? refreshProducts,
    TResult? Function(_GetNextProducts value)? getNextProducts,
    TResult? Function(_SearchProducts value)? searchProducts,
    TResult? Function(_ChangeFilter value)? changeFilter,
    TResult? Function(_ChangeProduct value)? changeProduct,
  }) {
    return refreshProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_RefreshProducts value)? refreshProducts,
    TResult Function(_GetNextProducts value)? getNextProducts,
    TResult Function(_SearchProducts value)? searchProducts,
    TResult Function(_ChangeFilter value)? changeFilter,
    TResult Function(_ChangeProduct value)? changeProduct,
    required TResult orElse(),
  }) {
    if (refreshProducts != null) {
      return refreshProducts(this);
    }
    return orElse();
  }
}

abstract class _RefreshProducts implements ProductsEvent {
  const factory _RefreshProducts() = _$_RefreshProducts;
}

/// @nodoc
abstract class _$$_GetNextProductsCopyWith<$Res> {
  factory _$$_GetNextProductsCopyWith(
          _$_GetNextProducts value, $Res Function(_$_GetNextProducts) then) =
      __$$_GetNextProductsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetNextProductsCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$_GetNextProducts>
    implements _$$_GetNextProductsCopyWith<$Res> {
  __$$_GetNextProductsCopyWithImpl(
      _$_GetNextProducts _value, $Res Function(_$_GetNextProducts) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetNextProducts implements _GetNextProducts {
  const _$_GetNextProducts();

  @override
  String toString() {
    return 'ProductsEvent.getNextProducts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetNextProducts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() refreshProducts,
    required TResult Function() getNextProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(ProductsFilter filter) changeFilter,
    required TResult Function(Product? product) changeProduct,
  }) {
    return getNextProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? refreshProducts,
    TResult? Function()? getNextProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(ProductsFilter filter)? changeFilter,
    TResult? Function(Product? product)? changeProduct,
  }) {
    return getNextProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? refreshProducts,
    TResult Function()? getNextProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(ProductsFilter filter)? changeFilter,
    TResult Function(Product? product)? changeProduct,
    required TResult orElse(),
  }) {
    if (getNextProducts != null) {
      return getNextProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_RefreshProducts value) refreshProducts,
    required TResult Function(_GetNextProducts value) getNextProducts,
    required TResult Function(_SearchProducts value) searchProducts,
    required TResult Function(_ChangeFilter value) changeFilter,
    required TResult Function(_ChangeProduct value) changeProduct,
  }) {
    return getNextProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_RefreshProducts value)? refreshProducts,
    TResult? Function(_GetNextProducts value)? getNextProducts,
    TResult? Function(_SearchProducts value)? searchProducts,
    TResult? Function(_ChangeFilter value)? changeFilter,
    TResult? Function(_ChangeProduct value)? changeProduct,
  }) {
    return getNextProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_RefreshProducts value)? refreshProducts,
    TResult Function(_GetNextProducts value)? getNextProducts,
    TResult Function(_SearchProducts value)? searchProducts,
    TResult Function(_ChangeFilter value)? changeFilter,
    TResult Function(_ChangeProduct value)? changeProduct,
    required TResult orElse(),
  }) {
    if (getNextProducts != null) {
      return getNextProducts(this);
    }
    return orElse();
  }
}

abstract class _GetNextProducts implements ProductsEvent {
  const factory _GetNextProducts() = _$_GetNextProducts;
}

/// @nodoc
abstract class _$$_SearchProductsCopyWith<$Res> {
  factory _$$_SearchProductsCopyWith(
          _$_SearchProducts value, $Res Function(_$_SearchProducts) then) =
      __$$_SearchProductsCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$_SearchProductsCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$_SearchProducts>
    implements _$$_SearchProductsCopyWith<$Res> {
  __$$_SearchProductsCopyWithImpl(
      _$_SearchProducts _value, $Res Function(_$_SearchProducts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$_SearchProducts(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchProducts implements _SearchProducts {
  const _$_SearchProducts(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'ProductsEvent.searchProducts(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchProducts &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchProductsCopyWith<_$_SearchProducts> get copyWith =>
      __$$_SearchProductsCopyWithImpl<_$_SearchProducts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() refreshProducts,
    required TResult Function() getNextProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(ProductsFilter filter) changeFilter,
    required TResult Function(Product? product) changeProduct,
  }) {
    return searchProducts(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? refreshProducts,
    TResult? Function()? getNextProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(ProductsFilter filter)? changeFilter,
    TResult? Function(Product? product)? changeProduct,
  }) {
    return searchProducts?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? refreshProducts,
    TResult Function()? getNextProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(ProductsFilter filter)? changeFilter,
    TResult Function(Product? product)? changeProduct,
    required TResult orElse(),
  }) {
    if (searchProducts != null) {
      return searchProducts(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_RefreshProducts value) refreshProducts,
    required TResult Function(_GetNextProducts value) getNextProducts,
    required TResult Function(_SearchProducts value) searchProducts,
    required TResult Function(_ChangeFilter value) changeFilter,
    required TResult Function(_ChangeProduct value) changeProduct,
  }) {
    return searchProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_RefreshProducts value)? refreshProducts,
    TResult? Function(_GetNextProducts value)? getNextProducts,
    TResult? Function(_SearchProducts value)? searchProducts,
    TResult? Function(_ChangeFilter value)? changeFilter,
    TResult? Function(_ChangeProduct value)? changeProduct,
  }) {
    return searchProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_RefreshProducts value)? refreshProducts,
    TResult Function(_GetNextProducts value)? getNextProducts,
    TResult Function(_SearchProducts value)? searchProducts,
    TResult Function(_ChangeFilter value)? changeFilter,
    TResult Function(_ChangeProduct value)? changeProduct,
    required TResult orElse(),
  }) {
    if (searchProducts != null) {
      return searchProducts(this);
    }
    return orElse();
  }
}

abstract class _SearchProducts implements ProductsEvent {
  const factory _SearchProducts(final String query) = _$_SearchProducts;

  String get query;
  @JsonKey(ignore: true)
  _$$_SearchProductsCopyWith<_$_SearchProducts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeFilterCopyWith<$Res> {
  factory _$$_ChangeFilterCopyWith(
          _$_ChangeFilter value, $Res Function(_$_ChangeFilter) then) =
      __$$_ChangeFilterCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductsFilter filter});
}

/// @nodoc
class __$$_ChangeFilterCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$_ChangeFilter>
    implements _$$_ChangeFilterCopyWith<$Res> {
  __$$_ChangeFilterCopyWithImpl(
      _$_ChangeFilter _value, $Res Function(_$_ChangeFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$_ChangeFilter(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ProductsFilter,
    ));
  }
}

/// @nodoc

class _$_ChangeFilter implements _ChangeFilter {
  const _$_ChangeFilter(this.filter);

  @override
  final ProductsFilter filter;

  @override
  String toString() {
    return 'ProductsEvent.changeFilter(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeFilter &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeFilterCopyWith<_$_ChangeFilter> get copyWith =>
      __$$_ChangeFilterCopyWithImpl<_$_ChangeFilter>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() refreshProducts,
    required TResult Function() getNextProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(ProductsFilter filter) changeFilter,
    required TResult Function(Product? product) changeProduct,
  }) {
    return changeFilter(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? refreshProducts,
    TResult? Function()? getNextProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(ProductsFilter filter)? changeFilter,
    TResult? Function(Product? product)? changeProduct,
  }) {
    return changeFilter?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? refreshProducts,
    TResult Function()? getNextProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(ProductsFilter filter)? changeFilter,
    TResult Function(Product? product)? changeProduct,
    required TResult orElse(),
  }) {
    if (changeFilter != null) {
      return changeFilter(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_RefreshProducts value) refreshProducts,
    required TResult Function(_GetNextProducts value) getNextProducts,
    required TResult Function(_SearchProducts value) searchProducts,
    required TResult Function(_ChangeFilter value) changeFilter,
    required TResult Function(_ChangeProduct value) changeProduct,
  }) {
    return changeFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_RefreshProducts value)? refreshProducts,
    TResult? Function(_GetNextProducts value)? getNextProducts,
    TResult? Function(_SearchProducts value)? searchProducts,
    TResult? Function(_ChangeFilter value)? changeFilter,
    TResult? Function(_ChangeProduct value)? changeProduct,
  }) {
    return changeFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_RefreshProducts value)? refreshProducts,
    TResult Function(_GetNextProducts value)? getNextProducts,
    TResult Function(_SearchProducts value)? searchProducts,
    TResult Function(_ChangeFilter value)? changeFilter,
    TResult Function(_ChangeProduct value)? changeProduct,
    required TResult orElse(),
  }) {
    if (changeFilter != null) {
      return changeFilter(this);
    }
    return orElse();
  }
}

abstract class _ChangeFilter implements ProductsEvent {
  const factory _ChangeFilter(final ProductsFilter filter) = _$_ChangeFilter;

  ProductsFilter get filter;
  @JsonKey(ignore: true)
  _$$_ChangeFilterCopyWith<_$_ChangeFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeProductCopyWith<$Res> {
  factory _$$_ChangeProductCopyWith(
          _$_ChangeProduct value, $Res Function(_$_ChangeProduct) then) =
      __$$_ChangeProductCopyWithImpl<$Res>;
  @useResult
  $Res call({Product? product});
}

/// @nodoc
class __$$_ChangeProductCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$_ChangeProduct>
    implements _$$_ChangeProductCopyWith<$Res> {
  __$$_ChangeProductCopyWithImpl(
      _$_ChangeProduct _value, $Res Function(_$_ChangeProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(_$_ChangeProduct(
      freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc

class _$_ChangeProduct implements _ChangeProduct {
  const _$_ChangeProduct(this.product);

  @override
  final Product? product;

  @override
  String toString() {
    return 'ProductsEvent.changeProduct(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeProduct &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeProductCopyWith<_$_ChangeProduct> get copyWith =>
      __$$_ChangeProductCopyWithImpl<_$_ChangeProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function() refreshProducts,
    required TResult Function() getNextProducts,
    required TResult Function(String query) searchProducts,
    required TResult Function(ProductsFilter filter) changeFilter,
    required TResult Function(Product? product) changeProduct,
  }) {
    return changeProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function()? refreshProducts,
    TResult? Function()? getNextProducts,
    TResult? Function(String query)? searchProducts,
    TResult? Function(ProductsFilter filter)? changeFilter,
    TResult? Function(Product? product)? changeProduct,
  }) {
    return changeProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function()? refreshProducts,
    TResult Function()? getNextProducts,
    TResult Function(String query)? searchProducts,
    TResult Function(ProductsFilter filter)? changeFilter,
    TResult Function(Product? product)? changeProduct,
    required TResult orElse(),
  }) {
    if (changeProduct != null) {
      return changeProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_RefreshProducts value) refreshProducts,
    required TResult Function(_GetNextProducts value) getNextProducts,
    required TResult Function(_SearchProducts value) searchProducts,
    required TResult Function(_ChangeFilter value) changeFilter,
    required TResult Function(_ChangeProduct value) changeProduct,
  }) {
    return changeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_RefreshProducts value)? refreshProducts,
    TResult? Function(_GetNextProducts value)? getNextProducts,
    TResult? Function(_SearchProducts value)? searchProducts,
    TResult? Function(_ChangeFilter value)? changeFilter,
    TResult? Function(_ChangeProduct value)? changeProduct,
  }) {
    return changeProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_RefreshProducts value)? refreshProducts,
    TResult Function(_GetNextProducts value)? getNextProducts,
    TResult Function(_SearchProducts value)? searchProducts,
    TResult Function(_ChangeFilter value)? changeFilter,
    TResult Function(_ChangeProduct value)? changeProduct,
    required TResult orElse(),
  }) {
    if (changeProduct != null) {
      return changeProduct(this);
    }
    return orElse();
  }
}

abstract class _ChangeProduct implements ProductsEvent {
  const factory _ChangeProduct(final Product? product) = _$_ChangeProduct;

  Product? get product;
  @JsonKey(ignore: true)
  _$$_ChangeProductCopyWith<_$_ChangeProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductsState {
  Info get info => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;
  ProductsFilter get filter => throw _privateConstructorUsedError;
  ProductsStatus get status => throw _privateConstructorUsedError;
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
      {Info info,
      List<Product> products,
      ProductsFilter filter,
      ProductsStatus status,
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
    Object? info = null,
    Object? products = null,
    Object? filter = null,
    Object? status = null,
    Object? failure = null,
    Object? selectedProduct = freezed,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ProductsFilter,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductsStatus,
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
      {Info info,
      List<Product> products,
      ProductsFilter filter,
      ProductsStatus status,
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
    Object? info = null,
    Object? products = null,
    Object? filter = null,
    Object? status = null,
    Object? failure = null,
    Object? selectedProduct = freezed,
  }) {
    return _then(_$_ProductsState(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ProductsFilter,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductsStatus,
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
      {this.info = const Info.initial(),
      final List<Product> products = const [],
      this.filter = const ProductsFilter(),
      this.status = ProductsStatus.loading,
      this.failure = const UnknownFailure(),
      this.selectedProduct})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final Info info;
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
  final ProductsFilter filter;
  @override
  @JsonKey()
  final ProductsStatus status;
  @override
  @JsonKey()
  final Failure failure;
  @override
  final Product? selectedProduct;

  @override
  String toString() {
    return 'ProductsState(info: $info, products: $products, filter: $filter, status: $status, failure: $failure, selectedProduct: $selectedProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsState &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.selectedProduct, selectedProduct) ||
                other.selectedProduct == selectedProduct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      info,
      const DeepCollectionEquality().hash(_products),
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
      {final Info info,
      final List<Product> products,
      final ProductsFilter filter,
      final ProductsStatus status,
      final Failure failure,
      final Product? selectedProduct}) = _$_ProductsState;
  const _ProductsState._() : super._();

  @override
  Info get info;
  @override
  List<Product> get products;
  @override
  ProductsFilter get filter;
  @override
  ProductsStatus get status;
  @override
  Failure get failure;
  @override
  Product? get selectedProduct;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsStateCopyWith<_$_ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
