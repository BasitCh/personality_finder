class QuizQueires {
  static String fetchQuizQuery() {
    return '''
    {
      getQuizQuestions{
        id
        question
        questionOrder
        quizAnswers{
          answer
          answerOrder
          id
          imageSignedId
          imageUrl
        }
  	}
  }
''';
  }
}
