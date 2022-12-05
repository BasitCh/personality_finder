import 'package:json_annotation/json_annotation.dart';

part 'quiz_result_content.g.dart';

@JsonSerializable(explicitToJson: true)
class QuizResultContent {
  String? boldDescription;
  String? category;
  String? colorCode;
  String? description;
  String? id;
  String? imageUrl;
  String? personalityType;
  String? title;
  bool? userFeedback;

  QuizResultContent({
    this.boldDescription,
    this.category,
    this.colorCode,
    this.description,
    this.id,
    this.imageUrl,
    this.personalityType,
    this.title,
    this.userFeedback,
  });

  factory QuizResultContent.fromJson(Map<String, dynamic> json) =>
      _$QuizResultContentFromJson(json);

  Map<String, dynamic> toJson() => _$QuizResultContentToJson(this);
}
