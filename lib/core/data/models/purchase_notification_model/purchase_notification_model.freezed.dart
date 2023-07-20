// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseNotficationModel _$PurchaseNotficationModelFromJson(
    Map<String, dynamic> json) {
  return _PurchaseNotficationModel.fromJson(json);
}

/// @nodoc
mixin _$PurchaseNotficationModel {
  String get paymentId => throw _privateConstructorUsedError;
  String get cost => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  PurchaseStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseNotficationModelCopyWith<PurchaseNotficationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseNotficationModelCopyWith<$Res> {
  factory $PurchaseNotficationModelCopyWith(PurchaseNotficationModel value,
          $Res Function(PurchaseNotficationModel) then) =
      _$PurchaseNotficationModelCopyWithImpl<$Res, PurchaseNotficationModel>;
  @useResult
  $Res call(
      {String paymentId, String cost, String currency, PurchaseStatus status});
}

/// @nodoc
class _$PurchaseNotficationModelCopyWithImpl<$Res,
        $Val extends PurchaseNotficationModel>
    implements $PurchaseNotficationModelCopyWith<$Res> {
  _$PurchaseNotficationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? cost = null,
    Object? currency = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchaseNotficationModelCopyWith<$Res>
    implements $PurchaseNotficationModelCopyWith<$Res> {
  factory _$$_PurchaseNotficationModelCopyWith(
          _$_PurchaseNotficationModel value,
          $Res Function(_$_PurchaseNotficationModel) then) =
      __$$_PurchaseNotficationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String paymentId, String cost, String currency, PurchaseStatus status});
}

/// @nodoc
class __$$_PurchaseNotficationModelCopyWithImpl<$Res>
    extends _$PurchaseNotficationModelCopyWithImpl<$Res,
        _$_PurchaseNotficationModel>
    implements _$$_PurchaseNotficationModelCopyWith<$Res> {
  __$$_PurchaseNotficationModelCopyWithImpl(_$_PurchaseNotficationModel _value,
      $Res Function(_$_PurchaseNotficationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? cost = null,
    Object? currency = null,
    Object? status = null,
  }) {
    return _then(_$_PurchaseNotficationModel(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PurchaseNotficationModel implements _PurchaseNotficationModel {
  const _$_PurchaseNotficationModel(
      {required this.paymentId,
      required this.cost,
      required this.currency,
      required this.status});

  factory _$_PurchaseNotficationModel.fromJson(Map<String, dynamic> json) =>
      _$$_PurchaseNotficationModelFromJson(json);

  @override
  final String paymentId;
  @override
  final String cost;
  @override
  final String currency;
  @override
  final PurchaseStatus status;

  @override
  String toString() {
    return 'PurchaseNotficationModel(paymentId: $paymentId, cost: $cost, currency: $currency, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchaseNotficationModel &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentId, cost, currency, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseNotficationModelCopyWith<_$_PurchaseNotficationModel>
      get copyWith => __$$_PurchaseNotficationModelCopyWithImpl<
          _$_PurchaseNotficationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchaseNotficationModelToJson(
      this,
    );
  }
}

abstract class _PurchaseNotficationModel implements PurchaseNotficationModel {
  const factory _PurchaseNotficationModel(
      {required final String paymentId,
      required final String cost,
      required final String currency,
      required final PurchaseStatus status}) = _$_PurchaseNotficationModel;

  factory _PurchaseNotficationModel.fromJson(Map<String, dynamic> json) =
      _$_PurchaseNotficationModel.fromJson;

  @override
  String get paymentId;
  @override
  String get cost;
  @override
  String get currency;
  @override
  PurchaseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_PurchaseNotficationModelCopyWith<_$_PurchaseNotficationModel>
      get copyWith => throw _privateConstructorUsedError;
}
