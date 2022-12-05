part of 'submit_result_bloc.dart';
abstract class SubmitResultState extends Equatable {
  const SubmitResultState();
  @override
  List<Object> get props => [];
}

class SubmitQuizInitial extends SubmitResultState {}

class SubmitQuizUploading extends SubmitResultState {
  const SubmitQuizUploading();
}
class SubmitQuizSuccess extends SubmitResultState {
  final SubmitQuizData submitQuizData;
  const SubmitQuizSuccess({
    required this.submitQuizData,
  });
 
}

class SubmitQuizFailure extends SubmitResultState {
  final String failure;

  const SubmitQuizFailure(this.failure);
}