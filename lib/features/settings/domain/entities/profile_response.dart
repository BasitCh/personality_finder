// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../login/domain/entities/profile.dart';

part 'profile_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileResponse {
  Profile? updateProfile;

  ProfileResponse({this.updateProfile});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
