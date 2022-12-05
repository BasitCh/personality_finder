import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_question_answers.dart';

part 'tip_question.g.dart';

@JsonSerializable(explicitToJson: true)
class TipQuestion {
  String? id;
  int? awarenessScore;
  String? question;
  int? questionOrder;
  String? questionType;
  List<TipQuestionAnswers>? tipQuestionAnswers;

  TipQuestion(
      {this.id,
      this.awarenessScore,
      this.question,
      this.questionOrder,
      this.questionType,
      this.tipQuestionAnswers});

  factory TipQuestion.fromJson(Map<String, dynamic> json) =>
      _$TipQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$TipQuestionToJson(this);
}
