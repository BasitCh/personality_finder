// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) => QuizResponse(
      getQuizQuestions: (json['getQuizQuestions'] as List<dynamic>)
          .map((e) => GetQuizQuestions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizResponseToJson(QuizResponse instance) =>
    <String, dynamic>{
      'getQuizQuestions': instance.getQuizQuestions,
    };

GetQuizQuestions _$GetQuizQuestionsFromJson(Map<String, dynamic> json) =>
    GetQuizQuestions(
      id: json['id'] as String,
      question: json['question'] as String,
      questionOrder: json['questionOrder'] as int,
      quizAnswers: (json['quizAnswers'] as List<dynamic>)
          .map((e) => QuizAnswers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetQuizQuestionsToJson(GetQuizQuestions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'questionOrder': instance.questionOrder,
      'quizAnswers': instance.quizAnswers,
    };

QuizAnswers _$QuizAnswersFromJson(Map<String, dynamic> json) => QuizAnswers(
      json['answer'] as String?,
      json['answerOrder'] as int?,
      json['id'] as String?,
      json['imageSignedId'] as String?,
      json['imageUrl'] as String?,
    );

Map<String, dynamic> _$QuizAnswersToJson(QuizAnswers instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'answerOrder': instance.answerOrder,
      'id': instance.id,
      'imageSignedId': instance.imageSignedId,
      'imageUrl': instance.imageUrl,
    };
