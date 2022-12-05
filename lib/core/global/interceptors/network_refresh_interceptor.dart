// Package imports:
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../repository/refresh/refresh_repo.dart';
import '../../repository/secure_storage/auth/auth_storage_impl.dart';
import '../exceptions/un_authorized_error.dart';
import '../util/app_constants.dart';
import '../util/logging/logging.dart';
import 'combining_smart_interceptor.dart';

@singleton
class NetworkRefreshInterceptor extends SimpleInterceptor {
  final AuthStoring _authStoring;
  final RefreshRepo _refreshRepo;

  final _excludedPaths = [
    'login',
  ];

  NetworkRefreshInterceptor(
    this._authStoring,
    this._refreshRepo,
  );

  @override
  Future<Object?> onResponse(Response response) {
    _refreshRepo.resetFailure();
    return super.onResponse(response);
  }

  @override
  Future<Object?> onError(DioError error) async {
    final request = error.requestOptions;
    if (_excludedPaths.contains(request.path)) {
      logger.debug('Network refresh interceptor should not intercept');
      return super.onError(error);
    }

    if (error is! UnAuthorizedError) {
      return super.onError(error);
    }

    logger.debug('Refreshing');
    await _refreshRepo.refresh(error);

    final authorizationHeader =
        '${AppConstants.HEADER_PROTECTED_AUTHENTICATION_PREFIX} ${await _authStoring.getAccessToken()}';
    request.headers[AppConstants.HEADER_AUTHORIZATION] = authorizationHeader;

    return GetIt.instance.get<Dio>().fetch<dynamic>(request);
  }
}
