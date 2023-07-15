import 'dart:async';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/get_login_type.dart';
import '../../domain/usecases/logout.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required GetCurrentUser getCurrentUserUsecase,
    required GetLoginType getLoginTypeUsecase,
    required Logout logoutUsecase,
  })  : _getCurrentUserUsecase = getCurrentUserUsecase,
        _getLoginTypeUsecase = getLoginTypeUsecase,
        _logoutUsecase = logoutUsecase,
        super(const AuthState()) {
    on<_Start>(_start);
    on<_SetUser>(_setUser);
    on<_SetState>(_setState);
    on<_KickUnauthorizedUser>(_kickUnauthorizedUser);
    on<_Logout>(_logout);
  }

  final GetCurrentUser _getCurrentUserUsecase;
  final GetLoginType _getLoginTypeUsecase;
  final Logout _logoutUsecase;

  FutureOr<void> _start(_Start event, Emitter<AuthState> emit) async {
    emit(const AuthState(status: AuthStatus.loading));
    final res = _getLoginTypeUsecase.call();
    await res.fold((failure) {
      emit(AuthState(status: AuthStatus.failure, failure: failure));
    }, (loginType) async {
      if (loginType.isGuest) {
        emit(const AuthState(status: AuthStatus.guest));
      } else {
        final res = await _getCurrentUserUsecase.call(NoParams());
        res.fold((failure) {
          emit(AuthState(status: AuthStatus.failure, failure: failure));
        },
            (currentUser) => emit(
                AuthState(status: AuthStatus.authorized, user: currentUser)));
      }
    });
  }

  void _setUser(_SetUser event, Emitter<AuthState> emit) =>
      emit(state.copyWith(user: event.user));

  void _setState(_SetState event, Emitter<AuthState> emit) => emit(event.state);

  void _kickUnauthorizedUser(
      _KickUnauthorizedUser event, Emitter<AuthState> emit) async {
    await HydratedBloc.storage.clear();
    emit(state.copyWith(status: AuthStatus.unauthorized));
  }

  FutureOr<void> _logout(_Logout event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final res = await _logoutUsecase.call(NoParams());
    await res.fold(
      (failure) {
        emit(state.copyWith(status: AuthStatus.failure, failure: failure));
      },
      (r) async {
        await HydratedBloc.storage.clear();
        emit(state.copyWith(status: AuthStatus.unauthorized));
      },
    );
  }
}
