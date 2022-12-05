// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest() = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.defaultException(String message) =
      DefaultException;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.invalidUrlAddress() = InvalidUrlAddress;

  const factory NetworkExceptions.websiteAlreadyExists() = WebsiteAlreadyExists;

  static NetworkExceptions? getDioException(dynamic error) {
    if (error is Exception) {
      try {
        NetworkExceptions? networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.other:
              networkExceptions = NetworkExceptions.defaultException(
                  error.message.isNotEmpty
                      ? error.message
                      : error.response!.statusMessage.toString());
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.response:
              if (error.response!.statusCode == 400) {
                networkExceptions =
                    const NetworkExceptions.unauthorisedRequest();
              } else if (error.response!.statusCode == 401) {
                networkExceptions =
                    const NetworkExceptions.unauthorisedRequest();
              } else if (error.response!.statusCode == 403) {
                networkExceptions =
                    const NetworkExceptions.unauthorisedRequest();
              } else if (error.response!.statusCode == 404) {
                networkExceptions =
                    const NetworkExceptions.notFound('Not found');
              } else if (error.response!.statusCode == 409) {
                networkExceptions = const NetworkExceptions.conflict();
              } else if (error.response!.statusCode == 408) {
                networkExceptions = const NetworkExceptions.requestTimeout();
              } else if (error.response!.statusCode == 500) {
                networkExceptions =
                    const NetworkExceptions.internalServerError();
              } else if (error.response!.statusCode == 503) {
                networkExceptions =
                    const NetworkExceptions.serviceUnavailable();
              } else {
                final responseCode = error.response!.statusCode;
                networkExceptions = NetworkExceptions.defaultError(
                  'Received invalid status code: $responseCode',
                );
              }

              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (e) {
        debugPrint(e.toString());
        // Helper.printError(e.toString());
        return const NetworkExceptions.formatException();
      } catch (e) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = '';
    networkExceptions.when(notImplemented: () {
      errorMessage = 'Not Implemented';
    }, requestCancelled: () {
      errorMessage = 'Request Cancelled';
    }, internalServerError: () {
      errorMessage = 'Internal Server Error';
    }, notFound: (reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = 'Service unavailable';
    }, methodNotAllowed: () {
      errorMessage = 'Method Allowed';
    }, badRequest: () {
      errorMessage = 'Bad request';
    }, unauthorisedRequest: () {
      errorMessage = 'Unauthorised request';
    }, unexpectedError: () {
      errorMessage = 'Unexpected error occurred';
    }, requestTimeout: () {
      errorMessage = 'Connection request timeout';
    }, noInternetConnection: () {
      errorMessage = 'No internet connection';
    }, conflict: () {
      errorMessage = 'Error due to a conflict';
    }, sendTimeout: () {
      errorMessage = 'Send timeout in connection with API server';
    }, unableToProcess: () {
      errorMessage = 'Unprocessable Entity';
    }, defaultError: (error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = 'Unexpected error occurred';
    }, defaultException: (data) {
      errorMessage = data.isNotEmpty ? data : 'Something went wrong.';
    }, notAcceptable: () {
      errorMessage = 'Not acceptable';
    }, invalidUrlAddress: () {
      errorMessage = 'Invalid website address.';
    }, websiteAlreadyExists: () {
      errorMessage = 'Website already exists or linked with this account.';
    });
    return errorMessage;
  }
}
