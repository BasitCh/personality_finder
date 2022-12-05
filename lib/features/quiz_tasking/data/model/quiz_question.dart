// Project imports:
import 'quiz_quest_ans_detail.dart';

class QuizQuestion {
  String? questionId;
  String? questionTitle;
  int? questionOrder;
  List<QuizQuestAnsDetail>? questAnsDetailList;
  QuizQuestion({
    this.questionId,
    this.questionTitle,
    this.questionOrder,
    this.questAnsDetailList,
  });
}
