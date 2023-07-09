import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/di/get_it.dart';
import 'core/utils/app_bloc_observer.dart';

void bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = AppBlocObserver();
  await appSetup();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const App(),
    ),
  );
}

void main() => bootstrap();
