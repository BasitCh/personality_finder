// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/location/location_helper.dart';

class MockClass extends Mock {}

@GenerateMocks([Location, LocationHelper])
void main() {
  group('LocationHelper', () {
    // Location? location;
    LocationHelperTarget? locationHelperTarget;
    final locationData =
        LocationData.fromMap(<String, dynamic>{'latitude': 233.0});
    dynamic mocked;
    setUp(() {
      mocked = MockClass();
      // location = MockLocation();
      locationHelperTarget = LocationHelperTarget();
    });
    test('should get correct location ', () async {
      // arrange
      when<dynamic>(mocked.getLocation())
          .thenAnswer((realInvocation) => locationData);

      final dynamic result = await locationHelperTarget!
          .getLocation(staticMethodClassForTesting: mocked);
      // act
      expect(result as LocationData, locationData);
    });

    test('should request service', () async {
      // arrange
      when<dynamic>(mocked.requestService())
          .thenAnswer((realInvocation) => true);

      final dynamic result = await locationHelperTarget!
          .requestService(staticMethodClassForTesting: mocked);

      // act
      expect(result, true);
    });
    test('should check if background is enabled', () async {
      // arrange
      when<dynamic>(mocked.isBackgroundModeEnabled())
          .thenAnswer((realInvocation) => true);

      final dynamic result = await locationHelperTarget!
          .isBackgroundModeEnabled(staticMethodClassForTesting: mocked);

      // act
      expect(result, true);
    });

    test('should set background ', () async {
      // arrange
      when<dynamic>(mocked.setBackgroundMode(enabled: true))
          .thenAnswer((realInvocation) => true);

      final dynamic result = await locationHelperTarget!.setBackgroundMode(
          staticMethodClassForTesting: mocked, enabled: true);

      // act
      expect(result, true);
    });
  });
}
