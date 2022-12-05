// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../global/util/env/flavor_config.dart';

class CustomFlavors {
  static FlavorConfig init(
      {required String url, required Flavor flavor, required String name}) {
    final values = FlavorValues(
      baseUrl: '$url',
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );

    return FlavorConfig(
      flavor: Flavor.DEV,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
  }
}
