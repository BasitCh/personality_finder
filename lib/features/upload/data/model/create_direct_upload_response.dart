// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';

part 'create_direct_upload_response.g.dart';

@JsonSerializable()
class UploadImageResponse extends Equatable {
  final CreateDirectUpload createDirectUpload;

  const UploadImageResponse({
    required this.createDirectUpload,
  });

  factory UploadImageResponse.fromJson(Json json) =>
      _$UploadImageResponseFromJson(json);

  Json? toJson() => _$UploadImageResponseToJson(this);

  @override
  List<Object> get props => [
        createDirectUpload,
      ];
}

@JsonSerializable()
class CreateDirectUpload extends Equatable {
  final DirectUpload directUpload;
  final String signedId;

  const CreateDirectUpload({
    required this.directUpload,
    required this.signedId,
  });

  factory CreateDirectUpload.fromJson(Json json) =>
      _$CreateDirectUploadFromJson(json);

  Json? toJson() => _$CreateDirectUploadToJson(this);

  @override
  List<Object?> get props => [
        directUpload,
        signedId,
      ];

  @override
  String toString() =>
      'CreateDirectUpload(token: $directUpload, expiresIn: $signedId)';
}

@JsonSerializable()
class DirectUpload extends Equatable {
  final String url;
  final Json headers;

  const DirectUpload({required this.url, required this.headers});

  factory DirectUpload.fromJson(Json json) => _$DirectUploadFromJson(json);

  Json? toJson() => _$DirectUploadToJson(this);

  @override
  List<Object?> get props => [
        url,
      ];

  @override
  String toString() => 'CreateDirectUpload(token: $url)';
}
