import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/refresh_tokens.dart';
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
        getIt<DioClient>().dio, RefreshTokens(getIt<AuthRepositoryImpl>())),
    const LoggerInterceptor()
  });
}
