// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      displayName: json['displayName'] as String?,
      idToken: json['idToken'] as String?,
    );

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'idToken': instance.idToken,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
