// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponse(
      forgotPasswordGeneral: ForgotPasswordGeneral.fromJson(
          json['forgotPasswordGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForgetPasswordResponseToJson(
        ForgetPasswordResponse instance) =>
    <String, dynamic>{
      'forgotPasswordGeneral': instance.forgotPasswordGeneral,
    };

ForgotPasswordGeneral _$ForgotPasswordGeneralFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordGeneral(
      status: json['status'] as bool,
    );

Map<String, dynamic> _$ForgotPasswordGeneralToJson(
        ForgotPasswordGeneral instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
