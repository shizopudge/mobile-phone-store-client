import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/browse_products/presentation/bloc/browse_products_bloc.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../../features/create_edit_manufacturer/presentation/bloc/create_edit_manufacturer_bloc.dart';
import '../../features/create_edit_manufacturer/presentation/pages/create_edit_manufacturer_page.dart';
import '../../features/create_edit_model/presentation/bloc/create_edit_model_bloc.dart';
import '../../features/create_edit_model/presentation/pages/create_edit_model_page.dart';
import '../../features/create_edit_product/presentation/bloc/create_edit_product_bloc.dart';
import '../../features/create_edit_product/presentation/pages/create_edit_product_page.dart';
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
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/usecases/delete_user_image.dart';
import '../../features/profile/domain/usecases/edit_profile.dart';
import '../../features/profile/domain/usecases/upload_user_image.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/profile/presentation/pages/profile_edit_page.dart';
import '../../features/purchases/presentation/bloc/purchases_bloc.dart';
import '../../features/purchases/presentation/pages/purchases_page.dart';
import '../../features/wishlist/presentation/bloc/wishlist_bloc.dart';
import '../data/repositories/image/image_repository_impl.dart';
import '../di/get_it.dart';
import '../domain/usecases/image/pick_image.dart';
import '../presentation/widgets/pages/auth_splash_page.dart';
import 'page_transition_util.dart';

class AppRouter {
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
              homeCubit: getIt<HomeCubit>(),
            ),
            child: const LoginPage(),
          ),
        );
      case HomePage.path:
        return PageTransitionUtil.go(
          page: MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<HomeCubit>(),
              ),
              BlocProvider.value(
                value: getIt<BrowseProductsBloc>()
                  ..add(const BrowseProductsEvent.initial()),
              ),
              BlocProvider.value(
                value: getIt<DetailedProductBloc>(),
              ),
            ],
            child: const HomePage(),
          ),
        );
      case ProfileEditPage.path:
        return PageTransitionUtil.go(
          page: BlocProvider(
              create: (_) => ProfileBloc(
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
          page: MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<DetailedProductBloc>(),
              ),
              BlocProvider.value(
                value: getIt<WishlistBloc>(),
              ),
              BlocProvider.value(
                value: getIt<CartBloc>(),
              ),
              BlocProvider.value(
                value: getIt<CreateEditProductBloc>(),
              ),
            ],
            child: const DetailedProductPage(),
          ),
          duration: const Duration(milliseconds: 500),
        );
      case CreateEditManufacturerPage.path:
        return PageTransitionUtil.go(
          page: BlocProvider.value(
            value: getIt<CreateEditManufacturerBloc>()
              ..add(const CreateEditManufacturerEvent.initial()),
            child: const CreateEditManufacturerPage(),
          ),
          duration: const Duration(milliseconds: 500),
        );
      case CreateEditModelPage.path:
        return PageTransitionUtil.go(
          page: BlocProvider.value(
            value: getIt<CreateEditModelBloc>(),
            child: const CreateEditModelPage(),
          ),
          duration: const Duration(milliseconds: 500),
        );
      case CreateEditProductPage.path:
        return PageTransitionUtil.go(
          page: BlocProvider.value(
            value: getIt<CreateEditProductBloc>(),
            child: const CreateEditProductPage(),
          ),
          duration: const Duration(milliseconds: 500),
        );
      case PurchasesPage.path:
        return PageTransitionUtil.go(
          page: MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<PurchasesBloc>()
                  ..add(const PurchasesEvent.initial()),
              ),
              BlocProvider.value(
                value: getIt<DetailedProductBloc>(),
              ),
            ],
            child: const PurchasesPage(),
          ),
          duration: const Duration(milliseconds: 500),
        );
      default:
        return null;
    }
  }
}
