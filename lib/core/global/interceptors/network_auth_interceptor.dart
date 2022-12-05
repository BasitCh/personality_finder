// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../repository/secure_storage/auth/auth_storage_impl.dart';
import '../util/app_constants.dart';
import 'combining_smart_interceptor.dart';

@singleton
class NetworkAuthInterceptor extends SimpleInterceptor {
  final AuthStoring _storage;
  final _excludedPaths = [
    'login',
  ];

  NetworkAuthInterceptor(this._storage);

  @override
  Future<Object?> onRequest(RequestOptions options) async {
    if (_excludedPaths.contains(options.path)) {
      return super.onRequest(options);
    }
    final authorizationHeader =
        '${AppConstants.HEADER_PROTECTED_AUTHENTICATION_PREFIX} ${await _storage.getAccessToken()}';
    options.headers[AppConstants.HEADER_AUTHORIZATION] = authorizationHeader;
    return options;
  }

  @override
  Future<Object?> onError(DioError error) async {
    final response = error.response;
    if (response != null && response.statusCode == HttpStatus.notModified) {
      debugPrint(response.toString());
      return super.onError(error);
    }
    return super.onError(error);
  }
}
