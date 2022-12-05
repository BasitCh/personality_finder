// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponse _$ResetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponse(
      resetPasswordGeneral: ForgotPasswordGeneral.fromJson(
          json['resetPasswordGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResetPasswordResponseToJson(
        ResetPasswordResponse instance) =>
    <String, dynamic>{
      'resetPasswordGeneral': instance.resetPasswordGeneral,
    };
