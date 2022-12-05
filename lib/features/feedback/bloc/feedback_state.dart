part of 'feedback_bloc.dart';

abstract class FeedbackState extends Equatable {
  const FeedbackState();

  @override
  List<Object> get props => [];
}

class FeedbackInitial extends FeedbackState {}

class FeedbackGiveSuccess extends FeedbackState {
  final FeedbackQuizResultContent feedbackQuizResultContent;

  const FeedbackGiveSuccess({required this.feedbackQuizResultContent});
}

class FeedbackGiveFailure extends FeedbackState {
  final String failure;

  const FeedbackGiveFailure(this.failure);
}

class TipFeedbackSubmitted extends FeedbackState {
  final FeedbackQuizResultContent feedbackTip;

  const TipFeedbackSubmitted({required this.feedbackTip});
}

class TipFeedbackFailure extends FeedbackState {
  final String failure;

  const TipFeedbackFailure({required this.failure});
}
