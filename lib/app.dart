import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'core/constants/objects.dart';
import 'core/di/get_it.dart';
import 'core/styles/styles.dart';
import 'core/utils/app_router.dart';
import 'core/utils/internet_connection_check/internet_connection_check_cubit.dart';
import 'core/utils/size_config.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<InternetConnectionCheckCubit>()..checkInternetConnection(),
        ),
        BlocProvider(
          create: (_) => getIt<AuthBloc>()..add(const AuthEvent.start()),
        )
      ],
      child: BlocListener<InternetConnectionCheckCubit,
          InternetConnectionCheckState>(
        listener: (context, state) => state.whenOrNull(
          disconnected: () => Get.rawSnackbar(
            backgroundColor: kRed,
            isDismissible: false,
            icon: Icon(
              Icons.wifi_off_rounded,
              color: kLightWhite,
              size: SizeConfig.iconMedium,
            ),
            messageText: Text(
              'No internet connection',
              style: kMedium.copyWith(
                color: kLightWhite,
                fontSize: SizeConfig.body1,
              ),
            ),
            duration: const Duration(days: 1),
          ),
          connected: () => Get.closeCurrentSnackbar(),
        ),
        child: GetMaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: kDarkBlue),
            fontFamily: 'OpenSans_Condensed',
            useMaterial3: true,
          ),
          onGenerateRoute: getIt<AppRouter>().onGenerateRoute,
        ),
      ),
    );
  }
}
