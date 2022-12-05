// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_general.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutGeneral _$LogoutGeneralFromJson(Map<String, dynamic> json) =>
    LogoutGeneral(
      logoutGeneral: json['logoutGeneral'] == null
          ? null
          : ForgotPasswordGeneral.fromJson(
              json['logoutGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LogoutGeneralToJson(LogoutGeneral instance) =>
    <String, dynamic>{
      'logoutGeneral': instance.logoutGeneral?.toJson(),
    };
