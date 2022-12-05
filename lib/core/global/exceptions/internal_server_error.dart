// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../generated/locale_keys.g.dart';
import 'network_error.dart';

class InternalServerError extends NetworkError {
  static const statusCode = HttpStatus.internalServerError;

  InternalServerError(DioError dioError, {String? statusCode})
      : super(dioError, statusCodeValue: statusCode);

  @override
  String getLocalizedKey() => LocaleKeys.error_internal_server;

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }
}
