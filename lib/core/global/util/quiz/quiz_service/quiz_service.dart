// Package imports:
import 'package:dartz/dartz.dart';
import 'package:morphosis_template/features/quiz_result/domain/enties/submit_data.dart';
import 'package:morphosis_template/features/quiz_result_detail/domain/enties/quiz_result_data.dart';
import 'package:morphosis_template/features/quiz_tasking/domain/entities/quiz_data.dart';

abstract class QuizService {
  Future<Either<QuizData, Exception>> fetchQuiz();
  Future<Either<SubmitQuizData, Exception>> submitResult(String quizAnswerList);
  Future<Either<QuizResultData, Exception>> resultDetail(
      int quizResultContentId);
}
