part of 'login_bloc.dart';

enum LoginStatus {
  casual,
  loading,
  failure;

  bool get isCasual => this == LoginStatus.casual;
  bool get isLoading => this == LoginStatus.loading;
  bool get isFailure => this == LoginStatus.failure;
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String username,
    @Default('') String password,
    @Default(LoginValidation()) LoginValidation validation,
    @Default(LoginStatus.casual) LoginStatus status,
    @Default(UnknownFailure()) Failure failure,
  }) = _AuthPageState;
}

class LoginValidation extends Equatable {
  final bool isEmailValidated;
  final bool isUsernameValidated;
  final PasswordValidation passwordValidation;
  const LoginValidation({
    this.isEmailValidated = false,
    this.isUsernameValidated = false,
    this.passwordValidation = const PasswordValidation(),
  });

  LoginValidation copyWith({
    bool? isEmailValidated,
    bool? isUsernameValidated,
    PasswordValidation? passwordValidation,
  }) {
    return LoginValidation(
      isEmailValidated: isEmailValidated ?? this.isEmailValidated,
      isUsernameValidated: isUsernameValidated ?? this.isUsernameValidated,
      passwordValidation: passwordValidation ?? this.passwordValidation,
    );
  }

  bool _validateSignUpForm() {
    if (isEmailValidated &&
        isUsernameValidated &&
        passwordValidation.isValidated) {
      return true;
    }
    return false;
  }

  bool _validateSignInForm() {
    if (isEmailValidated) {
      return true;
    }
    return false;
  }

  bool get isSignInFormValidated => _validateSignInForm();

  bool get isSignUpFormValidated => _validateSignUpForm();

  @override
  List<Object?> get props =>
      [isEmailValidated, isUsernameValidated, passwordValidation];
}
