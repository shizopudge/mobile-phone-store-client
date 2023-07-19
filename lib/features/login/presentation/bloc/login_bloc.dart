import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/extensions.dart';
import '../../../../core/domain/entities/password_validation.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../home/cubit/home_cubit.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/login_as_guest.dart';
import '../../domain/usecases/register.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required Login loginUsecase,
    required LoginAsGuest loginAsGuestUsecase,
    required Register registerUsecase,
    required AuthBloc authBloc,
    required HomeCubit homeCubit,
  })  : _loginUsecase = loginUsecase,
        _loginAsGuestUsecase = loginAsGuestUsecase,
        _registerUsecase = registerUsecase,
        _authBloc = authBloc,
        _homeCubit = homeCubit,
        super(const _AuthPageState()) {
    on<_ChangeEmail>(_changeEmail);
    on<_ChangeUsername>(_changeUsername);
    on<_ChangePassword>(_changePassword);
    on<_Login>(_login);
    on<_Register>(_register);
    on<_LoginAsGuest>(_loginAsGuest);
  }

  final Login _loginUsecase;
  final LoginAsGuest _loginAsGuestUsecase;
  final Register _registerUsecase;
  final AuthBloc _authBloc;
  final HomeCubit _homeCubit;

  FutureOr<void> _changeEmail(_ChangeEmail event, Emitter<LoginState> emit) {
    final bool isEmailValidated = EmailValidator.validate(event.email);
    emit(state.copyWith(
        email: event.email,
        validation:
            state.validation.copyWith(isEmailValidated: isEmailValidated)));
  }

  FutureOr<void> _changeUsername(
      _ChangeUsername event, Emitter<LoginState> emit) {
    final bool isUsernameValidated = event.username.length >= 3;
    emit(state.copyWith(
        username: event.username,
        validation: state.validation
            .copyWith(isUsernameValidated: isUsernameValidated)));
  }

  FutureOr<void> _changePassword(
      _ChangePassword event, Emitter<LoginState> emit) {
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

  FutureOr<void> _login(_Login event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    final res = await _loginUsecase
        .call(LoginParams(email: state.email, password: state.password));
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (currentUser) {
        _authBloc.add(AuthEvent.setState(
            AuthState(status: AuthStatus.authorized, user: currentUser)));
        _homeCubit.changePage(0);
      },
    );
  }

  FutureOr<void> _register(_Register event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    final res = await _registerUsecase.call(RegisterParams(
        email: state.email,
        username: state.username,
        password: state.password));
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (currentUser) {
        _authBloc.add(AuthEvent.setState(
            AuthState(status: AuthStatus.authorized, user: currentUser)));
        _homeCubit.changePage(0);
      },
    );
  }

  FutureOr<void> _loginAsGuest(
      _LoginAsGuest event, Emitter<LoginState> emit) async {
    final res = await _loginAsGuestUsecase.call(NoParams());
    res.fold(
      (failure) => _throwFailure(emit, failure),
      (r) {
        _authBloc
            .add(const AuthEvent.setState(AuthState(status: AuthStatus.guest)));
        _homeCubit.changePage(0);
      },
    );
  }

  void _throwFailure(Emitter<LoginState> emit, Failure failure) {
    emit(state.copyWith(status: LoginStatus.failure, failure: failure));
    emit(state.copyWith(
        status: LoginStatus.initial, failure: const CasualFailure()));
  }
}
