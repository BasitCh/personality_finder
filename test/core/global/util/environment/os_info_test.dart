// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/environment/os_info.dart';

void main() {
  OsInfo? osInfo;

  setUp(() {
    // for android 10
    osInfo = const OsInfo(29, 10, false);
  });

  group('OsInfo for Android', () {
    test('should return true for isAndroid,isAtLeastPie,isAtLeastAndroid10', () {
      // act
      final isAndroid = osInfo!.isAndroid;
      final isAtLeastPie = osInfo!.isAtLeastPie;
      final isAtLeastAndroid10 = osInfo!.isAtLeastAndroid10;
      final androidSdk = osInfo!.androidSdk;
      final isWeb = osInfo!.isWeb;

      // assert
      expect(isAndroid, true);
      expect(isAtLeastAndroid10, true);
      expect(isAtLeastPie, true);
      expect(androidSdk, 29);
      expect(isWeb, false);
    });
  });
}
