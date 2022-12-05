// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip_feedback_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipFeedBackResponse _$TipFeedBackResponseFromJson(Map<String, dynamic> json) =>
    TipFeedBackResponse(
      feedbackTip: json['feedbackTip'] == null
          ? null
          : FeedbackQuizResultContent.fromJson(
              json['feedbackTip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TipFeedBackResponseToJson(
        TipFeedBackResponse instance) =>
    <String, dynamic>{
      'feedbackTip': instance.feedbackTip?.toJson(),
    };
