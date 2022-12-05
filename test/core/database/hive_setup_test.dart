// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

// Project imports:
import 'package:morphosis_template/core/database/hive_setup.dart';
import 'package:morphosis_template/core/global/exceptions/key_not_found_error.dart';

void main() {
  final path = Directory.current.path;
  Hive.init(path);

  group('Hive', () {
    test('should get item added to hive db', () async {
      await HiveSetup.addBox('test-key', 'test-box');
      await HiveSetup.put('test-box', 'test-key', 'testing values');

      final hiveOutput =
          await HiveSetup.getItem<String>('test-box', 'test-key');

      expect(hiveOutput, 'testing values');
    });

    test('should return true if containsKey() method contains key', () async {
      await HiveSetup.addBox('test-key', 'test-box');
      await HiveSetup.put('test-box', 'test-key', 'testing values');

      final isContain =
          await HiveSetup.containsKey<String>('test-box', 'test-key');
      expect(isContain, true);
    });

    test('should return true if containsKey method contains key', () async {
      // act
      final isContain =
          await HiveSetup.containsKey<String>('test-box', 'test-key');
      // assert
      expect(isContain, true);
    });

    test('should return false if containsKey method contains key', () async {
      // act
      final isContain =
          await HiveSetup.containsKey<String>('test-box', 'fake-key');
      // assert
      expect(isContain, false);
    });

    test('should throw error  if data is not found in db', () async {
      expect(() => HiveSetup.getItem<String>('test-box', 'fake-key'),
          throwsA(isA<KeyNotFoundError>()));
    });

    test('should return LazyBox instance if open box is called', () async {
      final result = await HiveSetup.openBox(
        'test-box',
      );
      expect(result, isA<LazyBox>());
    });
  });
}
