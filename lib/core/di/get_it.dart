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
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/refresh_tokens.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/cart/data/datasources/cart_remote_data_source.dart';
import '../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../features/detailed_product/data/datasources/detailed_product_remote_data_source.dart';
import '../../features/detailed_product/data/repositories/detailed_product_repository_impl.dart';
import '../../features/login/data/datasources/login_local_data_source.dart';
import '../../features/login/data/datasources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/products/data/datasources/search_products_remote_data_source.dart';
import '../../features/products/data/repositories/search_products_repository_impl.dart';
import '../../features/profile/data/datasources/profile_remote_data_source.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/wishlist/data/datasources/wishlist_remote_data_source.dart';
import '../../features/wishlist/data/repositories/wishlist_repository_impl.dart';
import '../api/dio_client.dart';
import '../api/interceptors.dart';
import '../data/datasources/image/image_local_data_source.dart';
import '../data/datasources/products/products_remote_data_source.dart';
import '../data/repositories/image/image_repository_impl.dart';
import '../data/repositories/products/products_repository_impl.dart';
import '../utils/app_router.dart';

final getIt = GetIt.instance;

Future<void> appSetup() async {
  /// Other
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(Connectivity());
  getIt.registerSingleton(const FlutterSecureStorage());
  getIt.registerSingleton(await SharedPreferences.getInstance());

  /// Repositories
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
  getIt.registerSingleton(ProfileRepositoryImpl(
      remoteDataSource: ProfileRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(
      ImageRepositoryImpl(localDataSource: ImageLocalDataSourceImpl()));
  getIt.registerSingleton(SearchProductsRepositoryImpl(
      remoteDataSource:
          SearchProductsRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(DetailedProductRepositoryImpl(
      remoteDataSource:
          DetailedProductRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(ProductsRepositoryImpl(
      remoteDataSource: ProductsRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(WishlistRepositoryImpl(
      remoteDataSource: WishlistRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(CartRepositoryImpl(
      remoteDataSource: CartRemoteDataSourceImpl(getIt<DioClient>())));

  /// Interceptors initialization
  getIt<DioClient>().dio.interceptors.addAll({
    AccessInterceptor(
        dio: getIt<DioClient>().dio,
        refreshTokens: RefreshTokens(getIt<AuthRepositoryImpl>()),
        storage: getIt<FlutterSecureStorage>()),
    const LoggerInterceptor(),
    //! TODO Remove on release
    const AwaitInterceptor()
  });

  /// Global blocs
  getIt.registerSingleton(AuthBloc(
      getCurrentUserUsecase: GetCurrentUser(getIt<AuthRepositoryImpl>()),
      getLoginTypeUsecase: GetLoginType(getIt<AuthRepositoryImpl>()),
      logoutUsecase: Logout(getIt<AuthRepositoryImpl>())));

  /// Router
  getIt.registerSingleton(AppRouter());
}
