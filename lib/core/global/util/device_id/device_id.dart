import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/app.dart';

class Device {
  const Device();

  Future<String?> getId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
    return null;
  }

  Future<String> fetchLocale() async {
    final myLocale =
        Localizations.localeOf(appRouter.navigatorKey.currentState!.context)
            .languageCode;

    return myLocale;
  }
}
