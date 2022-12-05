// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipResponse _$TipResponseFromJson(Map<String, dynamic> json) => TipResponse(
      getMyTips: json['getMyTips'] == null
          ? null
          : GetMyTips.fromJson(json['getMyTips'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TipResponseToJson(TipResponse instance) =>
    <String, dynamic>{
      'getMyTips': instance.getMyTips?.toJson(),
    };
