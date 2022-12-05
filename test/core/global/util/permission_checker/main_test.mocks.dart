// Mocks generated by Mockito 5.3.0 from annotations
// in morphosis_template/test/core/global/util/permission_checker/main_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter/material.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

import 'main_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MockPermissionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockPermissionChecker extends _i1.Mock
    implements _i2.MockPermissionChecker {
  MockMockPermissionChecker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> hasLocationPermission(_i4.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#hasLocationPermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> hasStoragePermission(_i4.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#hasStoragePermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> hasCameraPermission(_i4.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#hasCameraPermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> hasContactsPermission(_i4.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#hasContactsPermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> hasMicrophonePermission(_i4.BuildContext? context) => (super
      .noSuchMethod(Invocation.method(#hasMicrophonePermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> hasSpeechPermission(_i4.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#hasSpeechPermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> hasNoificationPermission(_i4.BuildContext? context) => (super
      .noSuchMethod(Invocation.method(#hasNoificationPermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> hasMediaLibraryPermission(_i4.BuildContext? context) =>
      (super.noSuchMethod(
          Invocation.method(#hasMediaLibraryPermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> hasCalenderPermission(_i4.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#hasCalenderPermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> hasReminderPermission(_i4.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#hasReminderPermission, [context]),
          returnValue: _i3.Future<bool>.value(false)) as _i3.Future<bool>);
}