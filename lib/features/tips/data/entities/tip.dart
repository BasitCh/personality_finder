import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/features/login/domain/entities/company.dart';
import 'package:morphosis_template/features/tips/data/entities/quiz_result_content.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_question.dart';

part 'tip.g.dart';

@JsonSerializable(explicitToJson: true)
class Tip {
  String? id;
  String? description;
  String? imageUrl;
  int? awarenessScore;
  String? category;
  String? publishDate;
  String? status;
  String? title;
  bool? userFeedback;
  List<TipQuestion>? tipQuestions;
  QuizResultContent? quizResultContent;
  Company? company;

  Tip(
      {this.id,
      this.description,
      this.imageUrl,
      this.awarenessScore,
      this.category,
      this.publishDate,
      this.status,
      this.title,
      this.userFeedback,
      this.tipQuestions,
      this.quizResultContent,
      this.company});

  factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);

  Map<String, dynamic> toJson() => _$TipToJson(this);
}
