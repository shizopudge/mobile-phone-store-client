import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/get_it.dart';
import 'core/logic/auth/auth_bloc.dart';
import 'core/styles/styles.dart';
import 'core/utils/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

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
