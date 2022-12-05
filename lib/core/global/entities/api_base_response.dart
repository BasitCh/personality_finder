// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../const.dart';
import 'api_base_response_error.dart';

part 'api_base_response.g.dart';

@JsonSerializable()
// ignore: avoid_implementing_value_types
class ApiBaseResponse<T> extends Equatable {
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final T data;
  final int statusCode;
  final String message;
  final ApiBaseResponseError? error;

  const ApiBaseResponse({
    required this.data,
    required this.message,
    required this.statusCode,
    this.error,
  });

  factory ApiBaseResponse.fromJson(Json json) =>
      _$ApiBaseResponseFromJson(json);

  Json toJson() => _$ApiBaseResponseToJson(this);

  @override
  List<Object> get props => [data!, message, statusCode];

  @override
  // TODO: implement stringify
  bool? get stringify {
    throw UnimplementedError();
  }
}

T _dataFromJson<T>(Map<String, dynamic> input) => input['data'] as T;

Map<String, dynamic> _dataToJson<T>(T input) => <String, dynamic>{
      'data': input,
    };
