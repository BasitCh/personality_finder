// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/entities/api_base_response.dart';
import 'package:morphosis_template/core/global/entities/api_base_response_error.dart';

import '../../../json_reader.dart';

Future<void> main() async {
  late ApiBaseResponse apiBaseResponse;

  group('ApiBaseResponse', () {
    setUp(() {
      apiBaseResponse = const ApiBaseResponse<Map<String, dynamic>>(
        message: 'success',
        statusCode: 200,
        data: <String, dynamic>{'title': 'this is the first title'},
        error: ApiBaseResponseError(
            errorCode: 200, message: 'success', statusCode: 200),
      );
    });
    test('should return proper output when tojson and fromjson is called',
        () async {
      // arrange
      final encodedJResp = fixture('base_response.json');
      final decodedResp = json.decode(encodedJResp) as Map<String, dynamic>;

      // act
      final result =
          ApiBaseResponse<Map<String, dynamic>>.fromJson(decodedResp);

      // assert
      expect(result, isA<ApiBaseResponse>());
      expect(decodedResp, result.toJson());
      expect(result, apiBaseResponse);
    });
  });
}
