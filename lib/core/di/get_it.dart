import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/get_current_user.dart';
import '../../features/auth/domain/usecases/get_login_type.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/login_as_guest.dart';
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/refresh_tokens.dart';
import '../../features/auth/domain/usecases/register.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../api/dio_client.dart';
import '../api/interceptors.dart';
import '../utils/app_router.dart';

final getIt = GetIt.instance;

Future<void> appSetup() async {
  // Other
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(Connectivity());
  getIt.registerSingleton(const FlutterSecureStorage());
  getIt.registerSingleton(await SharedPreferences.getInstance());

  // Repositories
  getIt.registerSingleton(AuthRepositoryImpl(
      remoteDataSource: AuthDataRemoteSourceImpl(getIt<DioClient>()),
      localDataSource: AuthLocalDataSourceImpl(
          storage: getIt<FlutterSecureStorage>(),
          prefs: getIt<SharedPreferences>())));

  // Router
  getIt.registerSingleton(AppRouter());

  // Interceptors initialization
  getIt<DioClient>().dio.interceptors.addAll({
    AccessInterceptor(
        dio: getIt<DioClient>().dio,
        refreshTokens: RefreshTokens(getIt<AuthRepositoryImpl>()),
        storage: getIt<FlutterSecureStorage>()),
    const LoggerInterceptor()
  });

  // Global blocs

  getIt.registerSingleton(AuthBloc(
      loginUsecase: Login(getIt<AuthRepositoryImpl>()),
      registerUsecase: Register(getIt<AuthRepositoryImpl>()),
      getCurrentUserUsecase: GetCurrentUser(getIt<AuthRepositoryImpl>()),
      loginAsGuestUsecase: LoginAsGuest(getIt<AuthRepositoryImpl>()),
      getLoginTypeUsecase: GetLoginType(getIt<AuthRepositoryImpl>()),
      logoutUsecase: Logout(getIt<AuthRepositoryImpl>())));
}
