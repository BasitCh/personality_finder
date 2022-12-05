// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_answer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitAnswerResponse _$SubmitAnswerResponseFromJson(
        Map<String, dynamic> json) =>
    SubmitAnswerResponse(
      answerTipQuestion: json['answerTipQuestion'] == null
          ? null
          : ForgotPasswordGeneral.fromJson(
              json['answerTipQuestion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubmitAnswerResponseToJson(
        SubmitAnswerResponse instance) =>
    <String, dynamic>{
      'answerTipQuestion': instance.answerTipQuestion?.toJson(),
    };
