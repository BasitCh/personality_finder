// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'get_user_details.dart';

part 'user_details_data.g.dart';

@JsonSerializable()
class UserDetailsData {
  GetUserDetails? getMyUserDetails;

  UserDetailsData({this.getMyUserDetails});

  factory UserDetailsData.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsDataToJson(this);
}
