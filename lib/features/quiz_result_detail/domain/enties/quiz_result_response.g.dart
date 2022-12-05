// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizResultResponse _$QuizResultResponseFromJson(Map<String, dynamic> json) =>
    QuizResultResponse(
      getResultContentGeneral: GetResultContentGeneral.fromJson(
          json['getResultContentGeneral'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuizResultResponseToJson(QuizResultResponse instance) =>
    <String, dynamic>{
      'getResultContentGeneral': instance.getResultContentGeneral,
    };

GetResultContentGeneral _$GetResultContentGeneralFromJson(
        Map<String, dynamic> json) =>
    GetResultContentGeneral(
      id: json['id'] as String,
      category: json['category'] as String,
      boldDescription: json['boldDescription'] as String,
      personalityType: json['personalityType'] as String,
      colorCode: json['colorCode'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      userFeedback: json['userFeedback'],
    );

Map<String, dynamic> _$GetResultContentGeneralToJson(
        GetResultContentGeneral instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'boldDescription': instance.boldDescription,
      'personalityType': instance.personalityType,
      'colorCode': instance.colorCode,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'userFeedback': instance.userFeedback,
    };
