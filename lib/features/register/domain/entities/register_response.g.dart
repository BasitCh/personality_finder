// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      registerGeneral: RegisterGeneral.fromJson(
          json['registerGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'registerGeneral': instance.registerGeneral,
    };

RegisterGeneral _$RegisterGeneralFromJson(Map<String, dynamic> json) =>
    RegisterGeneral(
      token: json['token'] as String,
      expiresIn: json['expiresIn'] as int,
    );

Map<String, dynamic> _$RegisterGeneralToJson(RegisterGeneral instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresIn': instance.expiresIn,
    };
