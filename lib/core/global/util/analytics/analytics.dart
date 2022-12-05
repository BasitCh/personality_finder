// ignore_for_file: deprecated_member_use

// Package imports:
import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> logEvent({
    required String name,
    required Map<String, dynamic> parameters,
  }) async {
    await analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  static Future<void> setetUserId(String id) async {
    await analytics.setUserId(id: id);
  }

  static Future<void> setCurrentScreen({
    required String name,
    String screenClassOverride = 'Flutter',
  }) async {
    await analytics.setCurrentScreen(
      screenName: name,
      screenClassOverride: screenClassOverride,
    );
  }

  static Future<void> setAnalyticsCollectionEnabled({
    required bool enabled,
  }) async {
    await analytics.setAnalyticsCollectionEnabled(enabled);
  }

  static Future<void> setAndroidSessionTimeoutDuration(
      int durationInMills) async {
    await analytics.android?.setSessionTimeoutDuration(durationInMills);
  }

  static Future<void> setUserProperty(String name, String value) async {
    await analytics.setUserProperty(name: name, value: value);
  }

  static Future<void> logAppOpen() async {
    await analytics.logAppOpen();
  }

  static Future<void> logLogin() async {
    await analytics.logLogin();
  }

  static Future<void> logSignUp(String signUpMethod) async {
    await analytics.logSignUp(signUpMethod: signUpMethod);
  }

  static Future<void> logOnboardingBegin() async {
    await analytics.logTutorialBegin();
  }

  static Future<void> logOnboardingComplete() async {
    await analytics.logTutorialBegin();
  }

  // TODO(abd99): Add additional item details.
  static Future<void> logViewItem(

    String itemId, String itemName, String itemCategory) async {
    final itemData = AnalyticsEventItem(
        itemId: itemId, itemName: itemName, itemCategory: itemCategory);
    await analytics.logViewItem(items: [itemData]);

  }

  static Future<void> logViewSearchResults(String searchTerm) async {
    await analytics.logViewSearchResults(
      searchTerm: searchTerm,
    );
  }
  // TODO(abd99): Implement app specific logs.
}
