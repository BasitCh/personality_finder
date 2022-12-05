class QuizAnswersModel {
  final int? questionId;
  final int? answerId;
  QuizAnswersModel({
    this.questionId,
    this.answerId,
  });
  Map<String, dynamic> toJSON() {
    return <String, int>{
      'questionId': questionId!,
      'answerId': answerId!,
    };
  }
}
