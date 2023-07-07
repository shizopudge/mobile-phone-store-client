part of 'auth_bloc.dart';

enum AuthStatus {
  loading,
  authorized,
  unauthorized,
  guest,
  failure;

  bool get isLoading => this == AuthStatus.loading;
  bool get isAuthorized => this == AuthStatus.authorized;
  bool get isUnauthorized => this == AuthStatus.unauthorized;
  bool get isGuest => this == AuthStatus.guest;
  bool get isFailure => this == AuthStatus.failure;

  void callWhen({
    required VoidCallback? authorized,
    required VoidCallback? unauthorized,
    required VoidCallback? guest,
    required VoidCallback? failure,
  }) {
    switch (this) {
      case AuthStatus.authorized:
        authorized?.call();
      case AuthStatus.unauthorized:
        unauthorized?.call();
      case AuthStatus.guest:
        guest?.call();
      case AuthStatus.failure:
        failure?.call();
      default:
    }
  }
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState({
    CurrentUser? user,
    @Default(AuthStatus.unauthorized) AuthStatus status,
    @Default(UnknownFailure(message: 'Unauthorized')) Failure failure,
  }) = _AuthState;

  void callWhen({
    VoidCallback? authorized,
    VoidCallback? unauthorized,
    VoidCallback? guest,
    VoidCallback? failure,
  }) =>
      status.callWhen(
        authorized: authorized,
        unauthorized: unauthorized,
        guest: guest,
        failure: failure,
      );

  bool get isLoading => status.isLoading;
  bool get isAuthorized => status.isAuthorized;
  bool get isUnauthorized => status.isUnauthorized;
  bool get isGuest => status.isGuest;
  bool get isFailure => status.isFailure;
}
