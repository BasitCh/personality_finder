// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/entities/api_base_response_error.dart';

import '../../../json_reader.dart';

Future<void> main() async {
  late ApiBaseResponseError apiBaseResponseError;

  group('ApiBaseResponseError', () {
    setUp(() {
      apiBaseResponseError = const ApiBaseResponseError(
          errorCode: 200, message: 'success', statusCode: 200);
    });
    test('should return proper output when tojson and fromjson is called',
        () async {
      // arrange
      final encodedJResp = fixture('response_error.json');
      final decodedResp = json.decode(encodedJResp) as Map<String, dynamic>;

      // act
      final result = ApiBaseResponseError.fromJson(decodedResp);

      // assert
      expect(result, isA<ApiBaseResponseError>());
      expect(decodedResp, result.toJson());
      expect(result, apiBaseResponseError);
    });
  });
}
