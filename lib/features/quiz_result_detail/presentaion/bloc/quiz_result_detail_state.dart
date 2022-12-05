part of 'quiz_result_detail_bloc.dart';
 
abstract class QuizResultDetailState extends Equatable {
  const QuizResultDetailState();
  @override
  List<Object> get props => [];
}

class QuizResultDetailInitial extends QuizResultDetailState {}
 

class QuizResultDetailSuccess extends QuizResultDetailState {
  final QuizResultData quizResultData;

  const QuizResultDetailSuccess({required this.quizResultData});
}

class QuizResultDetailFailure extends QuizResultDetailState {
  final String failure;

  const QuizResultDetailFailure(this.failure);
}
