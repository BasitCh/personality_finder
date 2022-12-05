// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipQuestion _$TipQuestionFromJson(Map<String, dynamic> json) => TipQuestion(
      id: json['id'] as String?,
      awarenessScore: json['awarenessScore'] as int?,
      question: json['question'] as String?,
      questionOrder: json['questionOrder'] as int?,
      questionType: json['questionType'] as String?,
      tipQuestionAnswers: (json['tipQuestionAnswers'] as List<dynamic>?)
          ?.map((e) => TipQuestionAnswers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TipQuestionToJson(TipQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'awarenessScore': instance.awarenessScore,
      'question': instance.question,
      'questionOrder': instance.questionOrder,
      'questionType': instance.questionType,
      'tipQuestionAnswers':
          instance.tipQuestionAnswers?.map((e) => e.toJson()).toList(),
    };
