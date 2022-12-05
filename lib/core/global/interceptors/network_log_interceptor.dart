// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../exceptions/general_error.dart';
import '../exceptions/network_error.dart';
import '../util/logging/logging.dart';
import 'combining_smart_interceptor.dart';

@singleton
class NetworkLogInterceptor extends SimpleInterceptor {
  @override
  Future<Object?> onRequest(RequestOptions options) async {
    logger.logNetworkRequest(options);
    return super.onRequest(options);
  }

  @override
  Future<Object?> onResponse(Response response) async {
    logger.logNetworkResponse(response);
    return super.onResponse(response);
  }

  @override
  Future<Object?> onError(DioError error) async {
    if (error is NetworkError) {
      logger.logNetworkError(error);
    } else {
      logger.logNetworkError(GeneralNetworkError(error));
    }
    return super.onError(error);
  }
}
