// Flutter imports:
// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

// Project imports:
import '../../../database/hive_setup.dart';

class Crashlytics {
  static const String _hiveBoxName = 'crashlytics';
  static const String _crashlyticsEnabledKey = 'isCrashlyticsEnabled';
  static final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;
  static bool isFirstTime = false;

  static Future<bool> initialize() async {
    await Firebase.initializeApp();
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await _crashlytics.sendUnsentReports();
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }
    return checkIfFirstTime();
  }

  static Future<bool> checkIfFirstTime() async {
    final containsKey =
        await HiveSetup.containsKey<bool>(_hiveBoxName, _crashlyticsEnabledKey);
    return isFirstTime = !containsKey;
  }

  // ignore: avoid_positional_boolean_parameters
  static void setEnabled(bool enabled) {
    _crashlytics.setCrashlyticsCollectionEnabled(enabled);
    HiveSetup.put(_hiveBoxName, _crashlyticsEnabledKey, enabled);
  }

  static void forceCrash() => _crashlytics.crash();

  static void log(String message) => _crashlytics.log(message);

  static void recordError(dynamic exception, StackTrace? stack,
      {dynamic reason,
      Iterable<DiagnosticsNode> information = const [],
      bool? printDetails,
      bool fatal = false}) {
    _crashlytics.recordError(
      exception,
      stack,
      reason: reason,
      information: information,
      printDetails: printDetails,
      fatal: fatal,
    );
  }

  static void recordFlutterError(FlutterErrorDetails flutterErrorDetails) {
    _crashlytics.recordFlutterError(flutterErrorDetails);
  }
}
