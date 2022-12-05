// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizData _$QuizDataFromJson(Map<String, dynamic> json) => QuizData(
      getQuizQuestionsList: (json['getQuizQuestionsList'] as List<dynamic>?)
          ?.map((e) => GetQuizQuestions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizDataToJson(QuizData instance) => <String, dynamic>{
      'getQuizQuestionsList': instance.getQuizQuestionsList,
    };
