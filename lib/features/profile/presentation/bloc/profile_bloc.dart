import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/extensions.dart';
import '../../../../core/constants/password_validation.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/domain/usecases/image/pick_image.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../domain/usecases/delete_image.dart';
import '../../domain/usecases/edit_profile.dart';
import '../../domain/usecases/upload_image.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required EditProfile editProfileUsecase,
    required UploadUserImage uploadUserImageUsecase,
    required PickImage pickImageUsecase,
    required DeleteUserImage deleteUserImageUsecase,
    required AuthBloc authBloc,
  })  : _editProfileUsecase = editProfileUsecase,
        _uploadUserImageUsecase = uploadUserImageUsecase,
        _pickImageUsecase = pickImageUsecase,
        _deleteUserImageUsecase = deleteUserImageUsecase,
        _authBloc = authBloc,
        super(const ProfileState()) {
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
  final AuthBloc _authBloc;

  FutureOr<void> _initial(_Initial event, Emitter<ProfileState> emit) {
    final CurrentUser? user = _authBloc.state.user;
    if (user != null) {
      emit(state.copyWith(
        email: user.email,
        username: user.username,
        currentUser: user,
      ));
    } else {
      emit(const ProfileState(
          status: ProfileStatus.failure, failure: CasualFailure()));
    }
  }

  void _changeEmail(_ChangeEmail event, Emitter<ProfileState> emit) {
    final bool isEmailValidated = EmailValidator.validate(event.email);
    emit(state.copyWith(
        email: event.email,
        validation:
            state.validation.copyWith(isEmailValidated: isEmailValidated)));
  }

  void _changeUsername(_ChangeUsername event, Emitter<ProfileState> emit) {
    final bool isUsernameValidated = event.username.length >= 3;
    emit(state.copyWith(
        username: event.username,
        validation: state.validation
            .copyWith(isUsernameValidated: isUsernameValidated)));
  }

  void _changePassword(_ChangePassword event, Emitter<ProfileState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _changeNewPassword(
      _ChangeNewPassword event, Emitter<ProfileState> emit) {
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
      _ToggleEditPassword event, Emitter<ProfileState> emit) {
    if (state.newPassword == null) {
      emit(state.copyWith(newPassword: ''));
    } else {
      emit(state.copyWith(newPassword: null));
    }
  }

  FutureOr<void> _editProfile(
      _EditProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    final res = await _editProfileUsecase.call(EditProfileParams(
        email: state.email,
        username: state.username,
        password: state.password,
        newPassword: state.newPassword));
    await res.fold((failure) {
      _throwFailure(emit, failure);
    }, (editedUser) async {
      if (state.image != null) {
        final res = await _uploadUserImageUsecase
            .call(UploadImageParams(image: state.image!));
        res.fold((failure) {
          _throwFailure(emit, failure);
        }, (uploadedImage) {
          _authBloc.add(
              AuthEvent.setUser(editedUser.copyWith(image: uploadedImage)));
          emit(state.copyWith(
              status: ProfileStatus.success,
              currentUser: editedUser.copyWith(image: uploadedImage)));
        });
      } else {
        _authBloc.add(AuthEvent.setUser(editedUser));
        emit(state.copyWith(
            status: ProfileStatus.success, currentUser: editedUser));
      }
    });
  }

  void _throwFailure(Emitter<ProfileState> emit, Failure failure) {
    emit(state.copyWith(status: ProfileStatus.failure, failure: failure));
    emit(state.copyWith(status: ProfileStatus.initial));
  }

  FutureOr<void> _pickImage(
      _PickImage event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    final res = await _pickImageUsecase.call(NoParams());
    res.fold((failure) {
      _throwFailure(emit, failure);
    },
        (pickedImage) => emit(
            state.copyWith(image: pickedImage, status: ProfileStatus.initial)));
  }

  FutureOr<void> _deleteImage(
      _DeleteImage event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    final res = await _deleteUserImageUsecase.call(NoParams());
    res.fold((failure) {
      _throwFailure(emit, failure);
    }, (r) {
      _authBloc.add(
          AuthEvent.setUser(state.currentUser?.copyWithNewImage(image: null)));
      emit(state.copyWith(
          currentUser: state.currentUser?.copyWithNewImage(image: null),
          status: ProfileStatus.success));
    });
  }
}
