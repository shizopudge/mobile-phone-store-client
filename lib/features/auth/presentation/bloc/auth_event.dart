part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.initial() = _Initial;
  const factory AuthEvent.login() = _Login;
  const factory AuthEvent.loginAsGuest() = _LoginAsGuest;
  const factory AuthEvent.register() = _Register;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.changeEmail({
    required String email,
  }) = _ChangeEmail;
  const factory AuthEvent.changeUsername({
    required String username,
  }) = _ChangeUsername;
  const factory AuthEvent.changePassword({
    required String password,
  }) = _ChangePassword;
  const factory AuthEvent.dropState() = _DropState;
}
