// Flutter imports:
// Package imports:
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../database/hive_setup.dart';
import '../entities/api_base_response.dart';
import '../error/failures.dart';
import '../util/logging/logging.dart';

class ApiServicesHelper {
  Future<Either<Failure, T>> getDataOrFailure<T>({
    required Function function,
  }) async {
    try {
      final dynamic response = await function() as T;
      if (response is ApiBaseResponse && response.error == null) {
        return right(response as T);
      } else if (response.error != null && response.statusCode == 401) {
        return left(ResponseFailure(
            error: response.data, errorCode: response.statusCode as int));
      } else if (response.statusCode == 1401) {
        return await getDataOrFailure<T>(function: function);
      } else if (response.statusCode == 200) {
        return right(response.data as T);
      }
      //Dunno why this is done
      else if (response.statusCode == 201 || response.statusCode == 204) {
        return right(response as T);
      }
      logger.debug('Parsing exception: ${response.statusCode}');
      return left(ResponseFailure(
          error: response.data, errorCode: response.statusCode as int));
    } on InternetFailureException catch (intFailure) {
      final result = await getDataFromLocal<T>(
        request: intFailure.baseRequest,
        failure: InternetFailure(),
      );
      return result;
    } on ResponseFailureException catch (resFailure) {
      final result = await getDataFromLocal<T>(
        request: resFailure.baseRequest!,
        failure: ResponseFailure(
            error: resFailure.error,
            errorCode: resFailure.error!.errorCode,
            errorData: ErrorData(message: resFailure.error!.message)),
      );
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return Left(
        ResponseFailure(error: 'Something went wrong..', errorCode: 0),
      );
    }
  }

  Future<Either<Failure, T>> getDataFromLocal<T>({
    required RequestOptions request,
    Failure? failure,
  }) async {
    assert(failure != null);
    T? response;

    if (request.method == 'GET') {
      final item = await HiveSetup.getItem<T>(request.path, request.path);

      response = item;
    }

    if (response != null) {
      return right(response);
    } else {
      return left(
        failure ??
            ResponseFailure(error: 'Something went wrong..', errorCode: 0),
      );
    }
  }
}
