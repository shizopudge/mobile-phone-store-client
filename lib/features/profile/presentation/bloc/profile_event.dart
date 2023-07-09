part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.initial() = _Initial;
  const factory ProfileEvent.changeEmail(String email) = _ChangeEmail;
  const factory ProfileEvent.changeUsername(String username) = _ChangeUsername;
  const factory ProfileEvent.changePassword(String password) = _ChangePassword;
  const factory ProfileEvent.changeNewPassword(String newPassword) =
      _ChangeNewPassword;
  const factory ProfileEvent.toggleEditPassword() = _ToggleEditPassword;
  const factory ProfileEvent.editProfile() = _EditProfile;
  const factory ProfileEvent.pickImage() = _PickImage;
  const factory ProfileEvent.deleteImage() = _DeleteImage;
}
