import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/domain/usecases/usecase.dart';

import '../../../../core/constants/extensions.dart';
import '../../../../core/domain/entities/password_validation.dart';
import '../../../../core/domain/usecases/image/pick_image.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/usecases/delete_image.dart';
import '../../domain/usecases/edit_profile.dart';
import '../../domain/usecases/upload_image.dart';

part 'profile_edit_bloc.freezed.dart';
part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc(
      {required EditProfile editProfileUsecase,
      required UploadUserImage uploadUserImageUsecase,
      required PickImage pickImageUsecase,
      required DeleteUserImage deleteUserImageUsecase})
      : _editProfileUsecase = editProfileUsecase,
        _uploadUserImageUsecase = uploadUserImageUsecase,
        _pickImageUsecase = pickImageUsecase,
        _deleteUserImageUsecase = deleteUserImageUsecase,
        super(const ProfileEditState()) {
    on<_Initial>(_initial);
    on<_ChangeEmail>(_changeEmail);
    on<_ChangeUsername>(_changeUsername);
    on<_ChangePassword>(_changePassword);
    on<_ChangeNewPassword>(_changeNewPassword);
    on<_ToggleEditPassword>(_toggleEditPassword);
    on<_EditProfile>(_editProfile);
    on<_PickImage>(_pickImage);
    on<_DeleteImage>(_deleteImage);
  }

  final EditProfile _editProfileUsecase;
  final UploadUserImage _uploadUserImageUsecase;
  final PickImage _pickImageUsecase;
  final DeleteUserImage _deleteUserImageUsecase;

  FutureOr<void> _initial(_Initial event, Emitter<ProfileEditState> emit) {
    emit(state.copyWith(
      email: event.currentUser.email,
      username: event.currentUser.username,
      currentUser: event.currentUser,
    ));
  }

  FutureOr<void> _changeEmail(
      _ChangeEmail event, Emitter<ProfileEditState> emit) {
    final bool isEmailValidated = EmailValidator.validate(event.email);
    emit(state.copyWith(
        email: event.email,
        validation:
            state.validation.copyWith(isEmailValidated: isEmailValidated)));
  }

  FutureOr<void> _changeUsername(
      _ChangeUsername event, Emitter<ProfileEditState> emit) {
    final bool isUsernameValidated = event.username.length >= 3;
    emit(state.copyWith(
        username: event.username,
        validation: state.validation
            .copyWith(isUsernameValidated: isUsernameValidated)));
  }

  FutureOr<void> _changePassword(
      _ChangePassword event, Emitter<ProfileEditState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _changeNewPassword(
      _ChangeNewPassword event, Emitter<ProfileEditState> emit) {
    final bool isPassHasUpperCaseLetter = event.newPassword.containsUpperCase();
    final bool isPassHasLowerCaseLetter = event.newPassword.containsLowercase();
    final bool isPassLongEnough = event.newPassword.length >= 6;
    emit(state.copyWith(
        newPassword: event.newPassword,
        validation: state.validation.copyWith(
            passwordValidation: state.validation.passwordValidation.copyWith(
                isPassHasLowerCaseLetter: isPassHasLowerCaseLetter,
                isPassHasUpperCaseLetter: isPassHasUpperCaseLetter,
                isPassLongEnough: isPassLongEnough))));
  }

  FutureOr<void> _toggleEditPassword(
      _ToggleEditPassword event, Emitter<ProfileEditState> emit) {
    if (state.newPassword == null) {
      emit(state.copyWith(newPassword: ''));
    } else {
      emit(state.copyWith(newPassword: null));
    }
  }

  FutureOr<void> _editProfile(
      _EditProfile event, Emitter<ProfileEditState> emit) async {
    emit(state.copyWith(status: ProfileEditStatus.loading));
    final res = await _editProfileUsecase.call(EditProfileParams(
        email: state.email,
        username: state.username,
        password: state.password,
        newPassword: state.newPassword));
    await res.fold((failure) {
      _emitFailure(emit, failure);
    }, (editedUser) async {
      if (state.image != null) {
        final res = await _uploadUserImageUsecase
            .call(UploadImageParams(image: state.image!));
        res.fold((failure) {
          _emitFailure(emit, failure);
        }, (uploadedImage) {
          emit(state.copyWith(
              status: ProfileEditStatus.success,
              currentUser: state.currentUser?.copyWith(image: uploadedImage)));
          emit(state.copyWith(status: ProfileEditStatus.initial));
        });
      } else {
        emit(state.copyWith(
            status: ProfileEditStatus.success, currentUser: editedUser));
        emit(state.copyWith(status: ProfileEditStatus.initial));
      }
    });
  }

  void _emitFailure(Emitter<ProfileEditState> emit, Failure failure) {
    emit(state.copyWith(status: ProfileEditStatus.failure, failure: failure));
    emit(state.copyWith(status: ProfileEditStatus.initial));
  }

  FutureOr<void> _pickImage(
      _PickImage event, Emitter<ProfileEditState> emit) async {
    emit(state.copyWith(status: ProfileEditStatus.loading));
    final res = await _pickImageUsecase.call(NoParams());
    res.fold((failure) {
      _emitFailure(emit, failure);
    },
        (pickedImage) => emit(state.copyWith(
            image: pickedImage, status: ProfileEditStatus.initial)));
  }

  FutureOr<void> _deleteImage(
      _DeleteImage event, Emitter<ProfileEditState> emit) async {
    emit(state.copyWith(status: ProfileEditStatus.loading));
    final res = await _deleteUserImageUsecase.call(NoParams());
    res.fold((failure) {
      _emitFailure(emit, failure);
    }, (r) {
      emit(state.copyWith(
          currentUser: state.currentUser?.copyWithNewImage(image: null),
          status: ProfileEditStatus.success));
    });
  }
}
