// Dart imports:
import 'dart:async';
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// Package imports:
import 'package:hive_flutter/hive_flutter.dart';
import 'package:morphosis_template/core/repository/secure_storage/secure_storage.dart';

// Project imports:
import 'app.dart';
import 'core/flavors/custom_flavors.dart';
import 'core/global/util/app_constants.dart';
import 'core/global/util/env/flavor_config.dart';
import 'di/environments.dart';
import 'di/injectable.dart';
import 'features/todo/domain/model/todo_data.dart';

Future<void> main() async {
  // ignore: omit_local_variable_types
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  CustomFlavors.init(
      url: AppConstants.GRAPHQL_URL_PROD, flavor: Flavor.PROD, name: 'PROD');

  log('Starting app from main_test.dart');
  await configureDependencies(Environments.PROD);

  await getIt<SecureStorage>().deleteAllAppRelatedData(key: 'FirstInstall');

  Hive.registerAdapter(TodoDataAdapter());
  await Hive.openBox<TodoData>('todoTest');

  FlutterNativeSplash.remove();
  await runZonedGuarded(() async {
    runApp(MyApp());
  }, (exception, stackTrace) async {});
}
