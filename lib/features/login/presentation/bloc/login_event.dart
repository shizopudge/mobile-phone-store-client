part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.login() = _Login;
  const factory LoginEvent.loginAsGuest() = _LoginAsGuest;
  const factory LoginEvent.register() = _Register;
  const factory LoginEvent.changeEmail(
    String email,
  ) = _ChangeEmail;
  const factory LoginEvent.changeUsername(
    String username,
  ) = _ChangeUsername;
  const factory LoginEvent.changePassword(
    String password,
  ) = _ChangePassword;
}
