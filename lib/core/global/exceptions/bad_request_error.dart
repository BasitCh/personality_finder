// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../generated/locale_keys.g.dart';
import 'network_error.dart';

class BadRequestError extends NetworkError {
  static const statusCode = HttpStatus.badRequest;

  BadRequestError(DioError dioError, {String? statusCode})
      : super(dioError, statusCodeValue: statusCode);

  @override
  String getLocalizedKey() => LocaleKeys.error_bad_request;

  @override
  String? get getErrorCode {
    if (statusCodeValue == null) return '$statusCode';
    return '$statusCode [$statusCodeValue]';
  }

  static NetworkError parseError(DioError err) {
    final dynamic data = err.response?.data;
    if (data == null || data == '') return BadRequestError(err);
    final code = data['code'] as String; // ignore: avoid_as
    switch (code) {
      default:
        return BadRequestError(err);
    }
  }
}
