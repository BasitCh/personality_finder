// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/permission_checker/permission_checker.dart';

class MockPermissionChecker extends Mock implements PermissionCheckerCaller {}

@GenerateMocks([MockPermissionChecker])
void main() {
  setUp(() {});

  group('test all permission checker method', () {
    test('test location permission is granted', () {});

    test('test storage permission is granted', () {});

    test('test media library permission is granted', () {});
  });
}

class PermissionCheckerCaller {
  Future<bool> hasLocationPermission(BuildContext context) async {
    return PermissionChecker.hasLocationPermission(context);
  }

  Future<bool> hasStoragePermission(BuildContext context) async {
    return PermissionChecker.hasStoragePermission(context);
  }

  Future<bool> hasCameraPermission(BuildContext context) async {
    return PermissionChecker.hasCameraPermission(context);
  }

  Future<bool> hasContactsPermission(BuildContext context) async {
    return PermissionChecker.hasContactsPermission(context);
  }

  Future<bool> hasMicrophonePermission(BuildContext context) async {
    return PermissionChecker.hasMicrophonePermission(context);
  }

  Future<bool> hasSpeechPermission(BuildContext context) async {
    return PermissionChecker.hasSpeechPermission(context);
  }

  Future<bool> hasNoificationPermission(BuildContext context) async {
    return PermissionChecker.hasNoificationPermission(context);
  }

  Future<bool> hasMediaLibraryPermission(BuildContext context) async {
    return PermissionChecker.hasMediaLibraryPermission(context);
  }

  Future<bool> hasCalenderPermission(BuildContext context) async {
    return PermissionChecker.hasCalenderPermission(context);
  }

  Future<bool> hasReminderPermission(BuildContext context) async {
    return PermissionChecker.hasReminderPermission(context);
  }
}
