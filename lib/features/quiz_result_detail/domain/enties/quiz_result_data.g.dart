// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizResultData _$QuizResultDataFromJson(Map<String, dynamic> json) =>
    QuizResultData(
      getResultContentGeneral: json['getResultContentGeneral'] == null
          ? null
          : GetResultContentGeneral.fromJson(
              json['getResultContentGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuizResultDataToJson(QuizResultData instance) =>
    <String, dynamic>{
      'getResultContentGeneral': instance.getResultContentGeneral,
    };
