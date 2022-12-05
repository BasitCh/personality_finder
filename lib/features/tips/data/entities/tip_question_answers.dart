import 'package:json_annotation/json_annotation.dart';

part 'tip_question_answers.g.dart';

@JsonSerializable(explicitToJson: true)
class TipQuestionAnswers {
  String? answer;
  String? id;
  String? imageUrl;
  @JsonKey(ignore: true)
  bool? isSelected;

  TipQuestionAnswers({this.answer, this.id, this.imageUrl, this.isSelected = false});

  factory TipQuestionAnswers.fromJson(Map<String, dynamic> json) =>
      _$TipQuestionAnswersFromJson(json);

  Map<String, dynamic> toJson() => _$TipQuestionAnswersToJson(this);
}
