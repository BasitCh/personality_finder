// Package imports:
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'secure_storing.dart';

@Singleton(as: SecureStoring)
class SecureStorage extends SecureStoring {
  final FlutterSecureStorage _storage;

  final iOSOptions =
      const IOSOptions(accessibility: KeychainAccessibility.unlocked);

  SecureStorage(this._storage);

  @override
  Future<void> deleteAll() => _storage.deleteAll(iOptions: iOSOptions);

  @override
  Future<void> write({required String key, required String value}) =>
      _storage.write(key: key, value: value, iOptions: iOSOptions);

  @override
  Future<String?> read({required String key}) =>
      _storage.read(key: key, iOptions: iOSOptions);

  @override
  Future<void> delete({required String key}) =>
      _storage.delete(key: key, iOptions: iOSOptions);

  @override
  Future<bool> containsKey({required String key}) =>
      _storage.containsKey(key: key, iOptions: iOSOptions);

  @override
  Future<bool> deleteAllAppRelatedData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('first_run') ?? true) {
      await _storage.deleteAll();

      await prefs.setBool('first_run', false);

      log('cleared all data ');

      return true;
    } else {
      return false;
    }
  }
}
