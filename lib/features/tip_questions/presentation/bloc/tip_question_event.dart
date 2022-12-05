part of 'tip_question_bloc.dart';

@immutable
abstract class TipQuestionEvent {}

class InitialTipEvent extends TipQuestionEvent {}

class AnswerTipQuestion extends TipQuestionEvent {
  final SubmitAnswerRequest submitAnswerRequest;

  AnswerTipQuestion({required this.submitAnswerRequest});
}
