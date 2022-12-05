// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/exceptions/bad_request_error.dart';
import 'package:morphosis_template/core/global/exceptions/network_error.dart';
import 'package:morphosis_template/generated/locale_keys.g.dart';

import '../interceptors/network_error_interceptor_test.dart';

Future<void> main() async {
  late BadRequestError badRequestError;

  group('BadRequestError', () {
    setUp(() {
      badRequestError = BadRequestError(dioError, statusCode: '400');
    });

    test(
        'getErrorcode should return both status an status code value if statusCode is passed',
        () async {
      final errorCode = badRequestError.getErrorCode;
      expect(errorCode, '400 [400]');
    });

    test('getErrorcode should return error code if status code is null',
        () async {
      // arrange
      badRequestError = BadRequestError(
        dioError,
      );
      final errorCode = badRequestError.getErrorCode;
      // assert
      expect(errorCode, '400');
    });

    test('getErrorcode should return error code', () async {
      // act
      final errorMessage = badRequestError.getLocalizedKey();
      // assert
      expect(errorMessage, LocaleKeys.error_bad_request);
    });

    test('static parseError should return BadRequestError', () async {
      // act
      final badRequestError = BadRequestError.parseError(dioError);
      // assert
      expect(badRequestError, isA<BadRequestError>());
      expect(badRequestError, isA<NetworkError>());
    });
  });
}
