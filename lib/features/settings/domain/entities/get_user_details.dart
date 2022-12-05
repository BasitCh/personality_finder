// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../login/domain/entities/company.dart';
import '../../../login/domain/entities/profile.dart';

part 'get_user_details.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class GetUserDetails {
  String id;
  String? email;
  dynamic awarenessScore;
  dynamic anonymized;

  Company? company;
  Profile? profile;

  GetUserDetails(
      {required this.awarenessScore,
      required this.anonymized,
      required this.id,
      this.email,
      this.company,
      this.profile});

  factory GetUserDetails.fromJson(Map<String, dynamic> json) =>
      _$GetUserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserDetailsToJson(this);
}
