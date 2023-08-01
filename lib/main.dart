import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'core/data/models/purchase_notification_model/purchase_notification_model.dart';
import 'core/di/get_it.dart';
import 'core/domain/entities/purchase_notification.dart';
import 'core/utils/app_bloc_observer.dart';
import 'core/utils/notifications_service.dart';
import 'firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final PurchaseNotfication purchaseNotfication = PurchaseNotfication.fromModel(
      PurchaseNotficationModel.fromJson(message.data));
  await NotifictaionsService().initNotification();
  NotifictaionsService().showNotification(
    title: '${purchaseNotfication.status}',
    body:
        'Cost: ${purchaseNotfication.cost}, ${purchaseNotfication.currency}\nPayment ID: ${purchaseNotfication.id}',
  );
}

Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  final PurchaseNotfication purchaseNotfication = PurchaseNotfication.fromModel(
      PurchaseNotficationModel.fromJson(message.data));
  NotifictaionsService().showNotification(
    title: '${purchaseNotfication.status}',
    body:
        'Cost: ${purchaseNotfication.cost}, ${purchaseNotfication.currency}\nPayment ID: ${purchaseNotfication.id}',
  );
}

Future<void> init() async {
  final String? token = await FirebaseMessaging.instance.getToken();
  if (token != null) {
    await getIt<SharedPreferences>().setString(
      'deviceToken',
      token,
    );
  }
}

void bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    setPathUrlStrategy();
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = AppBlocObserver();
  await appSetup();
  if (!kIsWeb) {
    await init();
    await NotifictaionsService().initNotification();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_firebaseMessagingHandler);
  }
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const App(),
    ),
  );
}

void main() => bootstrap();
