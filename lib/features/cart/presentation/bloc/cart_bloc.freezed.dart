// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(Product product) toggleCart,
    required TResult Function(List<Product> cart) changeCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(Product product)? toggleCart,
    TResult? Function(List<Product> cart)? changeCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(Product product)? toggleCart,
    TResult Function(List<Product> cart)? changeCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_ToggleCart value) toggleCart,
    required TResult Function(_ChangeCart value) changeCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_ToggleCart value)? toggleCart,
    TResult? Function(_ChangeCart value)? changeCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_ToggleCart value)? toggleCart,
    TResult Function(_ChangeCart value)? changeCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetCartCopyWith<$Res> {
  factory _$$_GetCartCopyWith(
          _$_GetCart value, $Res Function(_$_GetCart) then) =
      __$$_GetCartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_GetCart>
    implements _$$_GetCartCopyWith<$Res> {
  __$$_GetCartCopyWithImpl(_$_GetCart _value, $Res Function(_$_GetCart) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetCart implements _GetCart {
  const _$_GetCart();

  @override
  String toString() {
    return 'CartEvent.getCart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetCart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(Product product) toggleCart,
    required TResult Function(List<Product> cart) changeCart,
  }) {
    return getCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(Product product)? toggleCart,
    TResult? Function(List<Product> cart)? changeCart,
  }) {
    return getCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(Product product)? toggleCart,
    TResult Function(List<Product> cart)? changeCart,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_ToggleCart value) toggleCart,
    required TResult Function(_ChangeCart value) changeCart,
  }) {
    return getCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_ToggleCart value)? toggleCart,
    TResult? Function(_ChangeCart value)? changeCart,
  }) {
    return getCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_ToggleCart value)? toggleCart,
    TResult Function(_ChangeCart value)? changeCart,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart(this);
    }
    return orElse();
  }
}

abstract class _GetCart implements CartEvent {
  const factory _GetCart() = _$_GetCart;
}

/// @nodoc
abstract class _$$_RefreshCartCopyWith<$Res> {
  factory _$$_RefreshCartCopyWith(
          _$_RefreshCart value, $Res Function(_$_RefreshCart) then) =
      __$$_RefreshCartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_RefreshCart>
    implements _$$_RefreshCartCopyWith<$Res> {
  __$$_RefreshCartCopyWithImpl(
      _$_RefreshCart _value, $Res Function(_$_RefreshCart) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RefreshCart implements _RefreshCart {
  const _$_RefreshCart();

  @override
  String toString() {
    return 'CartEvent.refreshCart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RefreshCart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(Product product) toggleCart,
    required TResult Function(List<Product> cart) changeCart,
  }) {
    return refreshCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(Product product)? toggleCart,
    TResult? Function(List<Product> cart)? changeCart,
  }) {
    return refreshCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(Product product)? toggleCart,
    TResult Function(List<Product> cart)? changeCart,
    required TResult orElse(),
  }) {
    if (refreshCart != null) {
      return refreshCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_ToggleCart value) toggleCart,
    required TResult Function(_ChangeCart value) changeCart,
  }) {
    return refreshCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_ToggleCart value)? toggleCart,
    TResult? Function(_ChangeCart value)? changeCart,
  }) {
    return refreshCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_ToggleCart value)? toggleCart,
    TResult Function(_ChangeCart value)? changeCart,
    required TResult orElse(),
  }) {
    if (refreshCart != null) {
      return refreshCart(this);
    }
    return orElse();
  }
}

abstract class _RefreshCart implements CartEvent {
  const factory _RefreshCart() = _$_RefreshCart;
}

/// @nodoc
abstract class _$$_ToggleCartCopyWith<$Res> {
  factory _$$_ToggleCartCopyWith(
          _$_ToggleCart value, $Res Function(_$_ToggleCart) then) =
      __$$_ToggleCartCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$_ToggleCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_ToggleCart>
    implements _$$_ToggleCartCopyWith<$Res> {
  __$$_ToggleCartCopyWithImpl(
      _$_ToggleCart _value, $Res Function(_$_ToggleCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$_ToggleCart(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$_ToggleCart implements _ToggleCart {
  const _$_ToggleCart(this.product);

  @override
  final Product product;

  @override
  String toString() {
    return 'CartEvent.toggleCart(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleCart &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleCartCopyWith<_$_ToggleCart> get copyWith =>
      __$$_ToggleCartCopyWithImpl<_$_ToggleCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(Product product) toggleCart,
    required TResult Function(List<Product> cart) changeCart,
  }) {
    return toggleCart(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(Product product)? toggleCart,
    TResult? Function(List<Product> cart)? changeCart,
  }) {
    return toggleCart?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(Product product)? toggleCart,
    TResult Function(List<Product> cart)? changeCart,
    required TResult orElse(),
  }) {
    if (toggleCart != null) {
      return toggleCart(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_ToggleCart value) toggleCart,
    required TResult Function(_ChangeCart value) changeCart,
  }) {
    return toggleCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_ToggleCart value)? toggleCart,
    TResult? Function(_ChangeCart value)? changeCart,
  }) {
    return toggleCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_ToggleCart value)? toggleCart,
    TResult Function(_ChangeCart value)? changeCart,
    required TResult orElse(),
  }) {
    if (toggleCart != null) {
      return toggleCart(this);
    }
    return orElse();
  }
}

abstract class _ToggleCart implements CartEvent {
  const factory _ToggleCart(final Product product) = _$_ToggleCart;

  Product get product;
  @JsonKey(ignore: true)
  _$$_ToggleCartCopyWith<_$_ToggleCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeCartCopyWith<$Res> {
  factory _$$_ChangeCartCopyWith(
          _$_ChangeCart value, $Res Function(_$_ChangeCart) then) =
      __$$_ChangeCartCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Product> cart});
}

/// @nodoc
class __$$_ChangeCartCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$_ChangeCart>
    implements _$$_ChangeCartCopyWith<$Res> {
  __$$_ChangeCartCopyWithImpl(
      _$_ChangeCart _value, $Res Function(_$_ChangeCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cart = null,
  }) {
    return _then(_$_ChangeCart(
      null == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$_ChangeCart implements _ChangeCart {
  const _$_ChangeCart(final List<Product> cart) : _cart = cart;

  final List<Product> _cart;
  @override
  List<Product> get cart {
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cart);
  }

  @override
  String toString() {
    return 'CartEvent.changeCart(cart: $cart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeCart &&
            const DeepCollectionEquality().equals(other._cart, _cart));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cart));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeCartCopyWith<_$_ChangeCart> get copyWith =>
      __$$_ChangeCartCopyWithImpl<_$_ChangeCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
    required TResult Function() refreshCart,
    required TResult Function(Product product) toggleCart,
    required TResult Function(List<Product> cart) changeCart,
  }) {
    return changeCart(cart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCart,
    TResult? Function()? refreshCart,
    TResult? Function(Product product)? toggleCart,
    TResult? Function(List<Product> cart)? changeCart,
  }) {
    return changeCart?.call(cart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    TResult Function()? refreshCart,
    TResult Function(Product product)? toggleCart,
    TResult Function(List<Product> cart)? changeCart,
    required TResult orElse(),
  }) {
    if (changeCart != null) {
      return changeCart(cart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_RefreshCart value) refreshCart,
    required TResult Function(_ToggleCart value) toggleCart,
    required TResult Function(_ChangeCart value) changeCart,
  }) {
    return changeCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_RefreshCart value)? refreshCart,
    TResult? Function(_ToggleCart value)? toggleCart,
    TResult? Function(_ChangeCart value)? changeCart,
  }) {
    return changeCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCart value)? getCart,
    TResult Function(_RefreshCart value)? refreshCart,
    TResult Function(_ToggleCart value)? toggleCart,
    TResult Function(_ChangeCart value)? changeCart,
    required TResult orElse(),
  }) {
    if (changeCart != null) {
      return changeCart(this);
    }
    return orElse();
  }
}

abstract class _ChangeCart implements CartEvent {
  const factory _ChangeCart(final List<Product> cart) = _$_ChangeCart;

  List<Product> get cart;
  @JsonKey(ignore: true)
  _$$_ChangeCartCopyWith<_$_ChangeCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  Info get info => throw _privateConstructorUsedError;
  List<Product> get cart => throw _privateConstructorUsedError;
  ProductsFilter get filter => throw _privateConstructorUsedError;
  CartStatus get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {Info info,
      List<Product> cart,
      ProductsFilter filter,
      CartStatus status,
      Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? cart = null,
    Object? filter = null,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      cart: null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ProductsFilter,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CartStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
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
abstract class _$$_CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_CartStateCopyWith(
          _$_CartState value, $Res Function(_$_CartState) then) =
      __$$_CartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Info info,
      List<Product> cart,
      ProductsFilter filter,
      CartStatus status,
      Failure failure});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_CartStateCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$_CartState>
    implements _$$_CartStateCopyWith<$Res> {
  __$$_CartStateCopyWithImpl(
      _$_CartState _value, $Res Function(_$_CartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? cart = null,
    Object? filter = null,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_$_CartState(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      cart: null == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ProductsFilter,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CartStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_CartState extends _CartState {
  const _$_CartState(
      {this.info = const Info.initial(),
      final List<Product> cart = const [],
      this.filter = const ProductsFilter(),
      this.status = CartStatus.initial,
      this.failure = const CasualFailure()})
      : _cart = cart,
        super._();

  @override
  @JsonKey()
  final Info info;
  final List<Product> _cart;
  @override
  @JsonKey()
  List<Product> get cart {
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cart);
  }

  @override
  @JsonKey()
  final ProductsFilter filter;
  @override
  @JsonKey()
  final CartStatus status;
  @override
  @JsonKey()
  final Failure failure;

  @override
  String toString() {
    return 'CartState(info: $info, cart: $cart, filter: $filter, status: $status, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartState &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._cart, _cart) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info,
      const DeepCollectionEquality().hash(_cart), filter, status, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      __$$_CartStateCopyWithImpl<_$_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
      {final Info info,
      final List<Product> cart,
      final ProductsFilter filter,
      final CartStatus status,
      final Failure failure}) = _$_CartState;
  const _CartState._() : super._();

  @override
  Info get info;
  @override
  List<Product> get cart;
  @override
  ProductsFilter get filter;
  @override
  CartStatus get status;
  @override
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_CartStateCopyWith<_$_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
