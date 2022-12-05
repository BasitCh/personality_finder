// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_direct_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponse _$UploadImageResponseFromJson(Map<String, dynamic> json) =>
    UploadImageResponse(
      createDirectUpload: CreateDirectUpload.fromJson(
          json['createDirectUpload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadImageResponseToJson(
        UploadImageResponse instance) =>
    <String, dynamic>{
      'createDirectUpload': instance.createDirectUpload,
    };

CreateDirectUpload _$CreateDirectUploadFromJson(Map<String, dynamic> json) =>
    CreateDirectUpload(
      directUpload:
          DirectUpload.fromJson(json['directUpload'] as Map<String, dynamic>),
      signedId: json['signedId'] as String,
    );

Map<String, dynamic> _$CreateDirectUploadToJson(CreateDirectUpload instance) =>
    <String, dynamic>{
      'directUpload': instance.directUpload,
      'signedId': instance.signedId,
    };

DirectUpload _$DirectUploadFromJson(Map<String, dynamic> json) => DirectUpload(
      url: json['url'] as String,
      headers: json['headers'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DirectUploadToJson(DirectUpload instance) =>
    <String, dynamic>{
      'url': instance.url,
      'headers': instance.headers,
    };
