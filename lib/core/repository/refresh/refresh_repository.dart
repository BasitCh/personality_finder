// Package imports:
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:synchronized/synchronized.dart' as synchronized;

// Project imports:
import '../../global/exceptions/un_authorized_error.dart';
import '../../global/util/logging/logging.dart';
import '../secure_storage/auth/auth_storage_impl.dart';
import 'refresh_repo.dart';

@Singleton(as: RefreshRepo)
class RefreshRepository extends RefreshRepo {
  final AuthStoring _authStoring;
  final _lock = synchronized.Lock();
  bool _failure = false;

  RefreshRepository(this._authStoring);

  @override
  void resetFailure() {
    _failure = false;
  }

  @override
  Future refresh(DioError err) async {
    final accessToken = await _authStoring.getAccessToken();
    await _lock.synchronized(() async {
      final newAccessToken = await _authStoring.getAccessToken();
      if (accessToken != newAccessToken) {
        logger.debug('ACCESS TOKEN was already renewed');
        return;
      }
      if (_failure) {
        throw UnAuthorizedError(err);
      }
      try {
        await _authStoring.getRefreshToken();
        return;
        // TODO implement refresh call
        // await _authStoring.saveRefreshToken(refreshToken: result.refreshToken, accessToken: result.accessToken);
        // throw UnimplementedError(
        //     'No implementatino for the refresh in the refresh repository');
      } catch (e) {
        _failure = true;
        final logoutCb = logoutCallback;
        if (logoutCb != null) {
          await _authStoring.clear();
          logoutCb.call();
        }
        rethrow;
      }
    });
  }
}
