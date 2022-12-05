// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_base_response_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiBaseResponseError _$ApiBaseResponseErrorFromJson(
        Map<String, dynamic> json) =>
    ApiBaseResponseError(
      message: json['message'] as String,
      statusCode: json['statusCode'] as int,
      errorCode: json['errorCode'] as int,
    );

Map<String, dynamic> _$ApiBaseResponseErrorToJson(
        ApiBaseResponseError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'errorCode': instance.errorCode,
    };
