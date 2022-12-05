// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../core/global/error/network_exceptions.dart';
import '../../../../core/global/util/quiz/fetch_quiz/quiz_fetch.dart';
import '../../../../core/global/util/quiz/quiz_service/quiz_service.dart';
import '../entities/quiz_data.dart';

@LazySingleton()
class QuizRepo {
  late QuizService quizService;
  Future<Either<QuizData, NetworkExceptions>> quizFetch() async {
    try {
      quizService = QuizFetch();
      try {
        final response = await quizService.fetchQuiz();

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
