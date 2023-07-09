import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/objects.dart';
import 'core/di/get_it.dart';
import 'core/styles/styles.dart';
import 'core/utils/app_router.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    getIt<AppRouter>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthBloc>()..add(const AuthEvent.start()),
        )
      ],
      child: MaterialApp(
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
    );
  }
}
