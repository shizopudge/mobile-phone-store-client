part of 'profile_edit_bloc.dart';

@freezed
class ProfileEditEvent with _$ProfileEditEvent {
  const factory ProfileEditEvent.initial() = _Initial;
  const factory ProfileEditEvent.changeEmail(String email) = _ChangeEmail;
  const factory ProfileEditEvent.changeUsername(String username) =
      _ChangeUsername;
  const factory ProfileEditEvent.changePassword(String password) =
      _ChangePassword;
  const factory ProfileEditEvent.changeNewPassword(String newPassword) =
      _ChangeNewPassword;
  const factory ProfileEditEvent.toggleEditPassword() = _ToggleEditPassword;
  const factory ProfileEditEvent.editProfile() = _EditProfile;
  const factory ProfileEditEvent.pickImage() = _PickImage;
  const factory ProfileEditEvent.deleteImage() = _DeleteImage;
}
