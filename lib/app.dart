import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/get_it.dart';
import 'core/styles/styles.dart';
import 'core/utils/app_router.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/get_current_user.dart';
import 'features/auth/domain/usecases/get_login_type.dart';
import 'features/auth/domain/usecases/login.dart';
import 'features/auth/domain/usecases/login_as_guest.dart';
import 'features/auth/domain/usecases/logout.dart';
import 'features/auth/domain/usecases/register.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
              loginUsecase: Login(getIt<AuthRepositoryImpl>()),
              registerUsecase: Register(getIt<AuthRepositoryImpl>()),
              getCurrentUserUsecase:
                  GetCurrentUser(getIt<AuthRepositoryImpl>()),
              loginAsGuestUsecase: LoginAsGuest(getIt<AuthRepositoryImpl>()),
              getLoginTypeUsecase: GetLoginType(getIt<AuthRepositoryImpl>()),
              logoutUsecase: Logout(getIt<AuthRepositoryImpl>()))
            ..add(const AuthEvent.initial()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kDarkBlue),
          fontFamily: 'OpenSans_Condensed',
          useMaterial3: true,
        ),
        onGenerateRoute: getIt<AppRouter>().onGenerateRoute,
      ),
    );
  }
}
