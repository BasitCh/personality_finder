// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshData _$RefreshDataFromJson(Map<String, dynamic> json) => RefreshData(
      refreshTokenGeneral: json['refreshTokenGeneral'] == null
          ? null
          : RefreshTokenGeneral.fromJson(
              json['refreshTokenGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefreshDataToJson(RefreshData instance) =>
    <String, dynamic>{
      'refreshTokenGeneral': instance.refreshTokenGeneral,
    };

RefreshTokenGeneral _$RefreshTokenGeneralFromJson(Map<String, dynamic> json) =>
    RefreshTokenGeneral(
      token: json['token'] as String,
      expiresIn: json['expiresIn'] as int?,
    );

Map<String, dynamic> _$RefreshTokenGeneralToJson(
        RefreshTokenGeneral instance) =>
    <String, dynamic>{
      'expiresIn': instance.expiresIn,
      'token': instance.token,
    };
