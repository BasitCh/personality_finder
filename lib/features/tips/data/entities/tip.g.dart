// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tip _$TipFromJson(Map<String, dynamic> json) => Tip(
      id: json['id'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      awarenessScore: json['awarenessScore'] as int?,
      category: json['category'] as String?,
      publishDate: json['publishDate'] as String?,
      status: json['status'] as String?,
      title: json['title'] as String?,
      userFeedback: json['userFeedback'] as bool?,
      tipQuestions: (json['tipQuestions'] as List<dynamic>?)
          ?.map((e) => TipQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      quizResultContent: json['quizResultContent'] == null
          ? null
          : QuizResultContent.fromJson(
              json['quizResultContent'] as Map<String, dynamic>),
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TipToJson(Tip instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'awarenessScore': instance.awarenessScore,
      'category': instance.category,
      'publishDate': instance.publishDate,
      'status': instance.status,
      'title': instance.title,
      'userFeedback': instance.userFeedback,
      'tipQuestions': instance.tipQuestions?.map((e) => e.toJson()).toList(),
      'quizResultContent': instance.quizResultContent?.toJson(),
      'company': instance.company?.toJson(),
    };
