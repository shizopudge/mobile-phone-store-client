// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrentUserModel _$CurrentUserModelFromJson(Map<String, dynamic> json) {
  return _CurrentUserModel.fromJson(json);
}

/// @nodoc
mixin _$CurrentUserModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentUserModelCopyWith<CurrentUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentUserModelCopyWith<$Res> {
  factory $CurrentUserModelCopyWith(
          CurrentUserModel value, $Res Function(CurrentUserModel) then) =
      _$CurrentUserModelCopyWithImpl<$Res, CurrentUserModel>;
  @useResult
  $Res call(
      {String id,
      String email,
      String username,
      String? image,
      UserRole role,
      String? phone});
}

/// @nodoc
class _$CurrentUserModelCopyWithImpl<$Res, $Val extends CurrentUserModel>
    implements $CurrentUserModelCopyWith<$Res> {
  _$CurrentUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? image = freezed,
    Object? role = null,
    Object? phone = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrentUserModelCopyWith<$Res>
    implements $CurrentUserModelCopyWith<$Res> {
  factory _$$_CurrentUserModelCopyWith(
          _$_CurrentUserModel value, $Res Function(_$_CurrentUserModel) then) =
      __$$_CurrentUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String username,
      String? image,
      UserRole role,
      String? phone});
}

/// @nodoc
class __$$_CurrentUserModelCopyWithImpl<$Res>
    extends _$CurrentUserModelCopyWithImpl<$Res, _$_CurrentUserModel>
    implements _$$_CurrentUserModelCopyWith<$Res> {
  __$$_CurrentUserModelCopyWithImpl(
      _$_CurrentUserModel _value, $Res Function(_$_CurrentUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? username = null,
    Object? image = freezed,
    Object? role = null,
    Object? phone = freezed,
  }) {
    return _then(_$_CurrentUserModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrentUserModel implements _CurrentUserModel {
  const _$_CurrentUserModel(
      {required this.id,
      required this.email,
      required this.username,
      required this.image,
      required this.role,
      required this.phone});

  factory _$_CurrentUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_CurrentUserModelFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String username;
  @override
  final String? image;
  @override
  final UserRole role;
  @override
  final String? phone;

  @override
  String toString() {
    return 'CurrentUserModel(id: $id, email: $email, username: $username, image: $image, role: $role, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, username, image, role, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrentUserModelCopyWith<_$_CurrentUserModel> get copyWith =>
      __$$_CurrentUserModelCopyWithImpl<_$_CurrentUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrentUserModelToJson(
      this,
    );
  }
}

abstract class _CurrentUserModel implements CurrentUserModel {
  const factory _CurrentUserModel(
      {required final String id,
      required final String email,
      required final String username,
      required final String? image,
      required final UserRole role,
      required final String? phone}) = _$_CurrentUserModel;

  factory _CurrentUserModel.fromJson(Map<String, dynamic> json) =
      _$_CurrentUserModel.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get username;
  @override
  String? get image;
  @override
  UserRole get role;
  @override
  String? get phone;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentUserModelCopyWith<_$_CurrentUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
