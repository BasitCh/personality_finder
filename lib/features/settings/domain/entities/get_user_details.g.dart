// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDetails _$GetUserDetailsFromJson(Map<String, dynamic> json) =>
    GetUserDetails(
      awarenessScore: json['awarenessScore'],
      anonymized: json['anonymized'],
      id: json['id'] as String,
      email: json['email'] as String?,
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserDetailsToJson(GetUserDetails instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('awarenessScore', instance.awarenessScore);
  writeNotNull('anonymized', instance.anonymized);
  writeNotNull('company', instance.company?.toJson());
  writeNotNull('profile', instance.profile?.toJson());
  return val;
}
