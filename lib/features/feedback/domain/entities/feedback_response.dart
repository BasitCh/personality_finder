// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart'; 

part 'feedback_response.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class FeedbackResponse extends Equatable {
  FeedbackQuizResultContent? feedbackQuizResultContent;
  FeedbackResponse({this.feedbackQuizResultContent});
  factory FeedbackResponse.fromJson(Json json) => _$FeedbackResponseFromJson(json);

  Json? toJson() => _$FeedbackResponseToJson(this);
  @override
  List<Object?> get props => [feedbackQuizResultContent];
}

@JsonSerializable()
// ignore: must_be_immutable
class FeedbackQuizResultContent extends Equatable {
  bool status;
  FeedbackQuizResultContent({required this.status});
  factory FeedbackQuizResultContent.fromJson(Json json) => _$FeedbackQuizResultContentFromJson(json);

  Json? toJson() => _$FeedbackQuizResultContentToJson(this);
  @override
  List<Object?> get props => [status];
}
