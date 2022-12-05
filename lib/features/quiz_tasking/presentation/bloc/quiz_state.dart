part of 'quiz_bloc.dart';
abstract class QuizState extends Equatable {
  const QuizState();
  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {
  const QuizLoading();
}
class QuizFetchSuccess extends QuizState {
  final QuizData quizData;

  const QuizFetchSuccess({required this.quizData});
}

class QuizFetchFailure extends QuizState {
  final String failure;

  const QuizFetchFailure(this.failure);
}


 

 