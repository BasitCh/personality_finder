// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';

// Project imports:
import 'package:morphosis_template/core/database/hive_setup.dart';
import 'package:morphosis_template/core/global/entities/api_base_response.dart';
import 'package:morphosis_template/core/global/entities/api_base_response_error.dart';
import 'package:morphosis_template/core/global/error/failures.dart';
import 'package:morphosis_template/core/global/helpers/web_services_helper.dart';

@GenerateMocks([ApiServicesHelper])
Future<void> main() async {
  final path = Directory.current.path;

  Hive.init(path);

  ApiServicesHelper? apiServicesHelper;
  setUp(() {
    apiServicesHelper = ApiServicesHelper();
  });

  group('getDataOrFailure', () {
    test('should return success', () async {
      final result = await apiServicesHelper!
          .getDataOrFailure<ApiBaseResponse<Response<Map<String, dynamic>>>>(
              function: () => demoFunction(successResponse));

      expect(result.isRight(), true);
    });
    test('should throw ResponseFailure error if status code is 401', () async {
      ResponseFailure? respfailure;
      final result = await apiServicesHelper!
          .getDataOrFailure<ApiBaseResponse<Response<Map<String, dynamic>>>>(
              function: () => demoFunction(failureResponse));
      result.fold((l) => respfailure = l as ResponseFailure, (r) => null);
      expect(result.isLeft(), true);
      expect(respfailure, isA<ResponseFailure>());
    });

    test('should return data from hive storage', () async {
      const name = 'baksman';
      late String expectedOutput;
      await HiveSetup.put('google.com', 'google.com', name);
      final result = await apiServicesHelper!
          .getDataOrFailure<String>(function: reponseFailure);
      result.fold((l) => null, (r) => expectedOutput = r);
      expect(expectedOutput, isA<String>());
      expect(expectedOutput, name);
    });
  });
}

final successResponse = ApiBaseResponse(
    data: Response(
        data: <String, dynamic>{},
        statusCode: 200,
        requestOptions: RequestOptions(path: 'google.com')),
    statusCode: 200,
    message: 'succes');

final failureResponse = ApiBaseResponse(
    error: apiBaseResponse,
    // error:UnAuthorizedError(DioError(requestOptions: RequestOptions(path: '')))
    data: Response(
        data: <String, dynamic>{},
        statusCode: 200,
        requestOptions: RequestOptions(path: 'google.com')),
    statusCode: 401,
    message: '401');
Future demoFunction(ApiBaseResponse response) async {
  return Future<ApiBaseResponse>.value(response);
}

const apiBaseResponse = ApiBaseResponseError(
    message: 'Unauthorised', statusCode: 401, errorCode: 401);

Future reponseFailure() async {
  throw ResponseFailureException(
      error: apiBaseResponse, baseRequest: RequestOptions(path: 'google.com'));
}
