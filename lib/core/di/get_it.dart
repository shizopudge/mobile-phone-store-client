import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/login/data/datasources/login_local_data_source.dart';
import '../../features/login/data/datasources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/profile_edit/data/datasources/profile_edit_remote_data_source.dart';
import '../../features/profile_edit/data/repositories/profile_edit_repository_impl.dart';
import '../api/dio_client.dart';
import '../api/interceptors.dart';
import '../data/datasources/auth/auth_local_data_source.dart';
import '../data/datasources/auth/auth_remote_data_source.dart';
import '../data/datasources/image/image_local_data_source.dart';
import '../data/repositories/auth/auth_repository_impl.dart';
import '../data/repositories/image/image_repository_impl.dart';
import '../domain/usecases/auth/get_current_user.dart';
import '../domain/usecases/auth/get_login_type.dart';
import '../domain/usecases/auth/logout.dart';
import '../domain/usecases/auth/refresh_tokens.dart';
import '../logic/auth/auth_bloc.dart';
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
  getIt.registerSingleton(LoginRepositoryImpl(
      remoteDataSource: LoginDataRemoteSourceImpl(getIt<DioClient>()),
      localDataSource: LoginLocalDataSourceImpl(
          storage: getIt<FlutterSecureStorage>(),
          prefs: getIt<SharedPreferences>())));
  getIt.registerSingleton(ProfileEditRepositoryImpl(
      ProfileEditRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(ImageRepositoryImpl(ImageLocalDataSourceImpl()));

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
      getCurrentUserUsecase: GetCurrentUser(getIt<AuthRepositoryImpl>()),
      getLoginTypeUsecase: GetLoginType(getIt<AuthRepositoryImpl>()),
      logoutUsecase: Logout(getIt<AuthRepositoryImpl>())));
}
