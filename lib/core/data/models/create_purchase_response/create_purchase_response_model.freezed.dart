// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_purchase_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreatePurchaseResponseModel _$CreatePurchaseResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CreatePurchaseResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CreatePurchaseResponseModel {
  PurchaseModel get purchase => throw _privateConstructorUsedError;
  PaymentModel get payment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatePurchaseResponseModelCopyWith<CreatePurchaseResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePurchaseResponseModelCopyWith<$Res> {
  factory $CreatePurchaseResponseModelCopyWith(
          CreatePurchaseResponseModel value,
          $Res Function(CreatePurchaseResponseModel) then) =
      _$CreatePurchaseResponseModelCopyWithImpl<$Res,
          CreatePurchaseResponseModel>;
  @useResult
  $Res call({PurchaseModel purchase, PaymentModel payment});

  $PurchaseModelCopyWith<$Res> get purchase;
  $PaymentModelCopyWith<$Res> get payment;
}

/// @nodoc
class _$CreatePurchaseResponseModelCopyWithImpl<$Res,
        $Val extends CreatePurchaseResponseModel>
    implements $CreatePurchaseResponseModelCopyWith<$Res> {
  _$CreatePurchaseResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
    Object? payment = null,
  }) {
    return _then(_value.copyWith(
      purchase: null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseModel,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseModelCopyWith<$Res> get purchase {
    return $PurchaseModelCopyWith<$Res>(_value.purchase, (value) {
      return _then(_value.copyWith(purchase: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res> get payment {
    return $PaymentModelCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreatePurchaseResponseModelCopyWith<$Res>
    implements $CreatePurchaseResponseModelCopyWith<$Res> {
  factory _$$_CreatePurchaseResponseModelCopyWith(
          _$_CreatePurchaseResponseModel value,
          $Res Function(_$_CreatePurchaseResponseModel) then) =
      __$$_CreatePurchaseResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PurchaseModel purchase, PaymentModel payment});

  @override
  $PurchaseModelCopyWith<$Res> get purchase;
  @override
  $PaymentModelCopyWith<$Res> get payment;
}

/// @nodoc
class __$$_CreatePurchaseResponseModelCopyWithImpl<$Res>
    extends _$CreatePurchaseResponseModelCopyWithImpl<$Res,
        _$_CreatePurchaseResponseModel>
    implements _$$_CreatePurchaseResponseModelCopyWith<$Res> {
  __$$_CreatePurchaseResponseModelCopyWithImpl(
      _$_CreatePurchaseResponseModel _value,
      $Res Function(_$_CreatePurchaseResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchase = null,
    Object? payment = null,
  }) {
    return _then(_$_CreatePurchaseResponseModel(
      purchase: null == purchase
          ? _value.purchase
          : purchase // ignore: cast_nullable_to_non_nullable
              as PurchaseModel,
      payment: null == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as PaymentModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreatePurchaseResponseModel implements _CreatePurchaseResponseModel {
  const _$_CreatePurchaseResponseModel(
      {required this.purchase, required this.payment});

  factory _$_CreatePurchaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CreatePurchaseResponseModelFromJson(json);

  @override
  final PurchaseModel purchase;
  @override
  final PaymentModel payment;

  @override
  String toString() {
    return 'CreatePurchaseResponseModel(purchase: $purchase, payment: $payment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePurchaseResponseModel &&
            (identical(other.purchase, purchase) ||
                other.purchase == purchase) &&
            (identical(other.payment, payment) || other.payment == payment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, purchase, payment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatePurchaseResponseModelCopyWith<_$_CreatePurchaseResponseModel>
      get copyWith => __$$_CreatePurchaseResponseModelCopyWithImpl<
          _$_CreatePurchaseResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatePurchaseResponseModelToJson(
      this,
    );
  }
}

abstract class _CreatePurchaseResponseModel
    implements CreatePurchaseResponseModel {
  const factory _CreatePurchaseResponseModel(
      {required final PurchaseModel purchase,
      required final PaymentModel payment}) = _$_CreatePurchaseResponseModel;

  factory _CreatePurchaseResponseModel.fromJson(Map<String, dynamic> json) =
      _$_CreatePurchaseResponseModel.fromJson;

  @override
  PurchaseModel get purchase;
  @override
  PaymentModel get payment;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePurchaseResponseModelCopyWith<_$_CreatePurchaseResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
