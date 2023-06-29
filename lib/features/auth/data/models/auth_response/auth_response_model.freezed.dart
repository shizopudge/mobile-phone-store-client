// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) {
  return _AuthResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AuthResponseModel {
  CurrentUserModel get user => throw _privateConstructorUsedError;
  TokensModel get tokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthResponseModelCopyWith<AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseModelCopyWith<$Res> {
  factory $AuthResponseModelCopyWith(
          AuthResponseModel value, $Res Function(AuthResponseModel) then) =
      _$AuthResponseModelCopyWithImpl<$Res, AuthResponseModel>;
  @useResult
  $Res call({CurrentUserModel user, TokensModel tokens});

  $CurrentUserModelCopyWith<$Res> get user;
  $TokensModelCopyWith<$Res> get tokens;
}

/// @nodoc
class _$AuthResponseModelCopyWithImpl<$Res, $Val extends AuthResponseModel>
    implements $AuthResponseModelCopyWith<$Res> {
  _$AuthResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? tokens = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CurrentUserModel,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as TokensModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentUserModelCopyWith<$Res> get user {
    return $CurrentUserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TokensModelCopyWith<$Res> get tokens {
    return $TokensModelCopyWith<$Res>(_value.tokens, (value) {
      return _then(_value.copyWith(tokens: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthResponseModelCopyWith<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  factory _$$_AuthResponseModelCopyWith(_$_AuthResponseModel value,
          $Res Function(_$_AuthResponseModel) then) =
      __$$_AuthResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CurrentUserModel user, TokensModel tokens});

  @override
  $CurrentUserModelCopyWith<$Res> get user;
  @override
  $TokensModelCopyWith<$Res> get tokens;
}

/// @nodoc
class __$$_AuthResponseModelCopyWithImpl<$Res>
    extends _$AuthResponseModelCopyWithImpl<$Res, _$_AuthResponseModel>
    implements _$$_AuthResponseModelCopyWith<$Res> {
  __$$_AuthResponseModelCopyWithImpl(
      _$_AuthResponseModel _value, $Res Function(_$_AuthResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? tokens = null,
  }) {
    return _then(_$_AuthResponseModel(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CurrentUserModel,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as TokensModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthResponseModel implements _AuthResponseModel {
  const _$_AuthResponseModel({required this.user, required this.tokens});

  factory _$_AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthResponseModelFromJson(json);

  @override
  final CurrentUserModel user;
  @override
  final TokensModel tokens;

  @override
  String toString() {
    return 'AuthResponseModel(user: $user, tokens: $tokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthResponseModel &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.tokens, tokens) || other.tokens == tokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, tokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthResponseModelCopyWith<_$_AuthResponseModel> get copyWith =>
      __$$_AuthResponseModelCopyWithImpl<_$_AuthResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthResponseModelToJson(
      this,
    );
  }
}

abstract class _AuthResponseModel implements AuthResponseModel {
  const factory _AuthResponseModel(
      {required final CurrentUserModel user,
      required final TokensModel tokens}) = _$_AuthResponseModel;

  factory _AuthResponseModel.fromJson(Map<String, dynamic> json) =
      _$_AuthResponseModel.fromJson;

  @override
  CurrentUserModel get user;
  @override
  TokensModel get tokens;
  @override
  @JsonKey(ignore: true)
  _$$_AuthResponseModelCopyWith<_$_AuthResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
