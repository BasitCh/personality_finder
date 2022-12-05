// Package imports:
import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/core/global/graphql/gql_query_option.dart';
import 'package:morphosis_template/core/global/graphql/gql_service_impl.dart';
import 'package:morphosis_template/core/global/util/quiz/quiz_service/quiz_service.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/quiz_result/domain/enties/submit_data.dart';
import 'package:morphosis_template/features/quiz_result/domain/enties/submit_quiz_response.dart';
import 'package:morphosis_template/features/quiz_result/domain/queries/submit_quiz_queries.dart';
import 'package:morphosis_template/features/quiz_result_detail/domain/enties/quiz_result_data.dart';
import 'package:morphosis_template/features/quiz_result_detail/domain/enties/quiz_result_response.dart';
import 'package:morphosis_template/features/quiz_result_detail/domain/queries/result_detail_queries.dart';
import 'package:morphosis_template/features/quiz_tasking/domain/entities/quiz_data.dart';
import 'package:morphosis_template/features/quiz_tasking/domain/entities/quiz_response.dart';
import 'package:morphosis_template/features/quiz_tasking/domain/queries/quiz_queries.dart';
import 'package:morphosis_template/features/quiz_tasking/domain/repositories/quiz_task_repo.dart';

class QuizFetch extends QuizService {
  final QuizRepo quizRepo = QuizRepo();

  @override
  Future<Either<SubmitQuizData, Exception>> submitResult(
      String quizAnswerList) async {
    // TODO: Implement sign in using plugin and keys.

    final _options = CustomQueryOption.queryOption(
        SubmitQuizQueires.submitQuizQuery(quizAnswerList));

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = SubmitQuizResponse.fromJson(response.data!);

        final data =
            SubmitQuizData(calculateQuizResult: json.calculateQuizResult);

        return left(data);
      } else {
        return right(Exception('Error login'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<Either<QuizData, Exception>> fetchQuiz() async {
    // TODO: Implement sign in using plugin and keys.

    final _options =
        CustomQueryOption.queryOption(QuizQueires.fetchQuizQuery());

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = QuizResponse.fromJson(response.data!);

        final data = QuizData(getQuizQuestionsList: json.getQuizQuestions);

        return left(data);
      } else {
        return right(Exception('Error login'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<Either<QuizResultData, Exception>> resultDetail(
      int quizResultContentId) async {
    final _options = CustomQueryOption.queryOption(
        ResultDetailQueries.resultDetailQueries(quizResultContentId));

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = QuizResultResponse.fromJson(response.data!);

        final data = QuizResultData(
            getResultContentGeneral: json.getResultContentGeneral);

        return left(data);
      } else {
        return right(Exception('Error login'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }
}
