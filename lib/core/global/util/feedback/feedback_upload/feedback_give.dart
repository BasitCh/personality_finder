import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/core/global/graphql/gql_service_impl.dart';
import 'package:morphosis_template/core/global/util/feedback/feedback_service/feedback_service.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/feedback/domain/entities/feedback_response.dart';
import 'package:morphosis_template/features/feedback/domain/entities/tip_feedback_response.dart';
import 'package:morphosis_template/features/feedback/domain/queries/feedback_queries.dart';
import 'package:morphosis_template/features/feedback/domain/repositories/feedback_repo.dart';

class FeedbackGive extends FeedbackService {
  final FeedbackRepo feedbackRepo = FeedbackRepo();

  @override
  Future<Either<FeedbackResponse, Exception>> giveFeedback(
      {required int id, required bool useful}) async {
    final _options = MutationOptions(
        document:
            gql(FeedbackQueries.giveFeedbackQuery(id: id, useful: useful)),
        variables: const <String, dynamic>{'Content-Type': 'application/json'});

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.mutate(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = FeedbackResponse.fromJson(response.data!);

        // final data =
        //     FeedbackQuizResultContent(status: json.feedbackQuizResultContent!.status);

        return left(json);
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
  Future<Either<TipFeedBackResponse, Exception>> submitTipFeedback(
      {required int id, required bool useful}) async {
    final _options = MutationOptions(
        document:
            gql(FeedbackQueries.submitTipFeedback(id: id, useful: useful)),
        variables: const <String, dynamic>{'Content-Type': 'application/json'});

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.mutate(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = TipFeedBackResponse.fromJson(response.data!);

        return left(json);
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;

        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Something went wrong.'));
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
