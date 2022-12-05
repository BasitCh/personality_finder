class FeedbackQueries {
  static String giveFeedbackQuery({required int id, required bool useful}) {
    return '''
    mutation {
      feedbackQuizResultContent(
      id:$id
      useful:$useful
      ){
        status
      }
    }
  ''';
  }

  static String submitTipFeedback({required int id, required bool useful}) {
    return '''
  mutation {
	feedbackTip(
	id:$id
	useful:$useful
	){
		status
	}
}
  ''';
  }
}
