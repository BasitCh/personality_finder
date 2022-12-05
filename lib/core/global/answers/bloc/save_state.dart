part of 'save_bloc.dart';

abstract class SaveAnswerState extends Equatable{
  const SaveAnswerState();
  @override
  List<Object> get props => [];
}
class SaveAnswerInitialize extends SaveAnswerState{
}
class SavedSuccess extends SaveAnswerState {
  final String saveAnswerData; 
  
  const SavedSuccess({
    required this.saveAnswerData,
  });
  
}
class SavedFail extends SaveAnswerState {
  final String errorMessage;
  const SavedFail({
    required this.errorMessage,
  });

}
