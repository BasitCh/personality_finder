// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_general.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipGeneral _$TipGeneralFromJson(Map<String, dynamic> json) => TipGeneral(
      getTipGeneral: json['getTipGeneral'] == null
          ? null
          : Tip.fromJson(json['getTipGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TipGeneralToJson(TipGeneral instance) =>
    <String, dynamic>{
      'getTipGeneral': instance.getTipGeneral?.toJson(),
    };
