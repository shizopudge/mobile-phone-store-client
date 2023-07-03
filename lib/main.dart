import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/get_it.dart';
import 'core/utils/app_bloc_observer.dart';

void bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await appSetup();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const App(),
    ),
  );
}

void main() => bootstrap();
