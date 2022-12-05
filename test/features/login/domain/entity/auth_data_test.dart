// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/features/login/domain/entities/auth_data.dart';

import '../../../../json_reader.dart';

void main() {
  final tAuthData = AuthData(
      accessToken: 'accessToken',
      refreshToken: 'refreshToken',
      displayName: 'ibrahim',
      idToken: 'idToken');

  group('AuthData', () {
    test(
      'should return a valid model when the Todo.fromJson is called',
      () async {
        // arrange
        final jsonMap =
            json.decode(fixture('auth.json')) as Map<String, dynamic>;
        // act
        final result = AuthData.fromJson(jsonMap);
        // assert
        expect(result, tAuthData);
      },
    );
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tAuthData.toJson();
        // assert
        final expectedMap = <String, dynamic>{
          'accessToken': 'accessToken',
          'refreshToken': 'refreshToken',
          'displayName': 'ibrahim',
          'idToken': 'idToken'
        };
        expect(result, expectedMap);
      },
    );
  });
}
