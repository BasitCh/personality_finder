import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/core/global/graphql/gql_query_option.dart';
import 'package:morphosis_template/core/global/graphql/gql_service_impl.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/tip_questions/data/entities/submit_answer_request.dart';
import 'package:morphosis_template/features/tip_questions/data/entities/submit_answer_response.dart';
import 'package:morphosis_template/features/tip_questions/data/queries/tip_question_queries.dart';

@LazySingleton()
class TipQuestionService {
  Future<Either<bool, Exception>> submitTipQuestionAnswer(
      {required SubmitAnswerRequest submitAnswerRequest}) async {
    WatchQueryOptions _options;
    if (submitAnswerRequest.tipQuestionAnswerId != null) {
      _options = CustomQueryOption.queryOption(
        TipQuestionQueries.submitSelectedAnswer(
          tipQuestionId: submitAnswerRequest.tipQuestionId.toString(),
          tipQuestionAnswerId:
              submitAnswerRequest.tipQuestionAnswerId.toString(),
        ),
      );
    } else {
      _options = CustomQueryOption.queryOption(
        TipQuestionQueries.submitOpenEndedAnswer(
          tipQuestionId: submitAnswerRequest.tipQuestionId.toString(),
          openEndedAnswer: submitAnswerRequest.openEndedAnswer.toString(),
        ),
      );
    }
    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = SubmitAnswerResponse.fromJson(response.data!);
        if (json.answerTipQuestion!.status) {
          return left(true);
        } else {
          return right(Exception('Something went wrong.'));
        }
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;

        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Seomething went wrong.'));
      }
    } on HttpLinkServerException catch (e) {
      return right(e);
    } on ServerException catch (e) {
      return right(e);
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
