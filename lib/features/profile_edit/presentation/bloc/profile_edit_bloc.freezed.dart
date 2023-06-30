// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEditEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrentUser currentUser) initial,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
    required TResult Function(String newPassword) changeNewPassword,
    required TResult Function() toggleEditPassword,
    required TResult Function() editProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrentUser currentUser)? initial,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
    TResult? Function(String newPassword)? changeNewPassword,
    TResult? Function()? toggleEditPassword,
    TResult? Function()? editProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrentUser currentUser)? initial,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    TResult Function(String newPassword)? changeNewPassword,
    TResult Function()? toggleEditPassword,
    TResult Function()? editProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_ChangeNewPassword value) changeNewPassword,
    required TResult Function(_ToggleEditPassword value) toggleEditPassword,
    required TResult Function(_EditProfile value) editProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_ChangeNewPassword value)? changeNewPassword,
    TResult? Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult? Function(_EditProfile value)? editProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_ChangeNewPassword value)? changeNewPassword,
    TResult Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult Function(_EditProfile value)? editProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditEventCopyWith<$Res> {
  factory $ProfileEditEventCopyWith(
          ProfileEditEvent value, $Res Function(ProfileEditEvent) then) =
      _$ProfileEditEventCopyWithImpl<$Res, ProfileEditEvent>;
}

/// @nodoc
class _$ProfileEditEventCopyWithImpl<$Res, $Val extends ProfileEditEvent>
    implements $ProfileEditEventCopyWith<$Res> {
  _$ProfileEditEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({CurrentUser currentUser});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUser = null,
  }) {
    return _then(_$_Initial(
      null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as CurrentUser,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(this.currentUser);

  @override
  final CurrentUser currentUser;

  @override
  String toString() {
    return 'ProfileEditEvent.initial(currentUser: $currentUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrentUser currentUser) initial,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
    required TResult Function(String newPassword) changeNewPassword,
    required TResult Function() toggleEditPassword,
    required TResult Function() editProfile,
  }) {
    return initial(currentUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrentUser currentUser)? initial,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
    TResult? Function(String newPassword)? changeNewPassword,
    TResult? Function()? toggleEditPassword,
    TResult? Function()? editProfile,
  }) {
    return initial?.call(currentUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrentUser currentUser)? initial,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    TResult Function(String newPassword)? changeNewPassword,
    TResult Function()? toggleEditPassword,
    TResult Function()? editProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(currentUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_ChangeNewPassword value) changeNewPassword,
    required TResult Function(_ToggleEditPassword value) toggleEditPassword,
    required TResult Function(_EditProfile value) editProfile,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_ChangeNewPassword value)? changeNewPassword,
    TResult? Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult? Function(_EditProfile value)? editProfile,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_ChangeNewPassword value)? changeNewPassword,
    TResult Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult Function(_EditProfile value)? editProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProfileEditEvent {
  const factory _Initial(final CurrentUser currentUser) = _$_Initial;

  CurrentUser get currentUser;
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$ProfileEditEventCopyWithImpl<$Res, _$_ChangeEmail>
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
    return 'ProfileEditEvent.changeEmail(email: $email)';
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
    required TResult Function(CurrentUser currentUser) initial,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
    required TResult Function(String newPassword) changeNewPassword,
    required TResult Function() toggleEditPassword,
    required TResult Function() editProfile,
  }) {
    return changeEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrentUser currentUser)? initial,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
    TResult? Function(String newPassword)? changeNewPassword,
    TResult? Function()? toggleEditPassword,
    TResult? Function()? editProfile,
  }) {
    return changeEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrentUser currentUser)? initial,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    TResult Function(String newPassword)? changeNewPassword,
    TResult Function()? toggleEditPassword,
    TResult Function()? editProfile,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_ChangeNewPassword value) changeNewPassword,
    required TResult Function(_ToggleEditPassword value) toggleEditPassword,
    required TResult Function(_EditProfile value) editProfile,
  }) {
    return changeEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_ChangeNewPassword value)? changeNewPassword,
    TResult? Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult? Function(_EditProfile value)? editProfile,
  }) {
    return changeEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_ChangeNewPassword value)? changeNewPassword,
    TResult Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult Function(_EditProfile value)? editProfile,
    required TResult orElse(),
  }) {
    if (changeEmail != null) {
      return changeEmail(this);
    }
    return orElse();
  }
}

abstract class _ChangeEmail implements ProfileEditEvent {
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
    extends _$ProfileEditEventCopyWithImpl<$Res, _$_ChangeUsername>
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
    return 'ProfileEditEvent.changeUsername(username: $username)';
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
    required TResult Function(CurrentUser currentUser) initial,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
    required TResult Function(String newPassword) changeNewPassword,
    required TResult Function() toggleEditPassword,
    required TResult Function() editProfile,
  }) {
    return changeUsername(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrentUser currentUser)? initial,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
    TResult? Function(String newPassword)? changeNewPassword,
    TResult? Function()? toggleEditPassword,
    TResult? Function()? editProfile,
  }) {
    return changeUsername?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrentUser currentUser)? initial,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    TResult Function(String newPassword)? changeNewPassword,
    TResult Function()? toggleEditPassword,
    TResult Function()? editProfile,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_ChangeNewPassword value) changeNewPassword,
    required TResult Function(_ToggleEditPassword value) toggleEditPassword,
    required TResult Function(_EditProfile value) editProfile,
  }) {
    return changeUsername(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_ChangeNewPassword value)? changeNewPassword,
    TResult? Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult? Function(_EditProfile value)? editProfile,
  }) {
    return changeUsername?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_ChangeNewPassword value)? changeNewPassword,
    TResult Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult Function(_EditProfile value)? editProfile,
    required TResult orElse(),
  }) {
    if (changeUsername != null) {
      return changeUsername(this);
    }
    return orElse();
  }
}

abstract class _ChangeUsername implements ProfileEditEvent {
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
    extends _$ProfileEditEventCopyWithImpl<$Res, _$_ChangePassword>
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
    return 'ProfileEditEvent.changePassword(password: $password)';
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
    required TResult Function(CurrentUser currentUser) initial,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
    required TResult Function(String newPassword) changeNewPassword,
    required TResult Function() toggleEditPassword,
    required TResult Function() editProfile,
  }) {
    return changePassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrentUser currentUser)? initial,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
    TResult? Function(String newPassword)? changeNewPassword,
    TResult? Function()? toggleEditPassword,
    TResult? Function()? editProfile,
  }) {
    return changePassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrentUser currentUser)? initial,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    TResult Function(String newPassword)? changeNewPassword,
    TResult Function()? toggleEditPassword,
    TResult Function()? editProfile,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_ChangeNewPassword value) changeNewPassword,
    required TResult Function(_ToggleEditPassword value) toggleEditPassword,
    required TResult Function(_EditProfile value) editProfile,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_ChangeNewPassword value)? changeNewPassword,
    TResult? Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult? Function(_EditProfile value)? editProfile,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_ChangeNewPassword value)? changeNewPassword,
    TResult Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult Function(_EditProfile value)? editProfile,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements ProfileEditEvent {
  const factory _ChangePassword(final String password) = _$_ChangePassword;

  String get password;
  @JsonKey(ignore: true)
  _$$_ChangePasswordCopyWith<_$_ChangePassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ChangeNewPasswordCopyWith<$Res> {
  factory _$$_ChangeNewPasswordCopyWith(_$_ChangeNewPassword value,
          $Res Function(_$_ChangeNewPassword) then) =
      __$$_ChangeNewPasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String newPassword});
}

/// @nodoc
class __$$_ChangeNewPasswordCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$_ChangeNewPassword>
    implements _$$_ChangeNewPasswordCopyWith<$Res> {
  __$$_ChangeNewPasswordCopyWithImpl(
      _$_ChangeNewPassword _value, $Res Function(_$_ChangeNewPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
  }) {
    return _then(_$_ChangeNewPassword(
      null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChangeNewPassword implements _ChangeNewPassword {
  const _$_ChangeNewPassword(this.newPassword);

  @override
  final String newPassword;

  @override
  String toString() {
    return 'ProfileEditEvent.changeNewPassword(newPassword: $newPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeNewPassword &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeNewPasswordCopyWith<_$_ChangeNewPassword> get copyWith =>
      __$$_ChangeNewPasswordCopyWithImpl<_$_ChangeNewPassword>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrentUser currentUser) initial,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
    required TResult Function(String newPassword) changeNewPassword,
    required TResult Function() toggleEditPassword,
    required TResult Function() editProfile,
  }) {
    return changeNewPassword(newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrentUser currentUser)? initial,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
    TResult? Function(String newPassword)? changeNewPassword,
    TResult? Function()? toggleEditPassword,
    TResult? Function()? editProfile,
  }) {
    return changeNewPassword?.call(newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrentUser currentUser)? initial,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    TResult Function(String newPassword)? changeNewPassword,
    TResult Function()? toggleEditPassword,
    TResult Function()? editProfile,
    required TResult orElse(),
  }) {
    if (changeNewPassword != null) {
      return changeNewPassword(newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_ChangeNewPassword value) changeNewPassword,
    required TResult Function(_ToggleEditPassword value) toggleEditPassword,
    required TResult Function(_EditProfile value) editProfile,
  }) {
    return changeNewPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_ChangeNewPassword value)? changeNewPassword,
    TResult? Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult? Function(_EditProfile value)? editProfile,
  }) {
    return changeNewPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_ChangeNewPassword value)? changeNewPassword,
    TResult Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult Function(_EditProfile value)? editProfile,
    required TResult orElse(),
  }) {
    if (changeNewPassword != null) {
      return changeNewPassword(this);
    }
    return orElse();
  }
}

abstract class _ChangeNewPassword implements ProfileEditEvent {
  const factory _ChangeNewPassword(final String newPassword) =
      _$_ChangeNewPassword;

  String get newPassword;
  @JsonKey(ignore: true)
  _$$_ChangeNewPasswordCopyWith<_$_ChangeNewPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ToggleEditPasswordCopyWith<$Res> {
  factory _$$_ToggleEditPasswordCopyWith(_$_ToggleEditPassword value,
          $Res Function(_$_ToggleEditPassword) then) =
      __$$_ToggleEditPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ToggleEditPasswordCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$_ToggleEditPassword>
    implements _$$_ToggleEditPasswordCopyWith<$Res> {
  __$$_ToggleEditPasswordCopyWithImpl(
      _$_ToggleEditPassword _value, $Res Function(_$_ToggleEditPassword) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ToggleEditPassword implements _ToggleEditPassword {
  const _$_ToggleEditPassword();

  @override
  String toString() {
    return 'ProfileEditEvent.toggleEditPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ToggleEditPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrentUser currentUser) initial,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
    required TResult Function(String newPassword) changeNewPassword,
    required TResult Function() toggleEditPassword,
    required TResult Function() editProfile,
  }) {
    return toggleEditPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrentUser currentUser)? initial,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
    TResult? Function(String newPassword)? changeNewPassword,
    TResult? Function()? toggleEditPassword,
    TResult? Function()? editProfile,
  }) {
    return toggleEditPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrentUser currentUser)? initial,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    TResult Function(String newPassword)? changeNewPassword,
    TResult Function()? toggleEditPassword,
    TResult Function()? editProfile,
    required TResult orElse(),
  }) {
    if (toggleEditPassword != null) {
      return toggleEditPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_ChangeNewPassword value) changeNewPassword,
    required TResult Function(_ToggleEditPassword value) toggleEditPassword,
    required TResult Function(_EditProfile value) editProfile,
  }) {
    return toggleEditPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_ChangeNewPassword value)? changeNewPassword,
    TResult? Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult? Function(_EditProfile value)? editProfile,
  }) {
    return toggleEditPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_ChangeNewPassword value)? changeNewPassword,
    TResult Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult Function(_EditProfile value)? editProfile,
    required TResult orElse(),
  }) {
    if (toggleEditPassword != null) {
      return toggleEditPassword(this);
    }
    return orElse();
  }
}

abstract class _ToggleEditPassword implements ProfileEditEvent {
  const factory _ToggleEditPassword() = _$_ToggleEditPassword;
}

/// @nodoc
abstract class _$$_EditProfileCopyWith<$Res> {
  factory _$$_EditProfileCopyWith(
          _$_EditProfile value, $Res Function(_$_EditProfile) then) =
      __$$_EditProfileCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EditProfileCopyWithImpl<$Res>
    extends _$ProfileEditEventCopyWithImpl<$Res, _$_EditProfile>
    implements _$$_EditProfileCopyWith<$Res> {
  __$$_EditProfileCopyWithImpl(
      _$_EditProfile _value, $Res Function(_$_EditProfile) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EditProfile implements _EditProfile {
  const _$_EditProfile();

  @override
  String toString() {
    return 'ProfileEditEvent.editProfile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EditProfile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrentUser currentUser) initial,
    required TResult Function(String email) changeEmail,
    required TResult Function(String username) changeUsername,
    required TResult Function(String password) changePassword,
    required TResult Function(String newPassword) changeNewPassword,
    required TResult Function() toggleEditPassword,
    required TResult Function() editProfile,
  }) {
    return editProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrentUser currentUser)? initial,
    TResult? Function(String email)? changeEmail,
    TResult? Function(String username)? changeUsername,
    TResult? Function(String password)? changePassword,
    TResult? Function(String newPassword)? changeNewPassword,
    TResult? Function()? toggleEditPassword,
    TResult? Function()? editProfile,
  }) {
    return editProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrentUser currentUser)? initial,
    TResult Function(String email)? changeEmail,
    TResult Function(String username)? changeUsername,
    TResult Function(String password)? changePassword,
    TResult Function(String newPassword)? changeNewPassword,
    TResult Function()? toggleEditPassword,
    TResult Function()? editProfile,
    required TResult orElse(),
  }) {
    if (editProfile != null) {
      return editProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ChangeEmail value) changeEmail,
    required TResult Function(_ChangeUsername value) changeUsername,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_ChangeNewPassword value) changeNewPassword,
    required TResult Function(_ToggleEditPassword value) toggleEditPassword,
    required TResult Function(_EditProfile value) editProfile,
  }) {
    return editProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ChangeEmail value)? changeEmail,
    TResult? Function(_ChangeUsername value)? changeUsername,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_ChangeNewPassword value)? changeNewPassword,
    TResult? Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult? Function(_EditProfile value)? editProfile,
  }) {
    return editProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ChangeEmail value)? changeEmail,
    TResult Function(_ChangeUsername value)? changeUsername,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_ChangeNewPassword value)? changeNewPassword,
    TResult Function(_ToggleEditPassword value)? toggleEditPassword,
    TResult Function(_EditProfile value)? editProfile,
    required TResult orElse(),
  }) {
    if (editProfile != null) {
      return editProfile(this);
    }
    return orElse();
  }
}

abstract class _EditProfile implements ProfileEditEvent {
  const factory _EditProfile() = _$_EditProfile;
}

/// @nodoc
mixin _$ProfileEditState {
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  bool get isEdited => throw _privateConstructorUsedError;
  bool get isEditPassword => throw _privateConstructorUsedError;
  ProfileEditValidation get validation => throw _privateConstructorUsedError;
  ProfileEditStatus get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;
  File? get image => throw _privateConstructorUsedError;
  CurrentUser? get currentUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEditStateCopyWith<ProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditStateCopyWith(
          ProfileEditState value, $Res Function(ProfileEditState) then) =
      _$ProfileEditStateCopyWithImpl<$Res, ProfileEditState>;
  @useResult
  $Res call(
      {String email,
      String username,
      String password,
      String newPassword,
      bool isEdited,
      bool isEditPassword,
      ProfileEditValidation validation,
      ProfileEditStatus status,
      Failure failure,
      File? image,
      CurrentUser? currentUser});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$ProfileEditStateCopyWithImpl<$Res, $Val extends ProfileEditState>
    implements $ProfileEditStateCopyWith<$Res> {
  _$ProfileEditStateCopyWithImpl(this._value, this._then);

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
    Object? newPassword = null,
    Object? isEdited = null,
    Object? isEditPassword = null,
    Object? validation = null,
    Object? status = null,
    Object? failure = null,
    Object? image = freezed,
    Object? currentUser = freezed,
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
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditPassword: null == isEditPassword
          ? _value.isEditPassword
          : isEditPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ProfileEditValidation,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileEditStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as CurrentUser?,
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
abstract class _$$_ProfileEditStateCopyWith<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  factory _$$_ProfileEditStateCopyWith(
          _$_ProfileEditState value, $Res Function(_$_ProfileEditState) then) =
      __$$_ProfileEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String username,
      String password,
      String newPassword,
      bool isEdited,
      bool isEditPassword,
      ProfileEditValidation validation,
      ProfileEditStatus status,
      Failure failure,
      File? image,
      CurrentUser? currentUser});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_ProfileEditStateCopyWithImpl<$Res>
    extends _$ProfileEditStateCopyWithImpl<$Res, _$_ProfileEditState>
    implements _$$_ProfileEditStateCopyWith<$Res> {
  __$$_ProfileEditStateCopyWithImpl(
      _$_ProfileEditState _value, $Res Function(_$_ProfileEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? password = null,
    Object? newPassword = null,
    Object? isEdited = null,
    Object? isEditPassword = null,
    Object? validation = null,
    Object? status = null,
    Object? failure = null,
    Object? image = freezed,
    Object? currentUser = freezed,
  }) {
    return _then(_$_ProfileEditState(
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
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isEdited: null == isEdited
          ? _value.isEdited
          : isEdited // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditPassword: null == isEditPassword
          ? _value.isEditPassword
          : isEditPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      validation: null == validation
          ? _value.validation
          : validation // ignore: cast_nullable_to_non_nullable
              as ProfileEditValidation,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileEditStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as CurrentUser?,
    ));
  }
}

/// @nodoc

class _$_ProfileEditState implements _ProfileEditState {
  const _$_ProfileEditState(
      {this.email = '',
      this.username = '',
      this.password = '',
      this.newPassword = '',
      this.isEdited = false,
      this.isEditPassword = false,
      this.validation = const ProfileEditValidation(),
      this.status = ProfileEditStatus.initial,
      this.failure = const UnknownFailure(),
      this.image,
      this.currentUser});

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
  final String newPassword;
  @override
  @JsonKey()
  final bool isEdited;
  @override
  @JsonKey()
  final bool isEditPassword;
  @override
  @JsonKey()
  final ProfileEditValidation validation;
  @override
  @JsonKey()
  final ProfileEditStatus status;
  @override
  @JsonKey()
  final Failure failure;
  @override
  final File? image;
  @override
  final CurrentUser? currentUser;

  @override
  String toString() {
    return 'ProfileEditState(email: $email, username: $username, password: $password, newPassword: $newPassword, isEdited: $isEdited, isEditPassword: $isEditPassword, validation: $validation, status: $status, failure: $failure, image: $image, currentUser: $currentUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileEditState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.isEdited, isEdited) ||
                other.isEdited == isEdited) &&
            (identical(other.isEditPassword, isEditPassword) ||
                other.isEditPassword == isEditPassword) &&
            (identical(other.validation, validation) ||
                other.validation == validation) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      username,
      password,
      newPassword,
      isEdited,
      isEditPassword,
      validation,
      status,
      failure,
      image,
      currentUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileEditStateCopyWith<_$_ProfileEditState> get copyWith =>
      __$$_ProfileEditStateCopyWithImpl<_$_ProfileEditState>(this, _$identity);
}

abstract class _ProfileEditState implements ProfileEditState {
  const factory _ProfileEditState(
      {final String email,
      final String username,
      final String password,
      final String newPassword,
      final bool isEdited,
      final bool isEditPassword,
      final ProfileEditValidation validation,
      final ProfileEditStatus status,
      final Failure failure,
      final File? image,
      final CurrentUser? currentUser}) = _$_ProfileEditState;

  @override
  String get email;
  @override
  String get username;
  @override
  String get password;
  @override
  String get newPassword;
  @override
  bool get isEdited;
  @override
  bool get isEditPassword;
  @override
  ProfileEditValidation get validation;
  @override
  ProfileEditStatus get status;
  @override
  Failure get failure;
  @override
  File? get image;
  @override
  CurrentUser? get currentUser;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileEditStateCopyWith<_$_ProfileEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
