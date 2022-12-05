// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitQuizData _$SubmitQuizDataFromJson(Map<String, dynamic> json) =>
    SubmitQuizData(
      calculateQuizResult: json['calculateQuizResult'] == null
          ? null
          : CalculateQuizResult.fromJson(
              json['calculateQuizResult'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitQuizDataToJson(SubmitQuizData instance) =>
    <String, dynamic>{
      'calculateQuizResult': instance.calculateQuizResult,
    };
