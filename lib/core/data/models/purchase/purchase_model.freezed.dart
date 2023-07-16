// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) {
  return _PurchaseModel.fromJson(json);
}

/// @nodoc
mixin _$PurchaseModel {
  String get id => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  PurchaseStatus get status => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseModelCopyWith<PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseModelCopyWith<$Res> {
  factory $PurchaseModelCopyWith(
          PurchaseModel value, $Res Function(PurchaseModel) then) =
      _$PurchaseModelCopyWithImpl<$Res, PurchaseModel>;
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updatedAt,
      PurchaseStatus status,
      String userId,
      String productId});
}

/// @nodoc
class _$PurchaseModelCopyWithImpl<$Res, $Val extends PurchaseModel>
    implements $PurchaseModelCopyWith<$Res> {
  _$PurchaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? status = null,
    Object? userId = null,
    Object? productId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchaseModelCopyWith<$Res>
    implements $PurchaseModelCopyWith<$Res> {
  factory _$$_PurchaseModelCopyWith(
          _$_PurchaseModel value, $Res Function(_$_PurchaseModel) then) =
      __$$_PurchaseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String createdAt,
      String updatedAt,
      PurchaseStatus status,
      String userId,
      String productId});
}

/// @nodoc
class __$$_PurchaseModelCopyWithImpl<$Res>
    extends _$PurchaseModelCopyWithImpl<$Res, _$_PurchaseModel>
    implements _$$_PurchaseModelCopyWith<$Res> {
  __$$_PurchaseModelCopyWithImpl(
      _$_PurchaseModel _value, $Res Function(_$_PurchaseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? status = null,
    Object? userId = null,
    Object? productId = null,
  }) {
    return _then(_$_PurchaseModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseStatus,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PurchaseModel implements _PurchaseModel {
  const _$_PurchaseModel(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.status,
      required this.userId,
      required this.productId});

  factory _$_PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$$_PurchaseModelFromJson(json);

  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final PurchaseStatus status;
  @override
  final String userId;
  @override
  final String productId;

  @override
  String toString() {
    return 'PurchaseModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, userId: $userId, productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurchaseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updatedAt, status, userId, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseModelCopyWith<_$_PurchaseModel> get copyWith =>
      __$$_PurchaseModelCopyWithImpl<_$_PurchaseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchaseModelToJson(
      this,
    );
  }
}

abstract class _PurchaseModel implements PurchaseModel {
  const factory _PurchaseModel(
      {required final String id,
      required final String createdAt,
      required final String updatedAt,
      required final PurchaseStatus status,
      required final String userId,
      required final String productId}) = _$_PurchaseModel;

  factory _PurchaseModel.fromJson(Map<String, dynamic> json) =
      _$_PurchaseModel.fromJson;

  @override
  String get id;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  PurchaseStatus get status;
  @override
  String get userId;
  @override
  String get productId;
  @override
  @JsonKey(ignore: true)
  _$$_PurchaseModelCopyWith<_$_PurchaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
