part of 'tip_question_bloc.dart';

@immutable
abstract class TipQuestionState {}

class TipQuestionInitial extends TipQuestionState {}

class SubmittingAnswer extends TipQuestionInitial {}

class AnswerSubmitted extends TipQuestionInitial {}

class FailedSubmittingAnswer extends TipQuestionInitial {
  final String error;

  FailedSubmittingAnswer({required this.error});
}
