// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../../generated/locale_keys.g.dart';
import 'network_error.dart';

class GeneralNetworkError extends NetworkError {
  GeneralNetworkError(DioError dioError) : super(dioError);

  @override
  String getLocalizedKey() => LocaleKeys.error_general;

  @override
  String? get getErrorCode => null;
}
