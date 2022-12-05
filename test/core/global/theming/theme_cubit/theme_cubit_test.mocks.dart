// Mocks generated by Mockito 5.3.0 from annotations
// in morphosis_template/test/core/global/theming/theme_cubit/theme_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:morphosis_template/core/global/util/preferences/preferences_storage.dart'
    as _i2;

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

/// A class which mocks [SharedPreferenceStorage].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferenceStorage extends _i1.Mock
    implements _i2.SharedPreferenceStorage {
  MockSharedPreferenceStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> saveString({String? key, String? value}) =>
      (super.noSuchMethod(
              Invocation.method(#saveString, [], {#key: key, #value: value}),
              returnValue: _i3.Future<void>.value(),
              returnValueForMissingStub: _i3.Future<void>.value())
          as _i3.Future<void>);
  @override
  _i3.Future<void> saveBoolean({String? key, bool? value}) =>
      (super.noSuchMethod(
              Invocation.method(#saveBoolean, [], {#key: key, #value: value}),
              returnValue: _i3.Future<void>.value(),
              returnValueForMissingStub: _i3.Future<void>.value())
          as _i3.Future<void>);
  @override
  _i3.Future<void> saveInt({String? key, int? value}) => (super.noSuchMethod(
      Invocation.method(#saveInt, [], {#key: key, #value: value}),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> saveDouble({String? key, double? value}) =>
      (super.noSuchMethod(
              Invocation.method(#saveDouble, [], {#key: key, #value: value}),
              returnValue: _i3.Future<void>.value(),
              returnValueForMissingStub: _i3.Future<void>.value())
          as _i3.Future<void>);
  @override
  String? getString(String? key) =>
      (super.noSuchMethod(Invocation.method(#getString, [key])) as String?);
  @override
  bool? getBoolean(String? key) =>
      (super.noSuchMethod(Invocation.method(#getBoolean, [key])) as bool?);
  @override
  int? getInt(String? key) =>
      (super.noSuchMethod(Invocation.method(#getInt, [key])) as int?);
  @override
  double? getDouble(String? key) =>
      (super.noSuchMethod(Invocation.method(#getDouble, [key])) as double?);
  @override
  _i3.Future<void> deleteKey(String? key) => (super.noSuchMethod(
      Invocation.method(#deleteKey, [key]),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
  @override
  bool containsKey(String? key) =>
      (super.noSuchMethod(Invocation.method(#containsKey, [key]),
          returnValue: false) as bool);
  @override
  _i3.Future<void> setIsDark({bool? value}) => (super.noSuchMethod(
      Invocation.method(#setIsDark, [], {#value: value}),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> clearPref(_i2.SharePrefsAttribute? attribute) =>
      (super.noSuchMethod(Invocation.method(#clearPref, [attribute]),
              returnValue: _i3.Future<void>.value(),
              returnValueForMissingStub: _i3.Future<void>.value())
          as _i3.Future<void>);
  @override
  _i3.Future<void> saveLocale({String? code}) => (super.noSuchMethod(
      Invocation.method(#saveLocale, [], {#code: code}),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
}
