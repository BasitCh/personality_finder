// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionData _$VersionDataFromJson(Map<String, dynamic> json) => VersionData(
      androidMiniVersionCode: json['androidMiniVersionCode'] as int,
      androidLatestVersionCode: json['androidLatestVersionCode'] as int,
      iosMiniVersionCode: json['iosMiniVersionCode'] as int,
      iosLatestVersionCode: json['iosLatestVersionCode'] as int,
      changeLog: (json['changeLog'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$VersionDataToJson(VersionData instance) =>
    <String, dynamic>{
      'androidMiniVersionCode': instance.androidMiniVersionCode,
      'androidLatestVersionCode': instance.androidLatestVersionCode,
      'iosMiniVersionCode': instance.iosMiniVersionCode,
      'iosLatestVersionCode': instance.iosLatestVersionCode,
      'changeLog': instance.changeLog,
    };
