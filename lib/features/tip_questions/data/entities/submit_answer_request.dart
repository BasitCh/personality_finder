class SubmitAnswerRequest {
  String tipQuestionId;
  String? tipQuestionAnswerId;
  String? openEndedAnswer;

  SubmitAnswerRequest(
      {required this.tipQuestionId,
      this.tipQuestionAnswerId,
      this.openEndedAnswer});
}
