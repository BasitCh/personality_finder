// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizResultContent _$QuizResultContentFromJson(Map<String, dynamic> json) =>
    QuizResultContent(
      boldDescription: json['boldDescription'] as String?,
      category: json['category'] as String?,
      colorCode: json['colorCode'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      personalityType: json['personalityType'] as String?,
      title: json['title'] as String?,
      userFeedback: json['userFeedback'] as bool?,
    );

Map<String, dynamic> _$QuizResultContentToJson(QuizResultContent instance) =>
    <String, dynamic>{
      'boldDescription': instance.boldDescription,
      'category': instance.category,
      'colorCode': instance.colorCode,
      'description': instance.description,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'personalityType': instance.personalityType,
      'title': instance.title,
      'userFeedback': instance.userFeedback,
    };
