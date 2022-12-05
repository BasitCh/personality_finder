// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../generated/locale_keys.g.dart';
import 'network_error.dart';

class ForbiddenError extends NetworkError {
  static const statusCode = HttpStatus.forbidden;

  ForbiddenError(DioError dioError, {String? statusCode})
      : super(dioError, statusCodeValue: statusCode);

  @override
  String getLocalizedKey() => LocaleKeys.error_forbidden;

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }

  static NetworkError parseError(DioError err) {
    final dynamic data = err.response?.data;
    if (data == null || data == '') return ForbiddenError(err);
    final code = data['code'] as String; // ignore: avoid_as
    switch (code) {
      default:
        return ForbiddenError(err);
    }
  }
}
