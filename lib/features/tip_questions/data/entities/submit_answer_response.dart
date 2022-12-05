import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/features/register/domain/entities/forget_password_response.dart';

part 'submit_answer_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SubmitAnswerResponse {
  ForgotPasswordGeneral? answerTipQuestion;

  SubmitAnswerResponse({this.answerTipQuestion});

  factory SubmitAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitAnswerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitAnswerResponseToJson(this);
}
