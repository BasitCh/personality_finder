// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      loginGeneral:
          LoginGeneral.fromJson(json['loginGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'loginGeneral': instance.loginGeneral,
    };

LoginGeneral _$LoginGeneralFromJson(Map<String, dynamic> json) => LoginGeneral(
      token: json['token'] as String,
      expiresIn: json['expiresIn'] as int,
    );

Map<String, dynamic> _$LoginGeneralToJson(LoginGeneral instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresIn': instance.expiresIn,
    };
