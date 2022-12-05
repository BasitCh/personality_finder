// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../generated/locale_keys.g.dart';
import 'network_error.dart';

class NoInternetError extends NetworkError {
  NoInternetError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocaleKeys.error_no_network;

  @override
  String? get getErrorCode => null;
}

class NoNetworkError extends Error {}
