// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  String get id => throw _privateConstructorUsedError;
  String get cost => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {String id,
      String cost,
      String currency,
      String description,
      String url});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cost = null,
    Object? currency = null,
    Object? description = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentModelCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$_PaymentModelCopyWith(
          _$_PaymentModel value, $Res Function(_$_PaymentModel) then) =
      __$$_PaymentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String cost,
      String currency,
      String description,
      String url});
}

/// @nodoc
class __$$_PaymentModelCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$_PaymentModel>
    implements _$$_PaymentModelCopyWith<$Res> {
  __$$_PaymentModelCopyWithImpl(
      _$_PaymentModel _value, $Res Function(_$_PaymentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cost = null,
    Object? currency = null,
    Object? description = null,
    Object? url = null,
  }) {
    return _then(_$_PaymentModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentModel implements _PaymentModel {
  const _$_PaymentModel(
      {required this.id,
      required this.cost,
      required this.currency,
      required this.description,
      required this.url});

  factory _$_PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentModelFromJson(json);

  @override
  final String id;
  @override
  final String cost;
  @override
  final String currency;
  @override
  final String description;
  @override
  final String url;

  @override
  String toString() {
    return 'PaymentModel(id: $id, cost: $cost, currency: $currency, description: $description, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, cost, currency, description, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentModelCopyWith<_$_PaymentModel> get copyWith =>
      __$$_PaymentModelCopyWithImpl<_$_PaymentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentModelToJson(
      this,
    );
  }
}

abstract class _PaymentModel implements PaymentModel {
  const factory _PaymentModel(
      {required final String id,
      required final String cost,
      required final String currency,
      required final String description,
      required final String url}) = _$_PaymentModel;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$_PaymentModel.fromJson;

  @override
  String get id;
  @override
  String get cost;
  @override
  String get currency;
  @override
  String get description;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentModelCopyWith<_$_PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
