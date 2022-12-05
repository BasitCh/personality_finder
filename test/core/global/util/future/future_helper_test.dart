// Dart imports:
import 'dart:typed_data';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/future/future_helper.dart';

void main() {
  Future<int> testInt() async {
    return 1;
  }

  Future<String> testString() async {
    return '2';
  }

  Future<bool> testbool() async {
    return true;
  }

  Future<double> testDouble() async {
    return 4.0;
  }

  Future<Uint64List> testUint64List() async {
    return Uint64List.fromList([0, 1, 2]);
  }

  Future<Set> testSet() async {
    return <int>{6, 7};
  }

  Future<num> testNum() async {
    return 7;
  }

  group('Future helper', () {
    test('should return proper lenght ,data and type for Tuple2', () async {
      final result = await await2(testInt(), testString());
      expect(result.item1, isA<int>());
      expect(result.item2, isA<String>());
      expect(result.toList(), [1, '2']);
      expect(result.toList().length, 2);
    });

    test('should return proper lenght ,data and type for Tuple3', () async {
      final result = await await3(testInt(), testString(), testbool());
      expect(result.item1, isA<int>());
      expect(result.item2, isA<String>());
      expect(result.item3, isA<bool>());
      expect(result.toList(), [1, '2', true]);
      expect(result.toList().length, 3);
    });

    test('should return proper lenght ,data and type for Tuple4', () async {
      final result = await await3(testInt(), testString(), testbool());
      expect(result.item1, isA<int>());
      expect(result.item2, isA<String>());
      expect(result.item3, isA<bool>());
      expect(result.toList(), [1, '2', true]);
      expect(result.toList().length, 3);
    });

    test('should return proper lenght ,data and type for Tuple5', () async {
      final result = await await5(
          testInt(), testString(), testbool(), testDouble(), testUint64List());
      expect(result.item1, isA<int>());
      expect(result.item2, isA<String>());
      expect(result.item3, isA<bool>());
      expect(result.item4, isA<double>());
      expect(result.item5, isA<Uint64List>());
      expect(result.toList(), [
        1,
        '2',
        true,
        4.0,
        Uint64List.fromList([0, 1, 2])
      ]);
      expect(result.toList().length, 5);
    });
    test('should return proper lenght ,data and type for Tuple6', () async {
      final result = await await6(testInt(), testString(), testbool(),
          testDouble(), testUint64List(), testSet());
      expect(result.item1, isA<int>());
      expect(result.item2, isA<String>());
      expect(result.item3, isA<bool>());
      expect(result.item4, isA<double>());
      expect(result.item5, isA<Uint64List>());
      expect(result.item6, isA<Set>());
      expect(result.toList(), [
        1,
        '2',
        true,
        4.0,
        Uint64List.fromList([0, 1, 2]),
        <int>{6, 7}
      ]);
      expect(result.toList().length, 6);
    });

    test('should return proper lenght ,data and type for Tuple7', () async {
      final result = await await7(testInt(), testString(), testbool(),
          testDouble(), testUint64List(), testSet(), testNum());
      expect(result.item1, isA<int>());
      expect(result.item2, isA<String>());
      expect(result.item3, isA<bool>());
      expect(result.item4, isA<double>());
      expect(result.item5, isA<Uint64List>());
      expect(result.item6, isA<Set>());
      expect(result.item7, isA<num>());

      expect(result.toList(), [
        1,
        '2',
        true,
        4.0,
        Uint64List.fromList([0, 1, 2]),
        <int>{6, 7},
        7
      ]);
      expect(result.toList().length, 7);
    });
  });
}
