// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../generated/locale_keys.g.dart';
import 'network_error.dart';

class UnAuthorizedError extends NetworkError {
  static const statusCode = HttpStatus.unauthorized;

  UnAuthorizedError(DioError dioError, {String? statusCode})
      : super(dioError, statusCodeValue: statusCode);

  @override
  String getLocalizedKey() => LocaleKeys.error_unauthorized;

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }
}
