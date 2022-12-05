// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:location/location.dart';

// Project imports:
import '../permission_checker/permission_checker.dart';

class LocationHelper {
  static final Location _location = Location();

  static final LocationHelper _singleton = LocationHelper._internal();

  factory LocationHelper() {
    return _singleton;
  }

  LocationHelper._internal();

  static Future<bool> hasLocationPermission(BuildContext context) =>
      PermissionChecker.hasLocationPermission(context);

  static Future<bool> requestPermission(BuildContext context) async {
    final hasPermission = await hasLocationPermission(context);
    if (!hasPermission) {
      final _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted ||
          _permissionGranted != PermissionStatus.grantedLimited) {
        return false;
      }
    }
    return true;
  }

  static Future<bool> serviceEnabled() {
    return _location.serviceEnabled();
  }

  static Future<bool> requestService() {
    return _location.requestService();
  }

  static Future<bool> isBackgroundModeEnabled() {
    return _location.isBackgroundModeEnabled();
  }

  static Future<bool> setBackgroundMode({required bool enabled}) {
    return _location.enableBackgroundMode(enable: enabled);
  }

  static Stream<LocationData> monitorLocation() {
    return _location.onLocationChanged;
  }

  static Future<LocationData> getLocation() {
    return _location.getLocation();
  }
}

// for mocking locationhelper
class LocationHelperTarget {
  Future getLocation(
      {@visibleForTesting dynamic staticMethodClassForTesting}) async {
    if (staticMethodClassForTesting != null) {
      return staticMethodClassForTesting.getLocation();
    } else {
      return LocationHelper.getLocation();
    }
  }

  Future requestService(
      {@visibleForTesting dynamic staticMethodClassForTesting}) async {
    if (staticMethodClassForTesting != null) {
      return staticMethodClassForTesting.requestService();
    } else {
      return LocationHelper.requestService();
    }
  }

  Future isBackgroundModeEnabled(
      {@visibleForTesting dynamic staticMethodClassForTesting}) async {
    if (staticMethodClassForTesting != null) {
      return staticMethodClassForTesting.isBackgroundModeEnabled();
    } else {
      return LocationHelper.isBackgroundModeEnabled();
    }
  }

  Future setBackgroundMode({
    required bool enabled,
    @visibleForTesting dynamic staticMethodClassForTesting,
  }) async {
    if (staticMethodClassForTesting != null) {
      return staticMethodClassForTesting.setBackgroundMode(enabled: enabled);
    } else {
      return LocationHelper.setBackgroundMode(enabled: enabled);
    }
  }
}
