// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app.dart';
import 'core/flavors/custom_flavors.dart';
import 'core/global/util/env/flavor_config.dart';
import 'di/environments.dart';
import 'di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CustomFlavors.init(
      url: 'https://jsonplaceholder.typicode.com/',
      flavor: Flavor.ALPHA,
      name: 'ALPHA');

  await configureDependencies(Environments.PROD);

  // runApp(MyApp());
  runApp(MyApp());
}
