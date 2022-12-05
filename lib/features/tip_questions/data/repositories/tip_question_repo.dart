import 'package:dartz/dartz.dart';
import 'package:morphosis_template/features/tip_questions/data/entities/submit_answer_request.dart';

// ignore: one_member_abstracts
abstract class TipQuestionRepo {
  Future<Either<bool, Exception>> submitTipQuestionAnswer(
      {required SubmitAnswerRequest submitAnswerRequest});
}
