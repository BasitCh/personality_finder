// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_tips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyTips _$GetMyTipsFromJson(Map<String, dynamic> json) => GetMyTips(
      paginationInfo: json['paginationInfo'] == null
          ? null
          : PaginationInfo.fromJson(
              json['paginationInfo'] as Map<String, dynamic>),
      tips: (json['tips'] as List<dynamic>?)
          ?.map((e) => Tip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMyTipsToJson(GetMyTips instance) => <String, dynamic>{
      'paginationInfo': instance.paginationInfo?.toJson(),
      'tips': instance.tips?.map((e) => e.toJson()).toList(),
    };
