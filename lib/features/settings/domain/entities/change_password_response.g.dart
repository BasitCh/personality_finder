// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponse _$ChangePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponse(
      changePasswordGeneral: json['changePasswordGeneral'] == null
          ? null
          : ForgotPasswordGeneral.fromJson(
              json['changePasswordGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChangePasswordResponseToJson(
        ChangePasswordResponse instance) =>
    <String, dynamic>{
      'changePasswordGeneral': instance.changePasswordGeneral?.toJson(),
    };
