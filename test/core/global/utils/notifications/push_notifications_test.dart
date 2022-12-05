// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/notifications/push_notifications.dart';
import '../../../../..//test/core/global/utils/notifications/push_notifications_test.mocks.dart';

@GenerateMocks([PushNotifications])
void main() {
  group('Push Notifications', () {
    final mock = MockPushNotifications();
    test('settings alert should be true', () async {
      when(mock.requestNotificationPermission());
      // expect(mock.settings.alert, true);
    });

    test('settings announcement should be false', () async {
      when(mock.requestNotificationPermission());
      // expect(mock.settings.alert, false);
    });
  });
}
