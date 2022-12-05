// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:morphosis_template/app.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
// Project imports:
import 'package:morphosis_template/di/injectable.dart';
import 'package:rxdart/subjects.dart';

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification(
      {required this.id,
      required this.title,
      required this.body,
      required this.payload});
}

class LocalNotfications {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  // ignore: avoid_positional_boolean_parameters
  Future<void> initialize({
    bool requestAlertPermission = false,
    bool requestBadgePermission = false,
    bool requestSoundPermission = false,
  }) async {
    const androidinitializationSettings =
        AndroidInitializationSettings('app_icon');
    final iOSInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: requestAlertPermission,
      requestBadgePermission: requestBadgePermission,
      requestSoundPermission: requestSoundPermission,
    );
    final macOSInitializationSettings = MacOSInitializationSettings(
      requestAlertPermission: requestAlertPermission,
      requestBadgePermission: requestBadgePermission,
      requestSoundPermission: requestSoundPermission,
    );
    final initializationSettings = InitializationSettings(
      android: androidinitializationSettings,
      iOS: iOSInitializationSettings,
      macOS: macOSInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) async {
        if (payload != null) {
          selectNotificationSubject.add(payload);
          await selectNotification(
              payload, appRouter.navigatorKey.currentState!.context);
        }

        // ignore: void_checks
        return Future.value(payload);
      },
    );
  }

  Future selectNotification(String? payload, BuildContext context) async {
    if (payload != null) {
      // print('select notification: $payload');
      await AutoRouter.of(context).push(TipDetailRoute(tipId: payload));
    }
  }

  Future<void> showNotification(
      {required String id, required String title, String? body}) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '8w8re', '8w8reChannel',
        channelDescription: '',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');

    const platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    try {
      await getIt<LocalNotfications>().flutterLocalNotificationsPlugin.show(
          DateTime.now().microsecond, title, body, platformChannelSpecifics,
          payload: id);
    } catch (e) {
      // print('show notification error: $e');
    }
  }
}
