// Flutter imports:
// Package imports:
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

typedef Callback = void Function(MethodCall call);

void setupFirebaseMock([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  // MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
  //   if (call.method == 'Firebase#initializeCore') {
  //     return [
  //       {
  //         'name': defaultFirebaseAppName,
  //         'options': {
  //           'apiKey': '123',
  //           'appId': '123',
  //           'messagingSenderId': '123',
  //           'projectId': '123',
  //         },
  //         'pluginConstants': <String, dynamic>{},
  //       }
  //     ];
  //   }

  //   if (call.method == 'Firebase#initializeApp') {
  //     return <String, dynamic>{
  //       'name': call.arguments['appName'],
  //       'options': call.arguments['options'],
  //       'pluginConstants': <String, dynamic>{},
  //     };
  //   }

  //   if (customHandlers != null) {
  //     customHandlers(call);
  //   }

  //   return null;
  // }

  // );
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future<T>.delayed(const Duration(minutes: 5));
  }
}
