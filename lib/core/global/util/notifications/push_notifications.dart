import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifications {
  late final FirebaseMessaging _messaging;
  late final NotificationSettings settings;

  PushNotifications() {
    _messaging = FirebaseMessaging.instance;
    requestNotificationPermission(isEnabled: true);

    getToken();
  }

  Future<String?> getToken() async {
    final token = await _messaging.getToken();
    log('messaging $token');
    return token;
  }

  Future<void> notificationSettings({required bool notificationStatus}) async {
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: notificationStatus,
      badge: notificationStatus,
      sound: notificationStatus,
    );

    await _messaging.setAutoInitEnabled(notificationStatus);
  }

  Future<void> requestNotificationPermission(
      {required bool isEnabled, NotificationSettings? nSettings}) async {
    // ignore: prefer_const_constructors, unused_local_variable

    if (Platform.isIOS && isEnabled) {
      // ignore: parameter_assignments

      try {
        settings = await _messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        // ignore: avoid_catching_errors
      } on Error catch (_) {
        throw Error();
      } on Exception catch (_) {
        throw Exception();
      }
    }
  }
}
