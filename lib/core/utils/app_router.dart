import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/detailed_product/data/repositories/detailed_product_repository_impl.dart';
import '../../features/detailed_product/domain/usecases/get_one_product.dart';
import '../../features/detailed_product/presentation/bloc/detailed_product_bloc.dart';
import '../../features/detailed_product/presentation/pages/detailed_product_page.dart';
import '../../features/home/cubit/home_cubit.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/usecases/login.dart';
import '../../features/login/domain/usecases/login_as_guest.dart';
import '../../features/login/domain/usecases/register.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/products/data/repositories/products_repository_impl.dart';
import '../../features/products/domain/usecases/get_many_products.dart';
import '../../features/products/presentation/bloc/products_bloc.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/usecases/delete_image.dart';
import '../../features/profile/domain/usecases/edit_profile.dart';
import '../../features/profile/domain/usecases/upload_image.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/profile/presentation/pages/profile_edit_page.dart';
import '../data/repositories/image/image_repository_impl.dart';
import '../di/get_it.dart';
import '../domain/usecases/image/pick_image.dart';
import '../presentation/widgets/pages/auth_splash_page.dart';
import 'page_transition_util.dart';

class AppRouter {
  final _homeCubit = HomeCubit();
  late final _productsBloc = ProductsBloc(
    getManyProductsUsecase: GetManyProduct(getIt<ProductsRepositoryImpl>()),
  );
  late final _detailedProductBloc = DetailedProductBloc(
      productsBloc: _productsBloc,
      getOneProductUsecase:
          GetOneProduct(getIt<DetailedProductRepositoryImpl>()));

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthSplashPage.path:
        return PageTransitionUtil.go(
          page: const AuthSplashPage(),
        );
      case LoginPage.path:
        return PageTransitionUtil.go(
          page: BlocProvider(
            create: (_) => LoginBloc(
              authBloc: getIt<AuthBloc>(),
              loginUsecase: Login(getIt<LoginRepositoryImpl>()),
              registerUsecase: Register(getIt<LoginRepositoryImpl>()),
              loginAsGuestUsecase: LoginAsGuest(getIt<LoginRepositoryImpl>()),
            ),
            child: const LoginPage(),
          ),
        );
      case HomePage.path:
        return PageTransitionUtil.go(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => _homeCubit,
              ),
              BlocProvider(
                create: (context) =>
                    _productsBloc..add(const ProductsEvent.initial()),
              ),
              BlocProvider.value(
                value: _detailedProductBloc,
                child: const DetailedProductPage(),
              ),
            ],
            child: const HomePage(),
          ),
        );
      case ProfileEditPage.path:
        return PageTransitionUtil.go(
          page: BlocProvider(
              create: (context) => ProfileBloc(
                  authBloc: getIt<AuthBloc>(),
                  editProfileUsecase:
                      EditProfile(getIt<ProfileRepositoryImpl>()),
                  uploadUserImageUsecase:
                      UploadUserImage(getIt<ProfileRepositoryImpl>()),
                  pickImageUsecase: PickImage(getIt<ImageRepositoryImpl>()),
                  deleteUserImageUsecase:
                      DeleteUserImage(getIt<ProfileRepositoryImpl>()))
                ..add(const ProfileEvent.initial()),
              child: const ProfileEditPage()),
        );
      case DetailedProductPage.path:
        return PageTransitionUtil.go(
          page: BlocProvider.value(
            value: _detailedProductBloc,
            child: const DetailedProductPage(),
          ),
          duration: const Duration(milliseconds: 500),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _homeCubit.close();
    _productsBloc.close();
    _detailedProductBloc.close();
  }
}
