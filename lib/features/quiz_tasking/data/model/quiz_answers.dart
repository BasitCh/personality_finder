 class QuizAnswers {
  final String questionId;
  final String answerId;
  QuizAnswers({
    required this.questionId,
    required this.answerId,
  });

  QuizAnswers.fromJson(Map<int, int> json)
      : questionId =json['questionId'].toString(),
        answerId = json['answerId'].toString();
  // method
  Map<String, String> toJson() {
    return {
      'questionId': questionId,
      'answerId': answerId,
    };
  }  
}
