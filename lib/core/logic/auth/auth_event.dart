part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.start() = _Start;
  const factory AuthEvent.setUser(CurrentUser user) = _SetUser;
  const factory AuthEvent.setState(AuthState state) = _SetState;
  const factory AuthEvent.kickUnauthorizedUser() = _KickUnauthorizedUser;
  const factory AuthEvent.logout() = _Logout;
}
