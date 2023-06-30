import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/extensions.dart';
import '../../../../core/domain/entities/password_validation.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/domain/entities/current_user.dart';
import '../../domain/usecases/edit_profile.dart';

part 'profile_edit_bloc.freezed.dart';
part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc({required EditProfile editProfileUsecase})
      : _editProfileUsecase = editProfileUsecase,
        super(const ProfileEditState()) {
    on<_Initial>(_initial);
    on<_ChangeEmail>(_changeEmail);
    on<_ChangeUsername>(_changeUsername);
    on<_ChangePassword>(_changePassword);
    on<_ChangeNewPassword>(_changeNewPassword);
    on<_ToggleEditPassword>(_toggleEditPassword);
    on<_EditProfile>(_editProfile);
  }

  final EditProfile _editProfileUsecase;

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
    _isEdited(emit);
  }

  FutureOr<void> _changeUsername(
      _ChangeUsername event, Emitter<ProfileEditState> emit) {
    final bool isUsernameValidated = event.username.length >= 3;
    emit(state.copyWith(
        username: event.username,
        validation: state.validation
            .copyWith(isUsernameValidated: isUsernameValidated)));
    _isEdited(emit);
  }

  FutureOr<void> _changePassword(
      _ChangePassword event, Emitter<ProfileEditState> emit) {
    final bool isPassHasUpperCaseLetter = event.password.containsUpperCase();
    final bool isPassHasLowerCaseLetter = event.password.containsLowercase();
    final bool isPassLongEnough = event.password.length >= 6;
    emit(state.copyWith(
        password: event.password,
        validation: state.validation.copyWith(
            passwordValidation: state.validation.passwordValidation.copyWith(
                isPassHasLowerCaseLetter: isPassHasLowerCaseLetter,
                isPassHasUpperCaseLetter: isPassHasUpperCaseLetter,
                isPassLongEnough: isPassLongEnough))));
  }

  FutureOr<void> _changeNewPassword(
      _ChangeNewPassword event, Emitter<ProfileEditState> emit) {
    final bool isPassHasUpperCaseLetter = event.newPassword.containsUpperCase();
    final bool isPassHasLowerCaseLetter = event.newPassword.containsLowercase();
    final bool isPassLongEnough = event.newPassword.length >= 6;
    emit(state.copyWith(
        newPassword: event.newPassword,
        isEdited: true,
        validation: state.validation.copyWith(
            passwordValidation: state.validation.passwordValidation.copyWith(
                isPassHasLowerCaseLetter: isPassHasLowerCaseLetter,
                isPassHasUpperCaseLetter: isPassHasUpperCaseLetter,
                isPassLongEnough: isPassLongEnough))));
  }

  FutureOr<void> _toggleEditPassword(
      _ToggleEditPassword event, Emitter<ProfileEditState> emit) {
    if (state.isEditPassword) {
      emit(state.copyWith(isEditPassword: false));
    } else {
      emit(state.copyWith(isEditPassword: true));
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
    res.fold((failure) {
      emit(state.copyWith(status: ProfileEditStatus.failure, failure: failure));
    },
        (editedUser) => emit(state.copyWith(
            status: ProfileEditStatus.success, currentUser: editedUser)));
  }

  void _isEdited(Emitter<ProfileEditState> emit) {
    if (state.username != state.currentUser?.username ||
        state.email != state.currentUser?.email) {
      emit(state.copyWith(isEdited: true));
    } else {
      emit(state.copyWith(isEdited: false));
    }
  }
}
