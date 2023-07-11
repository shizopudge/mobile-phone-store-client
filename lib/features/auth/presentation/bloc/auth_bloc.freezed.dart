// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(CurrentUser? user) setUser,
    required TResult Function(AuthState state) setState,
    required TResult Function() kickUnauthorizedUser,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(CurrentUser? user)? setUser,
    TResult? Function(AuthState state)? setState,
    TResult? Function()? kickUnauthorizedUser,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(CurrentUser? user)? setUser,
    TResult Function(AuthState state)? setState,
    TResult Function()? kickUnauthorizedUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_SetUser value) setUser,
    required TResult Function(_SetState value) setState,
    required TResult Function(_KickUnauthorizedUser value) kickUnauthorizedUser,
    required TResult Function(_Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_SetUser value)? setUser,
    TResult? Function(_SetState value)? setState,
    TResult? Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult? Function(_Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_SetUser value)? setUser,
    TResult Function(_SetState value)? setState,
    TResult Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartCopyWith<$Res> {
  factory _$$_StartCopyWith(_$_Start value, $Res Function(_$_Start) then) =
      __$$_StartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_Start>
    implements _$$_StartCopyWith<$Res> {
  __$$_StartCopyWithImpl(_$_Start _value, $Res Function(_$_Start) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Start implements _Start {
  const _$_Start();

  @override
  String toString() {
    return 'AuthEvent.start()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Start);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(CurrentUser? user) setUser,
    required TResult Function(AuthState state) setState,
    required TResult Function() kickUnauthorizedUser,
    required TResult Function() logout,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(CurrentUser? user)? setUser,
    TResult? Function(AuthState state)? setState,
    TResult? Function()? kickUnauthorizedUser,
    TResult? Function()? logout,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(CurrentUser? user)? setUser,
    TResult Function(AuthState state)? setState,
    TResult Function()? kickUnauthorizedUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_SetUser value) setUser,
    required TResult Function(_SetState value) setState,
    required TResult Function(_KickUnauthorizedUser value) kickUnauthorizedUser,
    required TResult Function(_Logout value) logout,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_SetUser value)? setUser,
    TResult? Function(_SetState value)? setState,
    TResult? Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult? Function(_Logout value)? logout,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_SetUser value)? setUser,
    TResult Function(_SetState value)? setState,
    TResult Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _Start implements AuthEvent {
  const factory _Start() = _$_Start;
}

/// @nodoc
abstract class _$$_SetUserCopyWith<$Res> {
  factory _$$_SetUserCopyWith(
          _$_SetUser value, $Res Function(_$_SetUser) then) =
      __$$_SetUserCopyWithImpl<$Res>;
  @useResult
  $Res call({CurrentUser? user});
}

/// @nodoc
class __$$_SetUserCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SetUser>
    implements _$$_SetUserCopyWith<$Res> {
  __$$_SetUserCopyWithImpl(_$_SetUser _value, $Res Function(_$_SetUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_SetUser(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CurrentUser?,
    ));
  }
}

/// @nodoc

class _$_SetUser implements _SetUser {
  const _$_SetUser(this.user);

  @override
  final CurrentUser? user;

  @override
  String toString() {
    return 'AuthEvent.setUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetUser &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetUserCopyWith<_$_SetUser> get copyWith =>
      __$$_SetUserCopyWithImpl<_$_SetUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(CurrentUser? user) setUser,
    required TResult Function(AuthState state) setState,
    required TResult Function() kickUnauthorizedUser,
    required TResult Function() logout,
  }) {
    return setUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(CurrentUser? user)? setUser,
    TResult? Function(AuthState state)? setState,
    TResult? Function()? kickUnauthorizedUser,
    TResult? Function()? logout,
  }) {
    return setUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(CurrentUser? user)? setUser,
    TResult Function(AuthState state)? setState,
    TResult Function()? kickUnauthorizedUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (setUser != null) {
      return setUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_SetUser value) setUser,
    required TResult Function(_SetState value) setState,
    required TResult Function(_KickUnauthorizedUser value) kickUnauthorizedUser,
    required TResult Function(_Logout value) logout,
  }) {
    return setUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_SetUser value)? setUser,
    TResult? Function(_SetState value)? setState,
    TResult? Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult? Function(_Logout value)? logout,
  }) {
    return setUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_SetUser value)? setUser,
    TResult Function(_SetState value)? setState,
    TResult Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (setUser != null) {
      return setUser(this);
    }
    return orElse();
  }
}

abstract class _SetUser implements AuthEvent {
  const factory _SetUser(final CurrentUser? user) = _$_SetUser;

  CurrentUser? get user;
  @JsonKey(ignore: true)
  _$$_SetUserCopyWith<_$_SetUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetStateCopyWith<$Res> {
  factory _$$_SetStateCopyWith(
          _$_SetState value, $Res Function(_$_SetState) then) =
      __$$_SetStateCopyWithImpl<$Res>;
  @useResult
  $Res call({AuthState state});

  $AuthStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$_SetStateCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SetState>
    implements _$$_SetStateCopyWith<$Res> {
  __$$_SetStateCopyWithImpl(
      _$_SetState _value, $Res Function(_$_SetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$_SetState(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AuthState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthStateCopyWith<$Res> get state {
    return $AuthStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$_SetState implements _SetState {
  const _$_SetState(this.state);

  @override
  final AuthState state;

  @override
  String toString() {
    return 'AuthEvent.setState(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetState &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetStateCopyWith<_$_SetState> get copyWith =>
      __$$_SetStateCopyWithImpl<_$_SetState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(CurrentUser? user) setUser,
    required TResult Function(AuthState state) setState,
    required TResult Function() kickUnauthorizedUser,
    required TResult Function() logout,
  }) {
    return setState(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(CurrentUser? user)? setUser,
    TResult? Function(AuthState state)? setState,
    TResult? Function()? kickUnauthorizedUser,
    TResult? Function()? logout,
  }) {
    return setState?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(CurrentUser? user)? setUser,
    TResult Function(AuthState state)? setState,
    TResult Function()? kickUnauthorizedUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (setState != null) {
      return setState(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_SetUser value) setUser,
    required TResult Function(_SetState value) setState,
    required TResult Function(_KickUnauthorizedUser value) kickUnauthorizedUser,
    required TResult Function(_Logout value) logout,
  }) {
    return setState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_SetUser value)? setUser,
    TResult? Function(_SetState value)? setState,
    TResult? Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult? Function(_Logout value)? logout,
  }) {
    return setState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_SetUser value)? setUser,
    TResult Function(_SetState value)? setState,
    TResult Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (setState != null) {
      return setState(this);
    }
    return orElse();
  }
}

abstract class _SetState implements AuthEvent {
  const factory _SetState(final AuthState state) = _$_SetState;

  AuthState get state;
  @JsonKey(ignore: true)
  _$$_SetStateCopyWith<_$_SetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_KickUnauthorizedUserCopyWith<$Res> {
  factory _$$_KickUnauthorizedUserCopyWith(_$_KickUnauthorizedUser value,
          $Res Function(_$_KickUnauthorizedUser) then) =
      __$$_KickUnauthorizedUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_KickUnauthorizedUserCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_KickUnauthorizedUser>
    implements _$$_KickUnauthorizedUserCopyWith<$Res> {
  __$$_KickUnauthorizedUserCopyWithImpl(_$_KickUnauthorizedUser _value,
      $Res Function(_$_KickUnauthorizedUser) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_KickUnauthorizedUser implements _KickUnauthorizedUser {
  const _$_KickUnauthorizedUser();

  @override
  String toString() {
    return 'AuthEvent.kickUnauthorizedUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_KickUnauthorizedUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(CurrentUser? user) setUser,
    required TResult Function(AuthState state) setState,
    required TResult Function() kickUnauthorizedUser,
    required TResult Function() logout,
  }) {
    return kickUnauthorizedUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(CurrentUser? user)? setUser,
    TResult? Function(AuthState state)? setState,
    TResult? Function()? kickUnauthorizedUser,
    TResult? Function()? logout,
  }) {
    return kickUnauthorizedUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(CurrentUser? user)? setUser,
    TResult Function(AuthState state)? setState,
    TResult Function()? kickUnauthorizedUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (kickUnauthorizedUser != null) {
      return kickUnauthorizedUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_SetUser value) setUser,
    required TResult Function(_SetState value) setState,
    required TResult Function(_KickUnauthorizedUser value) kickUnauthorizedUser,
    required TResult Function(_Logout value) logout,
  }) {
    return kickUnauthorizedUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_SetUser value)? setUser,
    TResult? Function(_SetState value)? setState,
    TResult? Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult? Function(_Logout value)? logout,
  }) {
    return kickUnauthorizedUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_SetUser value)? setUser,
    TResult Function(_SetState value)? setState,
    TResult Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (kickUnauthorizedUser != null) {
      return kickUnauthorizedUser(this);
    }
    return orElse();
  }
}

abstract class _KickUnauthorizedUser implements AuthEvent {
  const factory _KickUnauthorizedUser() = _$_KickUnauthorizedUser;
}

/// @nodoc
abstract class _$$_LogoutCopyWith<$Res> {
  factory _$$_LogoutCopyWith(_$_Logout value, $Res Function(_$_Logout) then) =
      __$$_LogoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogoutCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_Logout>
    implements _$$_LogoutCopyWith<$Res> {
  __$$_LogoutCopyWithImpl(_$_Logout _value, $Res Function(_$_Logout) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Logout implements _Logout {
  const _$_Logout();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Logout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(CurrentUser? user) setUser,
    required TResult Function(AuthState state) setState,
    required TResult Function() kickUnauthorizedUser,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(CurrentUser? user)? setUser,
    TResult? Function(AuthState state)? setState,
    TResult? Function()? kickUnauthorizedUser,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(CurrentUser? user)? setUser,
    TResult Function(AuthState state)? setState,
    TResult Function()? kickUnauthorizedUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Start value) start,
    required TResult Function(_SetUser value) setUser,
    required TResult Function(_SetState value) setState,
    required TResult Function(_KickUnauthorizedUser value) kickUnauthorizedUser,
    required TResult Function(_Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Start value)? start,
    TResult? Function(_SetUser value)? setUser,
    TResult? Function(_SetState value)? setState,
    TResult? Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult? Function(_Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Start value)? start,
    TResult Function(_SetUser value)? setUser,
    TResult Function(_SetState value)? setState,
    TResult Function(_KickUnauthorizedUser value)? kickUnauthorizedUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$_Logout;
}

/// @nodoc
mixin _$AuthState {
  CurrentUser? get user => throw _privateConstructorUsedError;
  AuthStatus get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({CurrentUser? user, AuthStatus status, Failure failure});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CurrentUser?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
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
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CurrentUser? user, AuthStatus status, Failure failure});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? status = null,
    Object? failure = null,
  }) {
    return _then(_$_AuthState(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CurrentUser?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_AuthState extends _AuthState {
  const _$_AuthState(
      {this.user,
      this.status = AuthStatus.unauthorized,
      this.failure = const CasualFailure(message: 'Unauthorized')})
      : super._();

  @override
  final CurrentUser? user;
  @override
  @JsonKey()
  final AuthStatus status;
  @override
  @JsonKey()
  final Failure failure;

  @override
  String toString() {
    return 'AuthState(user: $user, status: $status, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, status, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {final CurrentUser? user,
      final AuthStatus status,
      final Failure failure}) = _$_AuthState;
  const _AuthState._() : super._();

  @override
  CurrentUser? get user;
  @override
  AuthStatus get status;
  @override
  Failure get failure;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
