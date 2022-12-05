// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiBaseResponse<T> _$ApiBaseResponseFromJson<T>(Map<String, dynamic> json) =>
    ApiBaseResponse<T>(
      data: _dataFromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
      statusCode: json['statusCode'] as int,
      error: json['error'] == null
          ? null
          : ApiBaseResponseError.fromJson(
              json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiBaseResponseToJson<T>(ApiBaseResponse<T> instance) =>
    <String, dynamic>{
      'data': _dataToJson(instance.data),
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
    };
