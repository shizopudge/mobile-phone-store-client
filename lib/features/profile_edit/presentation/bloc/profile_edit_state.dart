part of 'profile_edit_bloc.dart';

enum ProfileEditStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == ProfileEditStatus.initial;
  bool get isLoading => this == ProfileEditStatus.loading;
  bool get isSuccess => this == ProfileEditStatus.success;
  bool get isFailure => this == ProfileEditStatus.failure;
}

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    @Default('') String email,
    @Default('') String username,
    @Default('') String password,
    @Default('') String newPassword,
    @Default(false) bool isEdited,
    @Default(false) bool isEditPassword,
    @Default(ProfileEditValidation()) ProfileEditValidation validation,
    @Default(ProfileEditStatus.initial) ProfileEditStatus status,
    @Default(UnknownFailure()) Failure failure,
    File? image,
    CurrentUser? currentUser,
  }) = _ProfileEditState;
}

class ProfileEditValidation extends Equatable {
  final bool isEmailValidated;
  final bool isUsernameValidated;
  final PasswordValidation passwordValidation;
  const ProfileEditValidation({
    this.isEmailValidated = false,
    this.isUsernameValidated = false,
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

  bool _validate() {
    if (isEmailValidated &&
        isUsernameValidated &&
        passwordValidation.isValidated) {
      return true;
    }
    return false;
  }

  bool get isValidatet => _validate();

  @override
  List<Object?> get props =>
      [isEmailValidated, isUsernameValidated, passwordValidation];
}
