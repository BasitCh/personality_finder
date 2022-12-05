// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsData _$UserDetailsDataFromJson(Map<String, dynamic> json) =>
    UserDetailsData(
      getMyUserDetails: json['getMyUserDetails'] == null
          ? null
          : GetUserDetails.fromJson(
              json['getMyUserDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDetailsDataToJson(UserDetailsData instance) =>
    <String, dynamic>{
      'getMyUserDetails': instance.getMyUserDetails,
    };
