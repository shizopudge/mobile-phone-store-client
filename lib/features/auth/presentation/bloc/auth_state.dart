part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  authorized,
  notAuthorized,
  guest,
  failure;

  bool get isInitial => this == AuthStatus.initial;
  bool get isLoading => this == AuthStatus.loading;
  bool get isAuthorized => this == AuthStatus.authorized;
  bool get isNotAuthorized => this == AuthStatus.notAuthorized;
  bool get isGuest => this == AuthStatus.guest;
  bool get isFailure => this == AuthStatus.failure;

  void when({
    VoidCallback? authorized,
    VoidCallback? notAuthorized,
    VoidCallback? guest,
    VoidCallback? failure,
  }) {
    switch (this) {
      case AuthStatus.authorized:
        authorized?.call();
      case AuthStatus.notAuthorized:
        notAuthorized?.call();
      case AuthStatus.guest:
        guest?.call();
      case AuthStatus.failure:
        failure?.call();
      default:
        null;
    }
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default('') String email,
    @Default('') String username,
    @Default('') String password,
    @Default(AuthValidation()) AuthValidation validation,
    CurrentUser? currentUser,
    @Default(AuthStatus.initial) AuthStatus status,
    @Default(UnknownFailure()) Failure failure,
  }) = _AuthState;
}

class AuthValidation extends Equatable {
  final bool isEmailValidated;
  final bool isUsernameValidated;
  final PasswordValidation passwordValidation;
  const AuthValidation({
    this.isEmailValidated = false,
    this.isUsernameValidated = false,
    this.passwordValidation = const PasswordValidation(),
  });

  AuthValidation copyWith({
    bool? isEmailValidated,
    bool? isUsernameValidated,
    PasswordValidation? passwordValidation,
  }) {
    return AuthValidation(
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
  List<Object?> get props => [isEmailValidated, isUsernameValidated];
}

class PasswordValidation extends Equatable {
  final bool isPassHasUpperCaseLetter;
  final bool isPassHasLowerCaseLetter;
  final bool isPassLongEnough;
  const PasswordValidation({
    this.isPassHasUpperCaseLetter = false,
    this.isPassHasLowerCaseLetter = false,
    this.isPassLongEnough = false,
  });

  PasswordValidation copyWith({
    bool? isPassHasUpperCaseLetter,
    bool? isPassHasLowerCaseLetter,
    bool? isPassLongEnough,
  }) {
    return PasswordValidation(
      isPassHasUpperCaseLetter:
          isPassHasUpperCaseLetter ?? this.isPassHasUpperCaseLetter,
      isPassHasLowerCaseLetter:
          isPassHasLowerCaseLetter ?? this.isPassHasLowerCaseLetter,
      isPassLongEnough: isPassLongEnough ?? this.isPassLongEnough,
    );
  }

  bool _validate() {
    if (isPassHasUpperCaseLetter &&
        isPassHasLowerCaseLetter &&
        isPassLongEnough) {
      return true;
    }
    return false;
  }

  bool get isValidated => _validate();

  @override
  List<Object?> get props =>
      [isPassHasUpperCaseLetter, isPassHasLowerCaseLetter, isPassLongEnough];
}
