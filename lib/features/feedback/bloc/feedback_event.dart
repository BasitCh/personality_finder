part of 'feedback_bloc.dart';

abstract class FeedbackEvent extends Equatable {
  const FeedbackEvent();

  @override
  List<Object> get props => [];
}

class FeedbackGive extends FeedbackEvent {
  final int id;
  final bool feedbackStatus;

  const FeedbackGive({required this.id, required this.feedbackStatus});
}

class SubmitTipFeedback extends FeedbackEvent {
  final int id;
  final bool feedbackStatus;

  const SubmitTipFeedback({required this.id, required this.feedbackStatus});
}
