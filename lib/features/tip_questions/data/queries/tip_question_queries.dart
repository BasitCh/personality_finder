
class TipQuestionQueries {
  static String submitOpenEndedAnswer(
      {required String tipQuestionId, String? openEndedAnswer}) {
    return '''
  mutation {
	answerTipQuestion(
		tipQuestionId: "$tipQuestionId"
		openEndedAnswer: "$openEndedAnswer"
	) {
		status
	}
}
''';
  }

  static String submitSelectedAnswer({
    required String tipQuestionId,
    String? tipQuestionAnswerId,
  }) {
    return '''
 mutation {
	answerTipQuestion(
		tipQuestionId: "$tipQuestionId"
		tipQuestionAnswerId: "$tipQuestionAnswerId"
	) {
		status
	}
},
''';
  }
}
