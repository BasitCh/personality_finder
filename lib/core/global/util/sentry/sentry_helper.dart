// // Package imports:
// import 'package:sentry_flutter/sentry_flutter.dart';

// class SentryHelper {
//   static Future<void> initialize() async {
//     await SentryFlutter.init(
//       (options) {
//         options.dsn =
//             'https://25743d19d0f24853886557c4b27add6d@o916032.ingest.sentry.io/5856956';
//       },
//     );
//   }

//   static Future<void> throwException() async {
//     try {
//       throw Exception();
//     } catch (exception, stackTrace) {
//       await Sentry.captureException(
//         exception,
//         stackTrace: stackTrace,
//       );
//     }
//   }

//   static Future<SentryId> captureEvent(
//     SentryEvent event, {
//     dynamic stackTrace,
//     dynamic hint,
//     void Function(Scope)? withScope,
//   }) async {
//     return Sentry.captureEvent(event,
//         stackTrace: stackTrace, hint: hint, withScope: withScope);
//   }

//   static Future<SentryId> captureMessage(
//     String? message, {
//     SentryLevel? level = SentryLevel.info,
//     String? template,
//     List<dynamic>? params,
//     dynamic hint,
//     void Function(Scope)? withScope,
//   }) async {
//     return Sentry.captureMessage(message);
//   }

//   static Future<SentryId> captureException(
//     dynamic throwable, {
//     dynamic stackTrace,
//     dynamic hint,
//     void Function(Scope)? withScope,
//   }) async {
//     return Sentry.captureException(throwable);
//   }

//   static Future<Hub> clone() async {
//     return Sentry.clone();
//   }

//   static Future get(String url) async {
//     final client = SentryHttpClient();
//     try {
//       final uriResponse = await client.get(Uri.parse(url));
//       return uriResponse;
//     } finally {
//       client.close();
//     }
//   }

//   static Future post(String url, Map<String, dynamic>? body) async {
//     final client = SentryHttpClient();
//     try {
//       final uriResponse = await client.post(Uri.parse(url), body: body);
//       return uriResponse;
//     } finally {
//       client.close();
//     }
//   }
// }
