// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/env/flavor_config.dart';
import '../../../../features/todo/services/todo_webservice_test.dart';

void main() {
  group('FlavourConfig', () {
    FlavorValues flavorValues;
    // ignore: unused_local_variable
    FlavorConfig flavorConfig;
    setUp(() {
      flavorValues = FlavorValues(
          baseUrl: URL, logNetworkInfo: false, showFullErrorMessages: true);
      flavorConfig = FlavorConfig(
          color: Colors.red,
          flavor: Flavor.TEST,
          name: 'Test',
          values: flavorValues);
    });

    test('should return true for in test flavour', () {
      expect(FlavorConfig.isInTest(), true);
    });
  });
}
