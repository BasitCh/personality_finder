// ignore_for_file: deprecated_member_use

// Dart imports:
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
// Project imports:
import 'package:morphosis_template/features/app/domain/entities/version_data.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InAppUpdates {
  static final RemoteConfig _remoteConfig = RemoteConfig.instance;
  static bool hasNewUpdate = false;

  static Future<bool> initialize() async {
    await Firebase.initializeApp();
    await _remoteConfig.ensureInitialized();
    await _remoteConfig.fetchAndActivate();
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 15),
    ));

    final data = _remoteConfig.getValue('version');
    final jsonData = jsonDecode(data.asString()) as Map<String, dynamic>;
    final updateData = VersionData.fromJson(jsonData);

    await _checkIfUpdateAvailable(updateData);
    return hasNewUpdate;
  }

  static Future<bool> _checkIfUpdateAvailable(VersionData updateData) async {
    final packageInfo = await PackageInfo.fromPlatform();

    final installedBuildNumber = packageInfo.buildNumber;

    final latestVersion = Platform.isAndroid
        ? updateData.androidLatestVersionCode
        : updateData.iosLatestVersionCode;
    if (int.parse(installedBuildNumber) < latestVersion) {
      hasNewUpdate = true;
    }
    return hasNewUpdate;
  }

  Future<bool> isUpdateMandatory(VersionData updateData) async {
    final packageInfo = await PackageInfo.fromPlatform();

    final installedBuildNumber = packageInfo.buildNumber;

    final minVersion = Platform.isAndroid
        ? updateData.androidMiniVersionCode
        : updateData.iosMiniVersionCode;
    if (int.parse(installedBuildNumber) < minVersion) {
      return true;
    }
    return false;
  }

  VersionData getUpdateData() {
    final data = _remoteConfig.getValue('version');
    final jsonData = jsonDecode(data.asString()) as Map<String, dynamic>;

    return VersionData.fromJson(jsonData);
  }
}
