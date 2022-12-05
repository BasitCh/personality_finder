// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackResponse _$FeedbackResponseFromJson(Map<String, dynamic> json) =>
    FeedbackResponse(
      feedbackQuizResultContent: json['feedbackQuizResultContent'] == null
          ? null
          : FeedbackQuizResultContent.fromJson(
              json['feedbackQuizResultContent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackResponseToJson(FeedbackResponse instance) =>
    <String, dynamic>{
      'feedbackQuizResultContent': instance.feedbackQuizResultContent,
    };

FeedbackQuizResultContent _$FeedbackQuizResultContentFromJson(
        Map<String, dynamic> json) =>
    FeedbackQuizResultContent(
      status: json['status'] as bool,
    );

Map<String, dynamic> _$FeedbackQuizResultContentToJson(
        FeedbackQuizResultContent instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
