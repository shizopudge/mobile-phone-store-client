part of 'profile_edit_bloc.dart';

enum ProfileEditStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == ProfileEditStatus.loading;
  bool get isSuccess => this == ProfileEditStatus.success;
  bool get isFailure => this == ProfileEditStatus.failure;

  void callWhen({
    required VoidCallback? success,
    required VoidCallback? failure,
  }) {
    switch (this) {
      case ProfileEditStatus.success:
        success?.call();
      case ProfileEditStatus.failure:
        failure?.call();
      default:
    }
  }
}

@freezed
class ProfileEditState with _$ProfileEditState {
  const ProfileEditState._();
  const factory ProfileEditState({
    @Default('') String email,
    @Default('') String username,
    @Default('') String password,
    @Default(ProfileEditValidation()) ProfileEditValidation validation,
    @Default(ProfileEditStatus.initial) ProfileEditStatus status,
    @Default(UnknownFailure()) Failure failure,
    File? image,
    CurrentUser? currentUser,
    String? newPassword,
  }) = _ProfileEditState;

  void callWhen({
    VoidCallback? success,
    VoidCallback? failure,
  }) =>
      status.callWhen(
        success: success,
        failure: failure,
      );

  bool _isAvailable() {
    if (newPassword == null) {
      if ((username != currentUser?.username ||
              email != currentUser?.email ||
              image != null) &&
          validation.isValidatedWithoutPass) {
        return true;
      }
      return false;
    } else if ((username != currentUser?.username ||
            email != currentUser?.email ||
            image != null ||
            newPassword != null) &&
        validation.isValidatedWithPass) {
      return true;
    }
    return false;
  }

  bool get isAvailable => _isAvailable();

  bool get isLoading => status.isLoading;
  bool get isSuccess => status.isSuccess;
  bool get isFailure => status.isFailure;
}

class ProfileEditValidation extends Equatable {
  final bool isEmailValidated;
  final bool isUsernameValidated;
  final PasswordValidation passwordValidation;
  const ProfileEditValidation({
    this.isEmailValidated = true,
    this.isUsernameValidated = true,
    this.passwordValidation = const PasswordValidation(),
  });

  ProfileEditValidation copyWith({
    bool? isEmailValidated,
    bool? isUsernameValidated,
    PasswordValidation? passwordValidation,
  }) {
    return ProfileEditValidation(
      isEmailValidated: isEmailValidated ?? this.isEmailValidated,
      isUsernameValidated: isUsernameValidated ?? this.isUsernameValidated,
      passwordValidation: passwordValidation ?? this.passwordValidation,
    );
  }

  bool _validateWithoutPass() {
    if (isEmailValidated && isUsernameValidated) {
      return true;
    }
    return false;
  }

  bool _validateWithPass() {
    if (isEmailValidated &&
        isUsernameValidated &&
        passwordValidation.isValidated) {
      return true;
    }
    return false;
  }

  bool get isValidatedWithoutPass => _validateWithoutPass();

  bool get isValidatedWithPass => _validateWithPass();

  @override
  List<Object?> get props =>
      [isEmailValidated, isUsernameValidated, passwordValidation];
}
