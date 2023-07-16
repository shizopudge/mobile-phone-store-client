import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/get_current_user.dart';
import '../../features/auth/domain/usecases/get_login_type.dart';
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/refresh_tokens.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/browse_products/data/datasources/browse_products_remote_data_source.dart';
import '../../features/browse_products/data/repositories/browse_products_repository_impl.dart';
import '../../features/browse_products/domain/usecases/browse_products.dart';
import '../../features/browse_products/presentation/bloc/browse_products_bloc.dart';
import '../../features/cart/data/datasources/cart_remote_data_source.dart';
import '../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../features/cart/domain/usecases/get_cart.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../../features/create_edit_manufacturer/data/datasources/create_edit_manufacturer_remote_data_source.dart';
import '../../features/create_edit_manufacturer/data/repositories/create_edit_manufacturer_repository_impl.dart';
import '../../features/create_edit_manufacturer/domain/usecases/create_manufacturer.dart';
import '../../features/create_edit_manufacturer/domain/usecases/delete_manufacturer_image.dart';
import '../../features/create_edit_manufacturer/domain/usecases/edit_manufacturer.dart';
import '../../features/create_edit_manufacturer/domain/usecases/upload_manufacturer_image.dart';
import '../../features/create_edit_manufacturer/presentation/bloc/create_edit_manufacturer_bloc.dart';
import '../../features/create_edit_model/data/datasources/create_edit_model_remote_data_source.dart';
import '../../features/create_edit_model/data/repositories/create_edit_model_repository_impl.dart';
import '../../features/create_edit_model/domain/usecases/create_model.dart';
import '../../features/create_edit_model/domain/usecases/edit_model.dart';
import '../../features/create_edit_model/presentation/bloc/create_edit_model_bloc.dart';
import '../../features/create_edit_product/data/datasources/create_edit_product_remote_data_source.dart';
import '../../features/create_edit_product/data/repositories/create_edit_product_repository_impl.dart';
import '../../features/create_edit_product/domain/usecases/create_product.dart';
import '../../features/create_edit_product/domain/usecases/delete_image.dart';
import '../../features/create_edit_product/domain/usecases/delete_product.dart';
import '../../features/create_edit_product/domain/usecases/edit_product.dart';
import '../../features/create_edit_product/domain/usecases/upload_images.dart';
import '../../features/create_edit_product/presentation/bloc/create_edit_product_bloc.dart';
import '../../features/detailed_product/data/datasources/detailed_product_remote_data_source.dart';
import '../../features/detailed_product/data/repositories/detailed_product_repository_impl.dart';
import '../../features/detailed_product/domain/usecases/change_color.dart';
import '../../features/detailed_product/domain/usecases/change_storage.dart';
import '../../features/detailed_product/domain/usecases/get_one_product.dart';
import '../../features/detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/login/data/datasources/login_local_data_source.dart';
import '../../features/login/data/datasources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/manufacturers/data/datasources/manufacturers_remote_data_source.dart';
import '../../features/manufacturers/data/repositories/manufacturers_repository_impl.dart';
import '../../features/manufacturers/domain/usecases/delete_manufacturer.dart';
import '../../features/manufacturers/domain/usecases/get_manufacturers.dart';
import '../../features/manufacturers/presentation/bloc/manufacturers_bloc.dart';
import '../../features/models/data/datasources/models_remote_data_source.dart';
import '../../features/models/data/repositories/models_repository_impl.dart';
import '../../features/models/domain/usecases/delete_model.dart';
import '../../features/models/domain/usecases/get_models.dart';
import '../../features/models/presentation/bloc/models_bloc.dart';
import '../../features/profile/data/datasources/profile_remote_data_source.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/wishlist/data/datasources/wishlist_remote_data_source.dart';
import '../../features/wishlist/data/repositories/wishlist_repository_impl.dart';
import '../../features/wishlist/domain/usecases/get_wishlist.dart';
import '../../features/wishlist/presentation/bloc/wishlist_bloc.dart';
import '../api/dio_client.dart';
import '../api/interceptors.dart';
import '../data/datasources/image/image_local_data_source.dart';
import '../data/datasources/products/products_remote_data_source.dart';
import '../data/repositories/image/image_repository_impl.dart';
import '../data/repositories/products/products_repository_impl.dart';
import '../domain/usecases/image/pick_image.dart';
import '../domain/usecases/image/pick_images.dart';
import '../domain/usecases/products/toggle_cart.dart';
import '../domain/usecases/products/toggle_wishlist.dart';
import '../utils/app_router.dart';
import '../utils/internet_connection_check/internet_connection_check_cubit.dart';

final getIt = GetIt.instance;

Future<void> appSetup() async {
  /// Other
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(InternetConnection());
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
  getIt.registerSingleton(BrowseProductsRepositoryImpl(
      remoteDataSource:
          BrowseProductsRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(DetailedProductRepositoryImpl(
      remoteDataSource:
          DetailedProductRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(ProductsRepositoryImpl(
      remoteDataSource: ProductsRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(WishlistRepositoryImpl(
      remoteDataSource: WishlistRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(CartRepositoryImpl(
      remoteDataSource: CartRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(CreateEditManufacturerRepositoryImpl(
      remoteDataSource:
          CreateEditManufacturerRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(CreateEditModelRepositoryImpl(
      remoteDataSource:
          CreateEditModelRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(CreateEditProductRepositoryImpl(
      remoteDataSource:
          CreateEditProductRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(ManufacturersRepositoryImpl(
      remoteDataSource: ManufacturersRemoteDataSourceImpl(getIt<DioClient>())));
  getIt.registerSingleton(ModelsRepositoryImpl(
      remoteDataSource: ModelsRemoteDataSourceImpl(getIt<DioClient>())));

  /// Interceptors initialization
  getIt<DioClient>().dio.interceptors.addAll({
    AccessInterceptor(
        dio: getIt<DioClient>().dio,
        refreshTokens: RefreshTokens(getIt<AuthRepositoryImpl>()),
        storage: getIt<FlutterSecureStorage>()),
    const LoggerInterceptor(),
    const AwaitInterceptor(),
  });

  /// Blocs
  getIt.registerSingleton(HomeCubit());
  getIt.registerSingleton(BrowseProductsBloc(
    getManyProductsUsecase:
        BrowseProducts(getIt<BrowseProductsRepositoryImpl>()),
  ));

  getIt.registerSingleton(WishlistBloc(
      getWishlistUsecase: GetWishlist(getIt<WishlistRepositoryImpl>()),
      toggleWishlistUsecase: ToggleWishlist(getIt<ProductsRepositoryImpl>())));
  getIt.registerSingleton(CartBloc(
      getCartUsecase: GetCart(
        getIt<CartRepositoryImpl>(),
      ),
      toggleCartUsecase: ToggleCart(getIt<ProductsRepositoryImpl>())));
  getIt.registerSingleton(DetailedProductBloc(
    cartBloc: getIt<CartBloc>(),
    wishlistBloc: getIt<WishlistBloc>(),
    browseProductsBloc: getIt<BrowseProductsBloc>(),
    getOneProductUsecase: GetOneProduct(getIt<DetailedProductRepositoryImpl>()),
    changeColorUsecase: ChangeColor(
      getIt<DetailedProductRepositoryImpl>(),
    ),
    changeStorageUsecase: ChangeStorage(
      getIt<DetailedProductRepositoryImpl>(),
    ),
  ));
  getIt.registerSingleton(ManufacturersBloc(
      getManufacturersUsecase:
          GetManufacturers(getIt<ManufacturersRepositoryImpl>()),
      deleteManufacturerUsecase:
          DeleteManufacturer(getIt<ManufacturersRepositoryImpl>())));
  getIt.registerSingleton(CreateEditManufacturerBloc(
      manufacturersBloc: getIt<ManufacturersBloc>(),
      pickImageUsecase: PickImage(getIt<ImageRepositoryImpl>()),
      createManufacturerUsecase:
          CreateManufacturer(getIt<CreateEditManufacturerRepositoryImpl>()),
      editManufacturerUsecase:
          EditManufacturer(getIt<CreateEditManufacturerRepositoryImpl>()),
      uploadManufacturerImageUsecase: UploadManufacturerImage(
          getIt<CreateEditManufacturerRepositoryImpl>()),
      deleteManufacturerImageUsecase: DeleteManufacturerImage(
          getIt<CreateEditManufacturerRepositoryImpl>())));
  getIt.registerSingleton(ModelsBloc(
      getModelsUsecase: GetModels(getIt<ModelsRepositoryImpl>()),
      deleteModelUsecase: DeleteModel(getIt<ModelsRepositoryImpl>())));
  getIt.registerSingleton(CreateEditModelBloc(
      modelsBloc: getIt<ModelsBloc>(),
      createModelUsecase: CreateModel(getIt<CreateEditModelRepositoryImpl>()),
      editModelUsecase: EditModel((getIt<CreateEditModelRepositoryImpl>()))));
  getIt.registerSingleton(CreateEditProductBloc(
      modelsBloc: getIt<ModelsBloc>(),
      detailedProductBloc: getIt<DetailedProductBloc>(),
      browseProductsBloc: getIt<BrowseProductsBloc>(),
      createProductUsecase:
          CreateProduct(getIt<CreateEditProductRepositoryImpl>()),
      editProduct: EditProduct(getIt<CreateEditProductRepositoryImpl>()),
      pickImagesUsecase: PickImages(getIt<ImageRepositoryImpl>()),
      uploadProductImagesUsecase:
          UploadProductImages(getIt<CreateEditProductRepositoryImpl>()),
      deleteProductImageUsecase:
          DeleteProductImage(getIt<CreateEditProductRepositoryImpl>()),
      deleteProductUsecase:
          DeleteProduct(getIt<CreateEditProductRepositoryImpl>())));

  /// Global blocs
  getIt.registerSingleton(InternetConnectionCheckCubit(
      internetConnection: getIt<InternetConnection>()));
  getIt.registerSingleton(AuthBloc(
      getCurrentUserUsecase: GetCurrentUser(getIt<AuthRepositoryImpl>()),
      getLoginTypeUsecase: GetLoginType(getIt<AuthRepositoryImpl>()),
      logoutUsecase: Logout(getIt<AuthRepositoryImpl>())));

  /// Router
  getIt.registerSingleton(AppRouter());
}
