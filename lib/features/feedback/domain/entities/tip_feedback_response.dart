import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/features/feedback/domain/entities/feedback_response.dart';

part 'tip_feedback_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TipFeedBackResponse {
  FeedbackQuizResultContent? feedbackTip;

  TipFeedBackResponse({this.feedbackTip});

  factory TipFeedBackResponse.fromJson(Map<String, dynamic> json) =>
      _$TipFeedBackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TipFeedBackResponseToJson(this);
}
