import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:morphosis_template/features/tip_questions/data/entities/submit_answer_request.dart';
import 'package:morphosis_template/features/tip_questions/data/repositories/tip_question_repo.dart';
import 'package:morphosis_template/features/tip_questions/services/tip_question_service.dart';

@LazySingleton(as: TipQuestionRepo)
class TipQuestionRepository extends TipQuestionRepo {
  final TipQuestionService tipQuestionService;

  TipQuestionRepository({required this.tipQuestionService});

  @override
  Future<Either<bool, Exception>> submitTipQuestionAnswer(
          {required SubmitAnswerRequest submitAnswerRequest}) =>
      tipQuestionService.submitTipQuestionAnswer(
          submitAnswerRequest: submitAnswerRequest);
}
