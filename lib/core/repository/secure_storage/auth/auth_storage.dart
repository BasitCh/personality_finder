// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../secure_storing.dart';
import 'auth_storage_impl.dart';

@Singleton(as: AuthStoring)
class AuthStorage extends AuthStoring {
  final SecureStoring _storage;
  static const _ACCESS_TOKEN = 'ACCESS_TOKEN';
  static const _REFRESH_TOKEN = 'ACCESS_REFRESH_TOKEN';

  AuthStorage(this._storage);

  @override
  Future<String?> getAccessToken() => _storage.read(key: _ACCESS_TOKEN);

  @override
  Future<String?> getRefreshToken() => _storage.read(key: _REFRESH_TOKEN);

  @override
  Future<void> saveUserCredentials(
      {required String accessToken, String? refreshToken}) {
    return Future.wait(
      [
        // ignore: unnecessary_null_comparison
        if (accessToken != null && accessToken.isNotEmpty)
          _storage.write(key: _ACCESS_TOKEN, value: accessToken),
        if (refreshToken != null && refreshToken.isNotEmpty)
          _storage.write(key: _REFRESH_TOKEN, value: refreshToken),
      ],
    );
  }

  @override
  Future<bool> hasLoggedInUser() async {
    final token = await getAccessToken();

    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> clear() async {
    await _storage.delete(key: _ACCESS_TOKEN);
    await _storage.delete(key: _REFRESH_TOKEN);

    await _storage.deleteAll();
  }
}
