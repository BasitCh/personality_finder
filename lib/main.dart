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
// import 'core/global/util/sentry/sentry_helper.dart';
import 'di/environments.dart';
import 'di/injectable.dart';
import 'features/todo/domain/model/todo_data.dart';

Future<void> main() async {
  // ignore: omit_local_variable_types
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  CustomFlavors.init(
      url: AppConstants.GRAPHQL_URL_DEV, flavor: Flavor.DEV, name: 'DEV');

  log('Starting app from main.dart');
  await configureDependencies(Environments.DEV);

  await getIt<SecureStorage>().deleteAllAppRelatedData(key: 'FirstInstall');

  Hive.registerAdapter(TodoDataAdapter());
  await Hive.openBox<TodoData>('todoTest');

  FlutterNativeSplash.remove();

  await runZonedGuarded(() async {
    // await SentryHelper.initialize();

    runApp(MyApp());
  }, (exception, stackTrace) async {
    // await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}
