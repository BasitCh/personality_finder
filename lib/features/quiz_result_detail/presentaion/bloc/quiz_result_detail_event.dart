part of 'quiz_result_detail_bloc.dart';

abstract class QuizResultDetailEvent extends Equatable {
  const QuizResultDetailEvent();
  @override
  List<Object> get props => [];
}

class QuizResultDetailFetch extends QuizResultDetailEvent {
  final int quizResultContentId;

  const QuizResultDetailFetch({required this.quizResultContentId});

  @override
  List<Object> get props => [];
}
