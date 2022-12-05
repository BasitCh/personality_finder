import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/core/global/util/quiz/fetch_quiz/quiz_fetch.dart';
import 'package:morphosis_template/core/global/util/quiz/quiz_service/quiz_service.dart';
import 'package:morphosis_template/features/quiz_result_detail/domain/enties/quiz_result_data.dart';

@LazySingleton()
class QuizResultDetailRepo {
  late QuizService quizService;
  Future<Either<QuizResultData, NetworkExceptions>> quizResultDetail(int quizResultContentId) async {
    try {
      quizService = QuizFetch();
      try {
        final response = await quizService.resultDetail(quizResultContentId);

        return await response.fold((data) async {
          return left(data);
        }, (error) {
          return right(NetworkExceptions.defaultError(error.toString()));
        });
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}