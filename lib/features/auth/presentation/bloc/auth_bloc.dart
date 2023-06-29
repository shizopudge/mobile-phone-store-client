import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/constants/enums.dart';
import '../../domain/usecases/logout.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/constants/extensions.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/get_login_type.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/login_as_guest.dart';
import '../../domain/usecases/register.dart';

import '../../../../core/failures/failure.dart';
import '../../domain/entities/current_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required Login loginUsecase,
    required LoginAsGuest loginAsGuestUsecase,
    required Register registerUsecase,
    required GetCurrentUser getCurrentUserUsecase,
    required GetLoginType getLoginTypeUsecase,
    required Logout logoutUsecase,
  })  : _loginUsecase = loginUsecase,
        _loginAsGuestUsecase = loginAsGuestUsecase,
        _registerUsecase = registerUsecase,
        _getCurrentUserUsecase = getCurrentUserUsecase,
        _getLoginTypeUsecase = getLoginTypeUsecase,
        _logoutUsecase = logoutUsecase,
        super(const _AuthState()) {
    on<_Initial>(_initial);
    on<_ChangeEmail>(_changeEmail);
    on<_ChangeUsername>(_changeUsername);
    on<_ChangePassword>(_changePassword);
    on<_Login>(_login);
    on<_Register>(_register);
    on<_LoginAsGuest>(_loginAsGuest);
    on<_Logout>(_logout);
    on<_DropState>(_dropState);
  }

  final Login _loginUsecase;
  final LoginAsGuest _loginAsGuestUsecase;
  final Register _registerUsecase;
  final GetCurrentUser _getCurrentUserUsecase;
  final GetLoginType _getLoginTypeUsecase;
  final Logout _logoutUsecase;

  FutureOr<void> _initial(_Initial event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(milliseconds: 1000)); //?
    late LoginType loginType;
    final res = _getLoginTypeUsecase.call();
    await res.fold((failure) {
      emit(AuthState(status: AuthStatus.failure, failure: failure));
      emit(const AuthState(status: AuthStatus.notAuthorized));
    }, (r) async {
      loginType = r;
      if (loginType.isGuest) {
        emit(state.copyWith(status: AuthStatus.guest));
      } else {
        final res = await _getCurrentUserUsecase.call(NoParams());
        res.fold((failure) {
          if (failure is ServerFailure && failure.statusCode == 401) {
            emit(const AuthState(status: AuthStatus.notAuthorized));
          } else {
            emit(AuthState(status: AuthStatus.failure, failure: failure));
            emit(const AuthState(status: AuthStatus.notAuthorized));
          }
        },
            (currentUser) => emit(AuthState(
                status: AuthStatus.authorized, currentUser: currentUser)));
      }
    });
  }

  FutureOr<void> _changeEmail(_ChangeEmail event, Emitter<AuthState> emit) {
    final bool isEmailValidated = EmailValidator.validate(event.email);
    emit(state.copyWith(
        email: event.email,
        validation:
            state.validation.copyWith(isEmailValidated: isEmailValidated)));
  }

  FutureOr<void> _changeUsername(
      _ChangeUsername event, Emitter<AuthState> emit) {
    final bool isUsernameValidated = event.username.length >= 3;
    emit(state.copyWith(
        username: event.username,
        validation: state.validation
            .copyWith(isUsernameValidated: isUsernameValidated)));
  }

  FutureOr<void> _changePassword(
      _ChangePassword event, Emitter<AuthState> emit) {
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

  FutureOr<void> _login(_Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final res = await _loginUsecase
        .call(LoginParams(email: state.email, password: state.password));
    res.fold((failure) {
      emit(state.copyWith(status: AuthStatus.failure, failure: failure));
      _dropFailure(emit);
    },
        (currentUser) => emit(state.copyWith(
            status: AuthStatus.authorized, currentUser: currentUser)));
  }

  FutureOr<void> _register(_Register event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final res = await _registerUsecase.call(RegisterParams(
        email: state.email,
        username: state.username,
        password: state.password));
    res.fold((failure) {
      emit(state.copyWith(status: AuthStatus.failure, failure: failure));
      _dropFailure(emit);
    },
        (currentUser) => emit(state.copyWith(
            status: AuthStatus.authorized, currentUser: currentUser)));
  }

  FutureOr<void> _loginAsGuest(
      _LoginAsGuest event, Emitter<AuthState> emit) async {
    final res = await _loginAsGuestUsecase.call(NoParams());
    res.fold(
      (failure) {
        emit(state.copyWith(status: AuthStatus.failure, failure: failure));
        _dropFailure(emit);
      },
      (r) => emit(state.copyWith(status: AuthStatus.guest)),
    );
  }

  FutureOr<void> _logout(_Logout event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    await Future.delayed(const Duration(milliseconds: 1000)); //?
    final res = await _logoutUsecase.call(NoParams());
    res.fold(
      (failure) {
        if (failure is ServerFailure && failure.statusCode == 401) {
          emit(AuthState(status: AuthStatus.failure, failure: failure));
          emit(const AuthState(status: AuthStatus.notAuthorized));
        } else {
          emit(state.copyWith(status: AuthStatus.failure, failure: failure));
        }
      },
      (r) => emit(state.copyWith(status: AuthStatus.notAuthorized)),
    );
  }

  FutureOr<void> _dropState(_DropState event, Emitter<AuthState> emit) {
    emit(const AuthState(status: AuthStatus.notAuthorized));
  }

  void _dropFailure(Emitter<AuthState> emit) {
    emit(state.copyWith(
        status: AuthStatus.notAuthorized, failure: const UnknownFailure()));
  }
}
