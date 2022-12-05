part of 'submit_result_bloc.dart';

abstract class SubmitResultEvent extends Equatable {
  const SubmitResultEvent();
  @override
  List<Object> get props => [];
}

@immutable
class SubmitQuizUpload extends SubmitResultEvent {
  final String answerQueires;
  const SubmitQuizUpload({
    required this.answerQueires,
  });
}