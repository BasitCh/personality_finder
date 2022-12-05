class ResultDetailQueries {
  static String resultDetailQueries(int quizResultContentId) {
    return '''
      {
      getResultContentGeneral(
        quizResultContentId: $quizResultContentId
      ){
        id
        category
        boldDescription
        personalityType
        colorCode
        createdAt
        description
        userFeedback
        imageUrl
        imageSignedId
        title
      }
    }
''';
  }
}
