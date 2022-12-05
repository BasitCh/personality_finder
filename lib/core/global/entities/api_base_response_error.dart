// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../const.dart';

part 'api_base_response_error.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
// ignore: avoid_implementing_value_types
class ApiBaseResponseError extends Equatable {
  final String message;
  final int statusCode;
  final int errorCode;

  const ApiBaseResponseError({
    required this.message,
    required this.statusCode,
    required this.errorCode,
  });

  static const fromJson = _$ApiBaseResponseErrorFromJson;

  Json toJson() => _$ApiBaseResponseErrorToJson(this);

  @override
  List<Object> get props => [message, statusCode, errorCode];

  @override
  bool get stringify => true;
}
