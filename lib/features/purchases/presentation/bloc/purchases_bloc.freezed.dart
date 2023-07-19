// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchases_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchasesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refresh,
    required TResult Function(String query) searchPurchases,
    required TResult Function() getNextPurchases,
    required TResult Function(Purchase purchase, PurchaseStatus status)
        changeStatus,
    required TResult Function(Purchase purchase) openUrl,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchPurchases,
    TResult? Function()? getNextPurchases,
    TResult? Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult? Function(Purchase purchase)? openUrl,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refresh,
    TResult Function(String query)? searchPurchases,
    TResult Function()? getNextPurchases,
    TResult Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult Function(Purchase purchase)? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_SearchPurchases value) searchPurchases,
    required TResult Function(_GetNextPurchases value) getNextPurchases,
    required TResult Function(_ChangeStatus value) changeStatus,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_SearchPurchases value)? searchPurchases,
    TResult? Function(_GetNextPurchases value)? getNextPurchases,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_SearchPurchases value)? searchPurchases,
    TResult Function(_GetNextPurchases value)? getNextPurchases,
    TResult Function(_ChangeStatus value)? changeStatus,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesEventCopyWith<$Res> {
  factory $PurchasesEventCopyWith(
          PurchasesEvent value, $Res Function(PurchasesEvent) then) =
      _$PurchasesEventCopyWithImpl<$Res, PurchasesEvent>;
}

/// @nodoc
class _$PurchasesEventCopyWithImpl<$Res, $Val extends PurchasesEvent>
    implements $PurchasesEventCopyWith<$Res> {
  _$PurchasesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'PurchasesEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refresh,
    required TResult Function(String query) searchPurchases,
    required TResult Function() getNextPurchases,
    required TResult Function(Purchase purchase, PurchaseStatus status)
        changeStatus,
    required TResult Function(Purchase purchase) openUrl,
    required TResult Function() reset,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchPurchases,
    TResult? Function()? getNextPurchases,
    TResult? Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult? Function(Purchase purchase)? openUrl,
    TResult? Function()? reset,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refresh,
    TResult Function(String query)? searchPurchases,
    TResult Function()? getNextPurchases,
    TResult Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult Function(Purchase purchase)? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_SearchPurchases value) searchPurchases,
    required TResult Function(_GetNextPurchases value) getNextPurchases,
    required TResult Function(_ChangeStatus value) changeStatus,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_SearchPurchases value)? searchPurchases,
    TResult? Function(_GetNextPurchases value)? getNextPurchases,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_SearchPurchases value)? searchPurchases,
    TResult Function(_GetNextPurchases value)? getNextPurchases,
    TResult Function(_ChangeStatus value)? changeStatus,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PurchasesEvent {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_RefreshCopyWith<$Res> {
  factory _$$_RefreshCopyWith(
          _$_Refresh value, $Res Function(_$_Refresh) then) =
      __$$_RefreshCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res, _$_Refresh>
    implements _$$_RefreshCopyWith<$Res> {
  __$$_RefreshCopyWithImpl(_$_Refresh _value, $Res Function(_$_Refresh) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Refresh implements _Refresh {
  const _$_Refresh();

  @override
  String toString() {
    return 'PurchasesEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Refresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refresh,
    required TResult Function(String query) searchPurchases,
    required TResult Function() getNextPurchases,
    required TResult Function(Purchase purchase, PurchaseStatus status)
        changeStatus,
    required TResult Function(Purchase purchase) openUrl,
    required TResult Function() reset,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchPurchases,
    TResult? Function()? getNextPurchases,
    TResult? Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult? Function(Purchase purchase)? openUrl,
    TResult? Function()? reset,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refresh,
    TResult Function(String query)? searchPurchases,
    TResult Function()? getNextPurchases,
    TResult Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult Function(Purchase purchase)? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_SearchPurchases value) searchPurchases,
    required TResult Function(_GetNextPurchases value) getNextPurchases,
    required TResult Function(_ChangeStatus value) changeStatus,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_SearchPurchases value)? searchPurchases,
    TResult? Function(_GetNextPurchases value)? getNextPurchases,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_SearchPurchases value)? searchPurchases,
    TResult Function(_GetNextPurchases value)? getNextPurchases,
    TResult Function(_ChangeStatus value)? changeStatus,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements PurchasesEvent {
  const factory _Refresh() = _$_Refresh;
}

/// @nodoc
abstract class _$$_SearchPurchasesCopyWith<$Res> {
  factory _$$_SearchPurchasesCopyWith(
          _$_SearchPurchases value, $Res Function(_$_SearchPurchases) then) =
      __$$_SearchPurchasesCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$_SearchPurchasesCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res, _$_SearchPurchases>
    implements _$$_SearchPurchasesCopyWith<$Res> {
  __$$_SearchPurchasesCopyWithImpl(
      _$_SearchPurchases _value, $Res Function(_$_SearchPurchases) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$_SearchPurchases(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchPurchases implements _SearchPurchases {
  const _$_SearchPurchases(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'PurchasesEvent.searchPurchases(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchPurchases &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchPurchasesCopyWith<_$_SearchPurchases> get copyWith =>
      __$$_SearchPurchasesCopyWithImpl<_$_SearchPurchases>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refresh,
    required TResult Function(String query) searchPurchases,
    required TResult Function() getNextPurchases,
    required TResult Function(Purchase purchase, PurchaseStatus status)
        changeStatus,
    required TResult Function(Purchase purchase) openUrl,
    required TResult Function() reset,
  }) {
    return searchPurchases(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchPurchases,
    TResult? Function()? getNextPurchases,
    TResult? Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult? Function(Purchase purchase)? openUrl,
    TResult? Function()? reset,
  }) {
    return searchPurchases?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refresh,
    TResult Function(String query)? searchPurchases,
    TResult Function()? getNextPurchases,
    TResult Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult Function(Purchase purchase)? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (searchPurchases != null) {
      return searchPurchases(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_SearchPurchases value) searchPurchases,
    required TResult Function(_GetNextPurchases value) getNextPurchases,
    required TResult Function(_ChangeStatus value) changeStatus,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return searchPurchases(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_SearchPurchases value)? searchPurchases,
    TResult? Function(_GetNextPurchases value)? getNextPurchases,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return searchPurchases?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_SearchPurchases value)? searchPurchases,
    TResult Function(_GetNextPurchases value)? getNextPurchases,
    TResult Function(_ChangeStatus value)? changeStatus,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (searchPurchases != null) {
      return searchPurchases(this);
    }
    return orElse();
  }
}

abstract class _SearchPurchases implements PurchasesEvent {
  const factory _SearchPurchases(final String query) = _$_SearchPurchases;

  String get query;
  @JsonKey(ignore: true)
  _$$_SearchPurchasesCopyWith<_$_SearchPurchases> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetNextPurchasesCopyWith<$Res> {
  factory _$$_GetNextPurchasesCopyWith(
          _$_GetNextPurchases value, $Res Function(_$_GetNextPurchases) then) =
      __$$_GetNextPurchasesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetNextPurchasesCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res, _$_GetNextPurchases>
    implements _$$_GetNextPurchasesCopyWith<$Res> {
  __$$_GetNextPurchasesCopyWithImpl(
      _$_GetNextPurchases _value, $Res Function(_$_GetNextPurchases) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetNextPurchases implements _GetNextPurchases {
  const _$_GetNextPurchases();

  @override
  String toString() {
    return 'PurchasesEvent.getNextPurchases()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetNextPurchases);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refresh,
    required TResult Function(String query) searchPurchases,
    required TResult Function() getNextPurchases,
    required TResult Function(Purchase purchase, PurchaseStatus status)
        changeStatus,
    required TResult Function(Purchase purchase) openUrl,
    required TResult Function() reset,
  }) {
    return getNextPurchases();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchPurchases,
    TResult? Function()? getNextPurchases,
    TResult? Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult? Function(Purchase purchase)? openUrl,
    TResult? Function()? reset,
  }) {
    return getNextPurchases?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refresh,
    TResult Function(String query)? searchPurchases,
    TResult Function()? getNextPurchases,
    TResult Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult Function(Purchase purchase)? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (getNextPurchases != null) {
      return getNextPurchases();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_SearchPurchases value) searchPurchases,
    required TResult Function(_GetNextPurchases value) getNextPurchases,
    required TResult Function(_ChangeStatus value) changeStatus,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return getNextPurchases(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_SearchPurchases value)? searchPurchases,
    TResult? Function(_GetNextPurchases value)? getNextPurchases,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return getNextPurchases?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_SearchPurchases value)? searchPurchases,
    TResult Function(_GetNextPurchases value)? getNextPurchases,
    TResult Function(_ChangeStatus value)? changeStatus,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (getNextPurchases != null) {
      return getNextPurchases(this);
    }
    return orElse();
  }
}

abstract class _GetNextPurchases implements PurchasesEvent {
  const factory _GetNextPurchases() = _$_GetNextPurchases;
}

/// @nodoc
abstract class _$$_ChangeStatusCopyWith<$Res> {
  factory _$$_ChangeStatusCopyWith(
          _$_ChangeStatus value, $Res Function(_$_ChangeStatus) then) =
      __$$_ChangeStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({Purchase purchase, PurchaseStatus status});
}

/// @nodoc
class __$$_ChangeStatusCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res, _$_ChangeStatus>
    implements _$$_ChangeStatusCopyWith<$Res> {
  __$$_ChangeStatusCopyWithImpl(
      _$_ChangeStatus _value, $Res Function(_$_ChangeStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
    Object? status = null,
  }) {
    return _then(_$_ChangeStatus(
      purchase: null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as Purchase,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
    ));
  }
}

/// @nodoc

class _$_ChangeStatus implements _ChangeStatus {
  const _$_ChangeStatus({required this.purchase, required this.status});

  @override
  final Purchase purchase;
  @override
  final PurchaseStatus status;

  @override
  String toString() {
    return 'PurchasesEvent.changeStatus(purchase: $purchase, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeStatus &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchase, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeStatusCopyWith<_$_ChangeStatus> get copyWith =>
      __$$_ChangeStatusCopyWithImpl<_$_ChangeStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refresh,
    required TResult Function(String query) searchPurchases,
    required TResult Function() getNextPurchases,
    required TResult Function(Purchase purchase, PurchaseStatus status)
        changeStatus,
    required TResult Function(Purchase purchase) openUrl,
    required TResult Function() reset,
  }) {
    return changeStatus(purchase, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchPurchases,
    TResult? Function()? getNextPurchases,
    TResult? Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult? Function(Purchase purchase)? openUrl,
    TResult? Function()? reset,
  }) {
    return changeStatus?.call(purchase, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refresh,
    TResult Function(String query)? searchPurchases,
    TResult Function()? getNextPurchases,
    TResult Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult Function(Purchase purchase)? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus(purchase, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_SearchPurchases value) searchPurchases,
    required TResult Function(_GetNextPurchases value) getNextPurchases,
    required TResult Function(_ChangeStatus value) changeStatus,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return changeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_SearchPurchases value)? searchPurchases,
    TResult? Function(_GetNextPurchases value)? getNextPurchases,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return changeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_SearchPurchases value)? searchPurchases,
    TResult Function(_GetNextPurchases value)? getNextPurchases,
    TResult Function(_ChangeStatus value)? changeStatus,
    TResult Function(_OpenUrl value)? openUrl,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus(this);
    }
    return orElse();
  }
}

abstract class _ChangeStatus implements PurchasesEvent {
  const factory _ChangeStatus(
      {required final Purchase purchase,
      required final PurchaseStatus status}) = _$_ChangeStatus;

  Purchase get purchase;
  PurchaseStatus get status;
  @JsonKey(ignore: true)
  _$$_ChangeStatusCopyWith<_$_ChangeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OpenUrlCopyWith<$Res> {
  factory _$$_OpenUrlCopyWith(
          _$_OpenUrl value, $Res Function(_$_OpenUrl) then) =
      __$$_OpenUrlCopyWithImpl<$Res>;
  @useResult
  $Res call({Purchase purchase});
}

/// @nodoc
class __$$_OpenUrlCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res, _$_OpenUrl>
    implements _$$_OpenUrlCopyWith<$Res> {
  __$$_OpenUrlCopyWithImpl(_$_OpenUrl _value, $Res Function(_$_OpenUrl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
  }) {
    return _then(_$_OpenUrl(
      null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as Purchase,
    ));
  }
}

/// @nodoc

class _$_OpenUrl implements _OpenUrl {
  const _$_OpenUrl(this.purchase);

  @override
  final Purchase purchase;

  @override
  String toString() {
    return 'PurchasesEvent.openUrl(purchase: $purchase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpenUrl &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpenUrlCopyWith<_$_OpenUrl> get copyWith =>
      __$$_OpenUrlCopyWithImpl<_$_OpenUrl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() refresh,
    required TResult Function(String query) searchPurchases,
    required TResult Function() getNextPurchases,
    required TResult Function(Purchase purchase, PurchaseStatus status)
        changeStatus,
    required TResult Function(Purchase purchase) openUrl,
    required TResult Function() reset,
  }) {
    return openUrl(purchase);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchPurchases,
    TResult? Function()? getNextPurchases,
    TResult? Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult? Function(Purchase purchase)? openUrl,
    TResult? Function()? reset,
  }) {
    return openUrl?.call(purchase);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refresh,
    TResult Function(String query)? searchPurchases,
    TResult Function()? getNextPurchases,
    TResult Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult Function(Purchase purchase)? openUrl,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (openUrl != null) {
      return openUrl(purchase);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_SearchPurchases value) searchPurchases,
    required TResult Function(_GetNextPurchases value) getNextPurchases,
    required TResult Function(_ChangeStatus value) changeStatus,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return openUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_SearchPurchases value)? searchPurchases,
    TResult? Function(_GetNextPurchases value)? getNextPurchases,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return openUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_SearchPurchases value)? searchPurchases,
    TResult Function(_GetNextPurchases value)? getNextPurchases,
    TResult Function(_ChangeStatus value)? changeStatus,
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

abstract class _OpenUrl implements PurchasesEvent {
  const factory _OpenUrl(final Purchase purchase) = _$_OpenUrl;

  Purchase get purchase;
  @JsonKey(ignore: true)
  _$$_OpenUrlCopyWith<_$_OpenUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResetCopyWith<$Res> {
  factory _$$_ResetCopyWith(_$_Reset value, $Res Function(_$_Reset) then) =
      __$$_ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResetCopyWithImpl<$Res>
    extends _$PurchasesEventCopyWithImpl<$Res, _$_Reset>
    implements _$$_ResetCopyWith<$Res> {
  __$$_ResetCopyWithImpl(_$_Reset _value, $Res Function(_$_Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Reset implements _Reset {
  const _$_Reset();

  @override
  String toString() {
    return 'PurchasesEvent.reset()';
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
    required TResult Function() initial,
    required TResult Function() refresh,
    required TResult Function(String query) searchPurchases,
    required TResult Function() getNextPurchases,
    required TResult Function(Purchase purchase, PurchaseStatus status)
        changeStatus,
    required TResult Function(Purchase purchase) openUrl,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? refresh,
    TResult? Function(String query)? searchPurchases,
    TResult? Function()? getNextPurchases,
    TResult? Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult? Function(Purchase purchase)? openUrl,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? refresh,
    TResult Function(String query)? searchPurchases,
    TResult Function()? getNextPurchases,
    TResult Function(Purchase purchase, PurchaseStatus status)? changeStatus,
    TResult Function(Purchase purchase)? openUrl,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_SearchPurchases value) searchPurchases,
    required TResult Function(_GetNextPurchases value) getNextPurchases,
    required TResult Function(_ChangeStatus value) changeStatus,
    required TResult Function(_OpenUrl value) openUrl,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_SearchPurchases value)? searchPurchases,
    TResult? Function(_GetNextPurchases value)? getNextPurchases,
    TResult? Function(_ChangeStatus value)? changeStatus,
    TResult? Function(_OpenUrl value)? openUrl,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Refresh value)? refresh,
    TResult Function(_SearchPurchases value)? searchPurchases,
    TResult Function(_GetNextPurchases value)? getNextPurchases,
    TResult Function(_ChangeStatus value)? changeStatus,
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

abstract class _Reset implements PurchasesEvent {
  const factory _Reset() = _$_Reset;
}

/// @nodoc
mixin _$PurchasesState {
  Info get info => throw _privateConstructorUsedError;
  List<Purchase> get purchases => throw _privateConstructorUsedError;
  PurchasesStatus get status => throw _privateConstructorUsedError;
  SimpleFilter get filter => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchasesStateCopyWith<PurchasesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchasesStateCopyWith<$Res> {
  factory $PurchasesStateCopyWith(
          PurchasesState value, $Res Function(PurchasesState) then) =
      _$PurchasesStateCopyWithImpl<$Res, PurchasesState>;
  @useResult
  $Res call(
      {Info info,
      List<Purchase> purchases,
      PurchasesStatus status,
      SimpleFilter filter,
      Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$PurchasesStateCopyWithImpl<$Res, $Val extends PurchasesState>
    implements $PurchasesStateCopyWith<$Res> {
  _$PurchasesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? purchases = null,
    Object? status = null,
    Object? filter = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      purchases: null == purchases
          ? _value.purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<Purchase>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchasesStatus,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as SimpleFilter,
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
abstract class _$$_PurchasesStateCopyWith<$Res>
    implements $PurchasesStateCopyWith<$Res> {
  factory _$$_PurchasesStateCopyWith(
          _$_PurchasesState value, $Res Function(_$_PurchasesState) then) =
      __$$_PurchasesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Info info,
      List<Purchase> purchases,
      PurchasesStatus status,
      SimpleFilter filter,
      Failure failure});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_PurchasesStateCopyWithImpl<$Res>
    extends _$PurchasesStateCopyWithImpl<$Res, _$_PurchasesState>
    implements _$$_PurchasesStateCopyWith<$Res> {
  __$$_PurchasesStateCopyWithImpl(
      _$_PurchasesState _value, $Res Function(_$_PurchasesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? purchases = null,
    Object? status = null,
    Object? filter = null,
    Object? failure = null,
  }) {
    return _then(_$_PurchasesState(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Info,
      purchases: null == purchases
          ? _value._purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<Purchase>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchasesStatus,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as SimpleFilter,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_PurchasesState extends _PurchasesState {
  const _$_PurchasesState(
      {this.info = const Info.initial(),
      final List<Purchase> purchases = const [],
      this.status = PurchasesStatus.initial,
      this.filter = const SimpleFilter(),
      this.failure = const CasualFailure()})
      : _purchases = purchases,
        super._();

  @override
  @JsonKey()
  final Info info;
  final List<Purchase> _purchases;
  @override
  @JsonKey()
  List<Purchase> get purchases {
    if (_purchases is EqualUnmodifiableListView) return _purchases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchases);
  }

  @override
  @JsonKey()
  final PurchasesStatus status;
  @override
  @JsonKey()
  final SimpleFilter filter;
  @override
  @JsonKey()
  final Failure failure;

  @override
  String toString() {
    return 'PurchasesState(info: $info, purchases: $purchases, status: $status, filter: $filter, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchasesState &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality()
                .equals(other._purchases, _purchases) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, info,
      const DeepCollectionEquality().hash(_purchases), status, filter, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchasesStateCopyWith<_$_PurchasesState> get copyWith =>
      __$$_PurchasesStateCopyWithImpl<_$_PurchasesState>(this, _$identity);
}

abstract class _PurchasesState extends PurchasesState {
  const factory _PurchasesState(
      {final Info info,
      final List<Purchase> purchases,
      final PurchasesStatus status,
      final SimpleFilter filter,
      final Failure failure}) = _$_PurchasesState;
  const _PurchasesState._() : super._();

  @override
  Info get info;
  @override
  List<Purchase> get purchases;
  @override
  PurchasesStatus get status;
  @override
  SimpleFilter get filter;
  @override
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_PurchasesStateCopyWith<_$_PurchasesState> get copyWith =>
      throw _privateConstructorUsedError;
}
