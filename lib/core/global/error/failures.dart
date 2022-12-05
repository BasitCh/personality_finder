// Package imports:
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../entities/api_base_response_error.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class RefreshTokenFailure extends Failure {
  final String error;
  RefreshTokenFailure({required this.error});
  @override
  List<Object> get props => [error];
}

// General failures
class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {}

class InternetFailure extends Failure {}

class EmailValidationFailure extends Failure {
  final String error;
  EmailValidationFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class LoginFailure extends Failure {
  final Object error;
  LoginFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class LogoutFailure extends Failure {}

class RegisterFailure extends Failure {
  final Object error;
  RegisterFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class ResponseFailure extends Failure {
  final Object? error;
  final int? errorCode;
  final ErrorData? errorData;
  ResponseFailure({
    this.errorCode,
    this.errorData,
    this.error,
  });
  @override
  List<Object> get props => [errorCode!, error!];
}

class ErrorData extends Failure {
  final String message;

  ErrorData({required this.message});
  @override
  List<Object> get props => [message];
}

class InternetFailureException implements Exception {
  final String message = 'There is no internet connection available';

  final RequestOptions baseRequest;

  InternetFailureException({
    required this.baseRequest,
  });

  @override
  String toString() => message;
}

class ResponseFailureException implements Exception {
  ResponseFailureException({
    required this.baseRequest,
    required this.error,
  });

  final ApiBaseResponseError? error;
  final RequestOptions? baseRequest;

  @override
  String toString() => error!.message;
}
