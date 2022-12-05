class SubmitQuizQueires {
  static String submitQuizQuery(String quizAnswerList) {
    return '''
     mutation {
      calculateQuizResult(
        quizAnswers: $quizAnswerList
    ) {
        chronotype {
            id
            colorCode
            title
            description
            imageUrl
            iconUrl
            imageSignedId
        }
        diligent
        hFactor
        mbti
        psychotype {
            primaryTrait {
                id
                colorCode
                title
                description
                imageUrl
                iconUrl
                imageSignedId
            
            }
            secondaryTrait {
                id
                colorCode
                title
                description
                imageUrl
                iconUrl
                imageSignedId
            }
        }
    }
  }
''';
  }
}
