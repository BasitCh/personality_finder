import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/features/quiz_tasking/data/model/quiz_answer_model.dart';

@immutable
class SubmitAnswer extends Equatable {
  final List<QuizAnswersModel> quizAnswerList;
  const SubmitAnswer({required this.quizAnswerList});
  @override
  List<Object?> get props => [QuizAnswersModel];
}
