part of 'save_bloc.dart';
 
abstract class SaveAnswerEvent extends Equatable{
  const SaveAnswerEvent();
  @override
  List<Object> get props => [];
}
 
class SaveAnswerData extends SaveAnswerEvent {
  final List<QuizAnswers> saveAnswerData; 
  const SaveAnswerData({
    required this.saveAnswerData,
  });
  
} 
