// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() login,
    required TResult Function() loginAsGuest,
    required TResult Function() register,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? login,
    TResult? Function()? loginAsGuest,
    TResult? Function()? register,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? login,
    TResult Function()? loginAsGuest,
    TResult Function()? register,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoginCopyWith<$Res> {
  factory _$$_LoginCopyWith(_$_Login value, $Res Function(_$_Login) then) =
      __$$_LoginCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_Login>
    implements _$$_LoginCopyWith<$Res> {
  __$$_LoginCopyWithImpl(_$_Login _value, $Res Function(_$_Login) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Login implements _Login {
  const _$_Login();

  @override
  String toString() {
    return 'LoginEvent.login()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Login);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() login,
    required TResult Function() loginAsGuest,
    required TResult Function() register,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
  }) {
    return login();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? login,
    TResult? Function()? loginAsGuest,
    TResult? Function()? register,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
  }) {
    return login?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? login,
    TResult Function()? loginAsGuest,
    TResult Function()? register,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements LoginEvent {
  const factory _Login() = _$_Login;
}

/// @nodoc
abstract class _$$_LoginAsGuestCopyWith<$Res> {
  factory _$$_LoginAsGuestCopyWith(
          _$_LoginAsGuest value, $Res Function(_$_LoginAsGuest) then) =
      __$$_LoginAsGuestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoginAsGuestCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_LoginAsGuest>
    implements _$$_LoginAsGuestCopyWith<$Res> {
  __$$_LoginAsGuestCopyWithImpl(
      _$_LoginAsGuest _value, $Res Function(_$_LoginAsGuest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoginAsGuest implements _LoginAsGuest {
  const _$_LoginAsGuest();

  @override
  String toString() {
    return 'LoginEvent.loginAsGuest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoginAsGuest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() login,
    required TResult Function() loginAsGuest,
    required TResult Function() register,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
  }) {
    return loginAsGuest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? login,
    TResult? Function()? loginAsGuest,
    TResult? Function()? register,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
  }) {
    return loginAsGuest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? login,
    TResult Function()? loginAsGuest,
    TResult Function()? register,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    required TResult orElse(),
  }) {
    if (loginAsGuest != null) {
      return loginAsGuest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return loginAsGuest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return loginAsGuest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (loginAsGuest != null) {
      return loginAsGuest(this);
    }
    return orElse();
  }
}

abstract class _LoginAsGuest implements LoginEvent {
  const factory _LoginAsGuest() = _$_LoginAsGuest;
}

/// @nodoc
abstract class _$$_RegisterCopyWith<$Res> {
  factory _$$_RegisterCopyWith(
          _$_Register value, $Res Function(_$_Register) then) =
      __$$_RegisterCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegisterCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_Register>
    implements _$$_RegisterCopyWith<$Res> {
  __$$_RegisterCopyWithImpl(
      _$_Register _value, $Res Function(_$_Register) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Register implements _Register {
  const _$_Register();

  @override
  String toString() {
    return 'LoginEvent.register()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Register);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() login,
    required TResult Function() loginAsGuest,
    required TResult Function() register,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
  }) {
    return register();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? login,
    TResult? Function()? loginAsGuest,
    TResult? Function()? register,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
  }) {
    return register?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? login,
    TResult Function()? loginAsGuest,
    TResult Function()? register,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements LoginEvent {
  const factory _Register() = _$_Register;
}

/// @nodoc
abstract class _$$_ChangeEmailCopyWith<$Res> {
  factory _$$_ChangeEmailCopyWith(
          _$_ChangeEmail value, $Res Function(_$_ChangeEmail) then) =
      __$$_ChangeEmailCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_ChangeEmailCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_ChangeEmail>
    implements _$$_ChangeEmailCopyWith<$Res> {
  __$$_ChangeEmailCopyWithImpl(
      _$_ChangeEmail _value, $Res Function(_$_ChangeEmail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_ChangeEmail(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeEmail implements _ChangeEmail {
  const _$_ChangeEmail(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.changeEmail(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeEmail &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeEmailCopyWith<_$_ChangeEmail> get copyWith =>
      __$$_ChangeEmailCopyWithImpl<_$_ChangeEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() login,
    required TResult Function() loginAsGuest,
    required TResult Function() register,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
  }) {
    return changeEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? login,
    TResult? Function()? loginAsGuest,
    TResult? Function()? register,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
  }) {
    return changeEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? login,
    TResult Function()? loginAsGuest,
    TResult Function()? register,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    required TResult orElse(),
  }) {
    if (changeEmail != null) {
      return changeEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return changeEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return changeEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (changeEmail != null) {
      return changeEmail(this);
    }
    return orElse();
  }
}

abstract class _ChangeEmail implements LoginEvent {
  const factory _ChangeEmail(final String email) = _$_ChangeEmail;

  String get email;
  @JsonKey(ignore: true)
  _$$_ChangeEmailCopyWith<_$_ChangeEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeUsernameCopyWith<$Res> {
  factory _$$_ChangeUsernameCopyWith(
          _$_ChangeUsername value, $Res Function(_$_ChangeUsername) then) =
      __$$_ChangeUsernameCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$_ChangeUsernameCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_ChangeUsername>
    implements _$$_ChangeUsernameCopyWith<$Res> {
  __$$_ChangeUsernameCopyWithImpl(
      _$_ChangeUsername _value, $Res Function(_$_ChangeUsername) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$_ChangeUsername(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeUsername implements _ChangeUsername {
  const _$_ChangeUsername(this.username);

  @override
  final String username;

  @override
  String toString() {
    return 'LoginEvent.changeUsername(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeUsername &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeUsernameCopyWith<_$_ChangeUsername> get copyWith =>
      __$$_ChangeUsernameCopyWithImpl<_$_ChangeUsername>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() login,
    required TResult Function() loginAsGuest,
    required TResult Function() register,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
  }) {
    return changeUsername(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? login,
    TResult? Function()? loginAsGuest,
    TResult? Function()? register,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
  }) {
    return changeUsername?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? login,
    TResult Function()? loginAsGuest,
    TResult Function()? register,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    required TResult orElse(),
  }) {
    if (changeUsername != null) {
      return changeUsername(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return changeUsername(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return changeUsername?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (changeUsername != null) {
      return changeUsername(this);
    }
    return orElse();
  }
}

abstract class _ChangeUsername implements LoginEvent {
  const factory _ChangeUsername(final String username) = _$_ChangeUsername;

  String get username;
  @JsonKey(ignore: true)
  _$$_ChangeUsernameCopyWith<_$_ChangeUsername> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangePasswordCopyWith<$Res> {
  factory _$$_ChangePasswordCopyWith(
          _$_ChangePassword value, $Res Function(_$_ChangePassword) then) =
      __$$_ChangePasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_ChangePasswordCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_ChangePassword>
    implements _$$_ChangePasswordCopyWith<$Res> {
  __$$_ChangePasswordCopyWithImpl(
      _$_ChangePassword _value, $Res Function(_$_ChangePassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_ChangePassword(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangePassword implements _ChangePassword {
  const _$_ChangePassword(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.changePassword(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePassword &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangePasswordCopyWith<_$_ChangePassword> get copyWith =>
      __$$_ChangePasswordCopyWithImpl<_$_ChangePassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() login,
    required TResult Function() loginAsGuest,
    required TResult Function() register,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
  }) {
    return changePassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? login,
    TResult? Function()? loginAsGuest,
    TResult? Function()? register,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
  }) {
    return changePassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? login,
    TResult Function()? loginAsGuest,
    TResult Function()? register,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Login value) login,
    required TResult Function(_LoginAsGuest value) loginAsGuest,
    required TResult Function(_Register value) register,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Login value)? login,
    TResult? Function(_LoginAsGuest value)? loginAsGuest,
    TResult? Function(_Register value)? register,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Login value)? login,
    TResult Function(_LoginAsGuest value)? loginAsGuest,
    TResult Function(_Register value)? register,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements LoginEvent {
  const factory _ChangePassword(final String password) = _$_ChangePassword;

  String get password;
  @JsonKey(ignore: true)
  _$$_ChangePasswordCopyWith<_$_ChangePassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoginState {
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  LoginValidation get validation => throw _privateConstructorUsedError;
  LoginStatus get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {String email,
      String username,
      String password,
      LoginValidation validation,
      LoginStatus status,
      Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? password = null,
    Object? validation = null,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as LoginValidation,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
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
abstract class _$$_AuthPageStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_AuthPageStateCopyWith(
          _$_AuthPageState value, $Res Function(_$_AuthPageState) then) =
      __$$_AuthPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String username,
      String password,
      LoginValidation validation,
      LoginStatus status,
      Failure failure});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_AuthPageStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_AuthPageState>
    implements _$$_AuthPageStateCopyWith<$Res> {
  __$$_AuthPageStateCopyWithImpl(
      _$_AuthPageState _value, $Res Function(_$_AuthPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? password = null,
    Object? validation = null,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_$_AuthPageState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as LoginValidation,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_AuthPageState implements _AuthPageState {
  const _$_AuthPageState(
      {this.email = '',
      this.username = '',
      this.password = '',
      this.validation = const LoginValidation(),
      this.status = LoginStatus.initial,
      this.failure = const CasualFailure()});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final LoginValidation validation;
  @override
  @JsonKey()
  final LoginStatus status;
  @override
  @JsonKey()
  final Failure failure;

  @override
  String toString() {
    return 'LoginState(email: $email, username: $username, password: $password, validation: $validation, status: $status, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthPageState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, email, username, password, validation, status, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthPageStateCopyWith<_$_AuthPageState> get copyWith =>
      __$$_AuthPageStateCopyWithImpl<_$_AuthPageState>(this, _$identity);
}

abstract class _AuthPageState implements LoginState {
  const factory _AuthPageState(
      {final String email,
      final String username,
      final String password,
      final LoginValidation validation,
      final LoginStatus status,
      final Failure failure}) = _$_AuthPageState;

  @override
  String get email;
  @override
  String get username;
  @override
  String get password;
  @override
  LoginValidation get validation;
  @override
  LoginStatus get status;
  @override
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_AuthPageStateCopyWith<_$_AuthPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
