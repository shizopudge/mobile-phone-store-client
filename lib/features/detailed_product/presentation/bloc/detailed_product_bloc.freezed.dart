// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailed_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailedProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool isInitial) getOneProduct,
    required TResult Function(Product product) changeProduct,
    required TResult Function(String? newColorCode) changeColor,
    required TResult Function(int? newStorage) changeStorage,
    required TResult Function() createPurchase,
    required TResult Function() openUrl,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool isInitial)? getOneProduct,
    TResult? Function(Product product)? changeProduct,
    TResult? Function(String? newColorCode)? changeColor,
    TResult? Function(int? newStorage)? changeStorage,
    TResult? Function()? createPurchase,
    TResult? Function()? openUrl,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool isInitial)? getOneProduct,
    TResult Function(Product product)? changeProduct,
    TResult Function(String? newColorCode)? changeColor,
    TResult Function(int? newStorage)? changeStorage,
    TResult Function()? createPurchase,
    TResult Function()? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOneProduct value) getOneProduct,
    required TResult Function(_ChangeProduct value) changeProduct,
    required TResult Function(_ChangeColor value) changeColor,
    required TResult Function(_ChangeStorage value) changeStorage,
    required TResult Function(_CreatePurchase value) createPurchase,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOneProduct value)? getOneProduct,
    TResult? Function(_ChangeProduct value)? changeProduct,
    TResult? Function(_ChangeColor value)? changeColor,
    TResult? Function(_ChangeStorage value)? changeStorage,
    TResult? Function(_CreatePurchase value)? createPurchase,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOneProduct value)? getOneProduct,
    TResult Function(_ChangeProduct value)? changeProduct,
    TResult Function(_ChangeColor value)? changeColor,
    TResult Function(_ChangeStorage value)? changeStorage,
    TResult Function(_CreatePurchase value)? createPurchase,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedProductEventCopyWith<$Res> {
  factory $DetailedProductEventCopyWith(DetailedProductEvent value,
          $Res Function(DetailedProductEvent) then) =
      _$DetailedProductEventCopyWithImpl<$Res, DetailedProductEvent>;
}

/// @nodoc
class _$DetailedProductEventCopyWithImpl<$Res,
        $Val extends DetailedProductEvent>
    implements $DetailedProductEventCopyWith<$Res> {
  _$DetailedProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetOneProductCopyWith<$Res> {
  factory _$$_GetOneProductCopyWith(
          _$_GetOneProduct value, $Res Function(_$_GetOneProduct) then) =
      __$$_GetOneProductCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, bool isInitial});
}

/// @nodoc
class __$$_GetOneProductCopyWithImpl<$Res>
    extends _$DetailedProductEventCopyWithImpl<$Res, _$_GetOneProduct>
    implements _$$_GetOneProductCopyWith<$Res> {
  __$$_GetOneProductCopyWithImpl(
      _$_GetOneProduct _value, $Res Function(_$_GetOneProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isInitial = null,
  }) {
    return _then(_$_GetOneProduct(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GetOneProduct with DiagnosticableTreeMixin implements _GetOneProduct {
  const _$_GetOneProduct({required this.id, this.isInitial = false});

  @override
  final String id;
  @override
  @JsonKey()
  final bool isInitial;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedProductEvent.getOneProduct(id: $id, isInitial: $isInitial)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailedProductEvent.getOneProduct'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isInitial', isInitial));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetOneProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isInitial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetOneProductCopyWith<_$_GetOneProduct> get copyWith =>
      __$$_GetOneProductCopyWithImpl<_$_GetOneProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool isInitial) getOneProduct,
    required TResult Function(Product product) changeProduct,
    required TResult Function(String? newColorCode) changeColor,
    required TResult Function(int? newStorage) changeStorage,
    required TResult Function() createPurchase,
    required TResult Function() openUrl,
    required TResult Function() reset,
  }) {
    return getOneProduct(id, isInitial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool isInitial)? getOneProduct,
    TResult? Function(Product product)? changeProduct,
    TResult? Function(String? newColorCode)? changeColor,
    TResult? Function(int? newStorage)? changeStorage,
    TResult? Function()? createPurchase,
    TResult? Function()? openUrl,
    TResult? Function()? reset,
  }) {
    return getOneProduct?.call(id, isInitial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool isInitial)? getOneProduct,
    TResult Function(Product product)? changeProduct,
    TResult Function(String? newColorCode)? changeColor,
    TResult Function(int? newStorage)? changeStorage,
    TResult Function()? createPurchase,
    TResult Function()? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (getOneProduct != null) {
      return getOneProduct(id, isInitial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOneProduct value) getOneProduct,
    required TResult Function(_ChangeProduct value) changeProduct,
    required TResult Function(_ChangeColor value) changeColor,
    required TResult Function(_ChangeStorage value) changeStorage,
    required TResult Function(_CreatePurchase value) createPurchase,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return getOneProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOneProduct value)? getOneProduct,
    TResult? Function(_ChangeProduct value)? changeProduct,
    TResult? Function(_ChangeColor value)? changeColor,
    TResult? Function(_ChangeStorage value)? changeStorage,
    TResult? Function(_CreatePurchase value)? createPurchase,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return getOneProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOneProduct value)? getOneProduct,
    TResult Function(_ChangeProduct value)? changeProduct,
    TResult Function(_ChangeColor value)? changeColor,
    TResult Function(_ChangeStorage value)? changeStorage,
    TResult Function(_CreatePurchase value)? createPurchase,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (getOneProduct != null) {
      return getOneProduct(this);
    }
    return orElse();
  }
}

abstract class _GetOneProduct implements DetailedProductEvent {
  const factory _GetOneProduct(
      {required final String id, final bool isInitial}) = _$_GetOneProduct;

  String get id;
  bool get isInitial;
  @JsonKey(ignore: true)
  _$$_GetOneProductCopyWith<_$_GetOneProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeProductCopyWith<$Res> {
  factory _$$_ChangeProductCopyWith(
          _$_ChangeProduct value, $Res Function(_$_ChangeProduct) then) =
      __$$_ChangeProductCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$$_ChangeProductCopyWithImpl<$Res>
    extends _$DetailedProductEventCopyWithImpl<$Res, _$_ChangeProduct>
    implements _$$_ChangeProductCopyWith<$Res> {
  __$$_ChangeProductCopyWithImpl(
      _$_ChangeProduct _value, $Res Function(_$_ChangeProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$_ChangeProduct(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$_ChangeProduct with DiagnosticableTreeMixin implements _ChangeProduct {
  const _$_ChangeProduct(this.product);

  @override
  final Product product;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedProductEvent.changeProduct(product: $product)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailedProductEvent.changeProduct'))
      ..add(DiagnosticsProperty('product', product));
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
    required TResult Function(String id, bool isInitial) getOneProduct,
    required TResult Function(Product product) changeProduct,
    required TResult Function(String? newColorCode) changeColor,
    required TResult Function(int? newStorage) changeStorage,
    required TResult Function() createPurchase,
    required TResult Function() openUrl,
    required TResult Function() reset,
  }) {
    return changeProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool isInitial)? getOneProduct,
    TResult? Function(Product product)? changeProduct,
    TResult? Function(String? newColorCode)? changeColor,
    TResult? Function(int? newStorage)? changeStorage,
    TResult? Function()? createPurchase,
    TResult? Function()? openUrl,
    TResult? Function()? reset,
  }) {
    return changeProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool isInitial)? getOneProduct,
    TResult Function(Product product)? changeProduct,
    TResult Function(String? newColorCode)? changeColor,
    TResult Function(int? newStorage)? changeStorage,
    TResult Function()? createPurchase,
    TResult Function()? openUrl,
    TResult Function()? reset,
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
    required TResult Function(_GetOneProduct value) getOneProduct,
    required TResult Function(_ChangeProduct value) changeProduct,
    required TResult Function(_ChangeColor value) changeColor,
    required TResult Function(_ChangeStorage value) changeStorage,
    required TResult Function(_CreatePurchase value) createPurchase,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return changeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOneProduct value)? getOneProduct,
    TResult? Function(_ChangeProduct value)? changeProduct,
    TResult? Function(_ChangeColor value)? changeColor,
    TResult? Function(_ChangeStorage value)? changeStorage,
    TResult? Function(_CreatePurchase value)? createPurchase,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return changeProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOneProduct value)? getOneProduct,
    TResult Function(_ChangeProduct value)? changeProduct,
    TResult Function(_ChangeColor value)? changeColor,
    TResult Function(_ChangeStorage value)? changeStorage,
    TResult Function(_CreatePurchase value)? createPurchase,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (changeProduct != null) {
      return changeProduct(this);
    }
    return orElse();
  }
}

abstract class _ChangeProduct implements DetailedProductEvent {
  const factory _ChangeProduct(final Product product) = _$_ChangeProduct;

  Product get product;
  @JsonKey(ignore: true)
  _$$_ChangeProductCopyWith<_$_ChangeProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeColorCopyWith<$Res> {
  factory _$$_ChangeColorCopyWith(
          _$_ChangeColor value, $Res Function(_$_ChangeColor) then) =
      __$$_ChangeColorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? newColorCode});
}

/// @nodoc
class __$$_ChangeColorCopyWithImpl<$Res>
    extends _$DetailedProductEventCopyWithImpl<$Res, _$_ChangeColor>
    implements _$$_ChangeColorCopyWith<$Res> {
  __$$_ChangeColorCopyWithImpl(
      _$_ChangeColor _value, $Res Function(_$_ChangeColor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newColorCode = freezed,
  }) {
    return _then(_$_ChangeColor(
      freezed == newColorCode
          ? _value.newColorCode
          : newColorCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ChangeColor with DiagnosticableTreeMixin implements _ChangeColor {
  const _$_ChangeColor(this.newColorCode);

  @override
  final String? newColorCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedProductEvent.changeColor(newColorCode: $newColorCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailedProductEvent.changeColor'))
      ..add(DiagnosticsProperty('newColorCode', newColorCode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeColor &&
            (identical(other.newColorCode, newColorCode) ||
                other.newColorCode == newColorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newColorCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeColorCopyWith<_$_ChangeColor> get copyWith =>
      __$$_ChangeColorCopyWithImpl<_$_ChangeColor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool isInitial) getOneProduct,
    required TResult Function(Product product) changeProduct,
    required TResult Function(String? newColorCode) changeColor,
    required TResult Function(int? newStorage) changeStorage,
    required TResult Function() createPurchase,
    required TResult Function() openUrl,
    required TResult Function() reset,
  }) {
    return changeColor(newColorCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool isInitial)? getOneProduct,
    TResult? Function(Product product)? changeProduct,
    TResult? Function(String? newColorCode)? changeColor,
    TResult? Function(int? newStorage)? changeStorage,
    TResult? Function()? createPurchase,
    TResult? Function()? openUrl,
    TResult? Function()? reset,
  }) {
    return changeColor?.call(newColorCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool isInitial)? getOneProduct,
    TResult Function(Product product)? changeProduct,
    TResult Function(String? newColorCode)? changeColor,
    TResult Function(int? newStorage)? changeStorage,
    TResult Function()? createPurchase,
    TResult Function()? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (changeColor != null) {
      return changeColor(newColorCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOneProduct value) getOneProduct,
    required TResult Function(_ChangeProduct value) changeProduct,
    required TResult Function(_ChangeColor value) changeColor,
    required TResult Function(_ChangeStorage value) changeStorage,
    required TResult Function(_CreatePurchase value) createPurchase,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return changeColor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOneProduct value)? getOneProduct,
    TResult? Function(_ChangeProduct value)? changeProduct,
    TResult? Function(_ChangeColor value)? changeColor,
    TResult? Function(_ChangeStorage value)? changeStorage,
    TResult? Function(_CreatePurchase value)? createPurchase,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return changeColor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOneProduct value)? getOneProduct,
    TResult Function(_ChangeProduct value)? changeProduct,
    TResult Function(_ChangeColor value)? changeColor,
    TResult Function(_ChangeStorage value)? changeStorage,
    TResult Function(_CreatePurchase value)? createPurchase,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (changeColor != null) {
      return changeColor(this);
    }
    return orElse();
  }
}

abstract class _ChangeColor implements DetailedProductEvent {
  const factory _ChangeColor(final String? newColorCode) = _$_ChangeColor;

  String? get newColorCode;
  @JsonKey(ignore: true)
  _$$_ChangeColorCopyWith<_$_ChangeColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeStorageCopyWith<$Res> {
  factory _$$_ChangeStorageCopyWith(
          _$_ChangeStorage value, $Res Function(_$_ChangeStorage) then) =
      __$$_ChangeStorageCopyWithImpl<$Res>;
  @useResult
  $Res call({int? newStorage});
}

/// @nodoc
class __$$_ChangeStorageCopyWithImpl<$Res>
    extends _$DetailedProductEventCopyWithImpl<$Res, _$_ChangeStorage>
    implements _$$_ChangeStorageCopyWith<$Res> {
  __$$_ChangeStorageCopyWithImpl(
      _$_ChangeStorage _value, $Res Function(_$_ChangeStorage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newStorage = freezed,
  }) {
    return _then(_$_ChangeStorage(
      freezed == newStorage
          ? _value.newStorage
          : newStorage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ChangeStorage with DiagnosticableTreeMixin implements _ChangeStorage {
  const _$_ChangeStorage(this.newStorage);

  @override
  final int? newStorage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedProductEvent.changeStorage(newStorage: $newStorage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailedProductEvent.changeStorage'))
      ..add(DiagnosticsProperty('newStorage', newStorage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeStorage &&
            (identical(other.newStorage, newStorage) ||
                other.newStorage == newStorage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newStorage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeStorageCopyWith<_$_ChangeStorage> get copyWith =>
      __$$_ChangeStorageCopyWithImpl<_$_ChangeStorage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool isInitial) getOneProduct,
    required TResult Function(Product product) changeProduct,
    required TResult Function(String? newColorCode) changeColor,
    required TResult Function(int? newStorage) changeStorage,
    required TResult Function() createPurchase,
    required TResult Function() openUrl,
    required TResult Function() reset,
  }) {
    return changeStorage(newStorage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool isInitial)? getOneProduct,
    TResult? Function(Product product)? changeProduct,
    TResult? Function(String? newColorCode)? changeColor,
    TResult? Function(int? newStorage)? changeStorage,
    TResult? Function()? createPurchase,
    TResult? Function()? openUrl,
    TResult? Function()? reset,
  }) {
    return changeStorage?.call(newStorage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool isInitial)? getOneProduct,
    TResult Function(Product product)? changeProduct,
    TResult Function(String? newColorCode)? changeColor,
    TResult Function(int? newStorage)? changeStorage,
    TResult Function()? createPurchase,
    TResult Function()? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (changeStorage != null) {
      return changeStorage(newStorage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOneProduct value) getOneProduct,
    required TResult Function(_ChangeProduct value) changeProduct,
    required TResult Function(_ChangeColor value) changeColor,
    required TResult Function(_ChangeStorage value) changeStorage,
    required TResult Function(_CreatePurchase value) createPurchase,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return changeStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOneProduct value)? getOneProduct,
    TResult? Function(_ChangeProduct value)? changeProduct,
    TResult? Function(_ChangeColor value)? changeColor,
    TResult? Function(_ChangeStorage value)? changeStorage,
    TResult? Function(_CreatePurchase value)? createPurchase,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return changeStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOneProduct value)? getOneProduct,
    TResult Function(_ChangeProduct value)? changeProduct,
    TResult Function(_ChangeColor value)? changeColor,
    TResult Function(_ChangeStorage value)? changeStorage,
    TResult Function(_CreatePurchase value)? createPurchase,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (changeStorage != null) {
      return changeStorage(this);
    }
    return orElse();
  }
}

abstract class _ChangeStorage implements DetailedProductEvent {
  const factory _ChangeStorage(final int? newStorage) = _$_ChangeStorage;

  int? get newStorage;
  @JsonKey(ignore: true)
  _$$_ChangeStorageCopyWith<_$_ChangeStorage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreatePurchaseCopyWith<$Res> {
  factory _$$_CreatePurchaseCopyWith(
          _$_CreatePurchase value, $Res Function(_$_CreatePurchase) then) =
      __$$_CreatePurchaseCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreatePurchaseCopyWithImpl<$Res>
    extends _$DetailedProductEventCopyWithImpl<$Res, _$_CreatePurchase>
    implements _$$_CreatePurchaseCopyWith<$Res> {
  __$$_CreatePurchaseCopyWithImpl(
      _$_CreatePurchase _value, $Res Function(_$_CreatePurchase) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CreatePurchase
    with DiagnosticableTreeMixin
    implements _CreatePurchase {
  const _$_CreatePurchase();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedProductEvent.createPurchase()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'DetailedProductEvent.createPurchase'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CreatePurchase);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool isInitial) getOneProduct,
    required TResult Function(Product product) changeProduct,
    required TResult Function(String? newColorCode) changeColor,
    required TResult Function(int? newStorage) changeStorage,
    required TResult Function() createPurchase,
    required TResult Function() openUrl,
    required TResult Function() reset,
  }) {
    return createPurchase();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool isInitial)? getOneProduct,
    TResult? Function(Product product)? changeProduct,
    TResult? Function(String? newColorCode)? changeColor,
    TResult? Function(int? newStorage)? changeStorage,
    TResult? Function()? createPurchase,
    TResult? Function()? openUrl,
    TResult? Function()? reset,
  }) {
    return createPurchase?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool isInitial)? getOneProduct,
    TResult Function(Product product)? changeProduct,
    TResult Function(String? newColorCode)? changeColor,
    TResult Function(int? newStorage)? changeStorage,
    TResult Function()? createPurchase,
    TResult Function()? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (createPurchase != null) {
      return createPurchase();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOneProduct value) getOneProduct,
    required TResult Function(_ChangeProduct value) changeProduct,
    required TResult Function(_ChangeColor value) changeColor,
    required TResult Function(_ChangeStorage value) changeStorage,
    required TResult Function(_CreatePurchase value) createPurchase,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return createPurchase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOneProduct value)? getOneProduct,
    TResult? Function(_ChangeProduct value)? changeProduct,
    TResult? Function(_ChangeColor value)? changeColor,
    TResult? Function(_ChangeStorage value)? changeStorage,
    TResult? Function(_CreatePurchase value)? createPurchase,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return createPurchase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOneProduct value)? getOneProduct,
    TResult Function(_ChangeProduct value)? changeProduct,
    TResult Function(_ChangeColor value)? changeColor,
    TResult Function(_ChangeStorage value)? changeStorage,
    TResult Function(_CreatePurchase value)? createPurchase,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (createPurchase != null) {
      return createPurchase(this);
    }
    return orElse();
  }
}

abstract class _CreatePurchase implements DetailedProductEvent {
  const factory _CreatePurchase() = _$_CreatePurchase;
}

/// @nodoc
abstract class _$$_OpenUrlCopyWith<$Res> {
  factory _$$_OpenUrlCopyWith(
          _$_OpenUrl value, $Res Function(_$_OpenUrl) then) =
      __$$_OpenUrlCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OpenUrlCopyWithImpl<$Res>
    extends _$DetailedProductEventCopyWithImpl<$Res, _$_OpenUrl>
    implements _$$_OpenUrlCopyWith<$Res> {
  __$$_OpenUrlCopyWithImpl(_$_OpenUrl _value, $Res Function(_$_OpenUrl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OpenUrl with DiagnosticableTreeMixin implements _OpenUrl {
  const _$_OpenUrl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedProductEvent.openUrl()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DetailedProductEvent.openUrl'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OpenUrl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool isInitial) getOneProduct,
    required TResult Function(Product product) changeProduct,
    required TResult Function(String? newColorCode) changeColor,
    required TResult Function(int? newStorage) changeStorage,
    required TResult Function() createPurchase,
    required TResult Function() openUrl,
    required TResult Function() reset,
  }) {
    return openUrl();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool isInitial)? getOneProduct,
    TResult? Function(Product product)? changeProduct,
    TResult? Function(String? newColorCode)? changeColor,
    TResult? Function(int? newStorage)? changeStorage,
    TResult? Function()? createPurchase,
    TResult? Function()? openUrl,
    TResult? Function()? reset,
  }) {
    return openUrl?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool isInitial)? getOneProduct,
    TResult Function(Product product)? changeProduct,
    TResult Function(String? newColorCode)? changeColor,
    TResult Function(int? newStorage)? changeStorage,
    TResult Function()? createPurchase,
    TResult Function()? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (openUrl != null) {
      return openUrl();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOneProduct value) getOneProduct,
    required TResult Function(_ChangeProduct value) changeProduct,
    required TResult Function(_ChangeColor value) changeColor,
    required TResult Function(_ChangeStorage value) changeStorage,
    required TResult Function(_CreatePurchase value) createPurchase,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return openUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOneProduct value)? getOneProduct,
    TResult? Function(_ChangeProduct value)? changeProduct,
    TResult? Function(_ChangeColor value)? changeColor,
    TResult? Function(_ChangeStorage value)? changeStorage,
    TResult? Function(_CreatePurchase value)? createPurchase,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return openUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOneProduct value)? getOneProduct,
    TResult Function(_ChangeProduct value)? changeProduct,
    TResult Function(_ChangeColor value)? changeColor,
    TResult Function(_ChangeStorage value)? changeStorage,
    TResult Function(_CreatePurchase value)? createPurchase,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (openUrl != null) {
      return openUrl(this);
    }
    return orElse();
  }
}

abstract class _OpenUrl implements DetailedProductEvent {
  const factory _OpenUrl() = _$_OpenUrl;
}

/// @nodoc
abstract class _$$_ResetCopyWith<$Res> {
  factory _$$_ResetCopyWith(_$_Reset value, $Res Function(_$_Reset) then) =
      __$$_ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetCopyWithImpl<$Res>
    extends _$DetailedProductEventCopyWithImpl<$Res, _$_Reset>
    implements _$$_ResetCopyWith<$Res> {
  __$$_ResetCopyWithImpl(_$_Reset _value, $Res Function(_$_Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Reset with DiagnosticableTreeMixin implements _Reset {
  const _$_Reset();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedProductEvent.reset()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'DetailedProductEvent.reset'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, bool isInitial) getOneProduct,
    required TResult Function(Product product) changeProduct,
    required TResult Function(String? newColorCode) changeColor,
    required TResult Function(int? newStorage) changeStorage,
    required TResult Function() createPurchase,
    required TResult Function() openUrl,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, bool isInitial)? getOneProduct,
    TResult? Function(Product product)? changeProduct,
    TResult? Function(String? newColorCode)? changeColor,
    TResult? Function(int? newStorage)? changeStorage,
    TResult? Function()? createPurchase,
    TResult? Function()? openUrl,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, bool isInitial)? getOneProduct,
    TResult Function(Product product)? changeProduct,
    TResult Function(String? newColorCode)? changeColor,
    TResult Function(int? newStorage)? changeStorage,
    TResult Function()? createPurchase,
    TResult Function()? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOneProduct value) getOneProduct,
    required TResult Function(_ChangeProduct value) changeProduct,
    required TResult Function(_ChangeColor value) changeColor,
    required TResult Function(_ChangeStorage value) changeStorage,
    required TResult Function(_CreatePurchase value) createPurchase,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOneProduct value)? getOneProduct,
    TResult? Function(_ChangeProduct value)? changeProduct,
    TResult? Function(_ChangeColor value)? changeColor,
    TResult? Function(_ChangeStorage value)? changeStorage,
    TResult? Function(_CreatePurchase value)? createPurchase,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOneProduct value)? getOneProduct,
    TResult Function(_ChangeProduct value)? changeProduct,
    TResult Function(_ChangeColor value)? changeColor,
    TResult Function(_ChangeStorage value)? changeStorage,
    TResult Function(_CreatePurchase value)? createPurchase,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements DetailedProductEvent {
  const factory _Reset() = _$_Reset;
}

DetailedProductState _$DetailedProductStateFromJson(Map<String, dynamic> json) {
  return _DetailedProductState.fromJson(json);
}

/// @nodoc
mixin _$DetailedProductState {
  Product? get product => throw _privateConstructorUsedError;
  CreatePurchaseResponse? get purchase => throw _privateConstructorUsedError;
  DetailedProductStatus get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailedProductStateCopyWith<DetailedProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedProductStateCopyWith<$Res> {
  factory $DetailedProductStateCopyWith(DetailedProductState value,
          $Res Function(DetailedProductState) then) =
      _$DetailedProductStateCopyWithImpl<$Res, DetailedProductState>;
  @useResult
  $Res call(
      {Product? product,
      CreatePurchaseResponse? purchase,
      DetailedProductStatus status,
      Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$DetailedProductStateCopyWithImpl<$Res,
        $Val extends DetailedProductState>
    implements $DetailedProductStateCopyWith<$Res> {
  _$DetailedProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? purchase = freezed,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      purchase: freezed == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as CreatePurchaseResponse?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailedProductStatus,
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
abstract class _$$_DetailedProductStateCopyWith<$Res>
    implements $DetailedProductStateCopyWith<$Res> {
  factory _$$_DetailedProductStateCopyWith(_$_DetailedProductState value,
          $Res Function(_$_DetailedProductState) then) =
      __$$_DetailedProductStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Product? product,
      CreatePurchaseResponse? purchase,
      DetailedProductStatus status,
      Failure failure});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_DetailedProductStateCopyWithImpl<$Res>
    extends _$DetailedProductStateCopyWithImpl<$Res, _$_DetailedProductState>
    implements _$$_DetailedProductStateCopyWith<$Res> {
  __$$_DetailedProductStateCopyWithImpl(_$_DetailedProductState _value,
      $Res Function(_$_DetailedProductState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? purchase = freezed,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_$_DetailedProductState(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      purchase: freezed == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as CreatePurchaseResponse?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailedProductStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetailedProductState extends _DetailedProductState
    with DiagnosticableTreeMixin {
  const _$_DetailedProductState(
      {this.product,
      this.purchase,
      this.status = DetailedProductStatus.initial,
      this.failure = const CasualFailure()})
      : super._();

  factory _$_DetailedProductState.fromJson(Map<String, dynamic> json) =>
      _$$_DetailedProductStateFromJson(json);

  @override
  final Product? product;
  @override
  final CreatePurchaseResponse? purchase;
  @override
  @JsonKey()
  final DetailedProductStatus status;
  @override
  @JsonKey()
  final Failure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailedProductState(product: $product, purchase: $purchase, status: $status, failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailedProductState'))
      ..add(DiagnosticsProperty('product', product))
      ..add(DiagnosticsProperty('purchase', purchase))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailedProductState &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, product, purchase, status, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailedProductStateCopyWith<_$_DetailedProductState> get copyWith =>
      __$$_DetailedProductStateCopyWithImpl<_$_DetailedProductState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailedProductStateToJson(
      this,
    );
  }
}

abstract class _DetailedProductState extends DetailedProductState {
  const factory _DetailedProductState(
      {final Product? product,
      final CreatePurchaseResponse? purchase,
      final DetailedProductStatus status,
      final Failure failure}) = _$_DetailedProductState;
  const _DetailedProductState._() : super._();

  factory _DetailedProductState.fromJson(Map<String, dynamic> json) =
      _$_DetailedProductState.fromJson;

  @override
  Product? get product;
  @override
  CreatePurchaseResponse? get purchase;
  @override
  DetailedProductStatus get status;
  @override
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_DetailedProductStateCopyWith<_$_DetailedProductState> get copyWith =>
      throw _privateConstructorUsedError;
}
