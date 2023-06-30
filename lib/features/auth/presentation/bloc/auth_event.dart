part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.initial() = _Initial;
  const factory AuthEvent.login() = _Login;
  const factory AuthEvent.loginAsGuest() = _LoginAsGuest;
  const factory AuthEvent.register() = _Register;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.changeEmail(
    String email,
  ) = _ChangeEmail;
  const factory AuthEvent.changeUsername(
    String username,
  ) = _ChangeUsername;
  const factory AuthEvent.changePassword(
    String password,
  ) = _ChangePassword;
  const factory AuthEvent.dropState() = _DropState;
}
