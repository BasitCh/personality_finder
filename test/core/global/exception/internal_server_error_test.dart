// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/exceptions/internal_server_error.dart';
import 'package:morphosis_template/generated/locale_keys.g.dart';

import '../interceptors/network_error_interceptor_test.dart';

Future<void> main() async {
  late InternalServerError internalServerError;

  group('BadRequestError', () {
    setUp(() {
      internalServerError = InternalServerError(dioError, statusCode: '500');
    });

    test(
        'getErrorcode should return both status an status code value if statusCode is passed',
        () async {
      final errorCode = internalServerError.getErrorCode;
      expect(errorCode, '500 [500]');
    });

    test('getErrorcode should return error code if status code is null',
        () async {
      // arrange
      internalServerError = InternalServerError(
        dioError,
      );
      final errorCode = internalServerError.getErrorCode;
      // assert
      expect(errorCode, '500');
    });

    test('getErrorcode should return error code', () async {
      // act
      final errorMessage = internalServerError.getLocalizedKey();
      // assert
      expect(errorMessage, LocaleKeys.error_internal_server);
    });
  });
}
