import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifictaionsService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    if (Platform.isAndroid) {
      final notificationsPluginAndroid =
          notificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();
      if (notificationsPluginAndroid != null) {
        final isNotificationsEnabled =
            await notificationsPluginAndroid.areNotificationsEnabled();
        if (isNotificationsEnabled != null && isNotificationsEnabled == false) {
          notificationsPluginAndroid.requestPermission();
        }
      }
    }
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_launcher');
    const initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initializationSetting = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSetting);
  }

  void showNotification({
    int id = 0,
    required String title,
    required String body,
    String? payload,
  }) =>
      notificationsPlugin.show(
        id,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'androidNotificationChannelId',
            'androidNotificationChannelName',
            importance: Importance.high,
            styleInformation: BigTextStyleInformation(''),
          ),
          iOS: DarwinNotificationDetails(),
        ),
      );
}
