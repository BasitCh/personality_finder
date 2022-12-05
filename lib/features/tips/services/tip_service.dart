import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/core/global/graphql/gql_query_option.dart';
import 'package:morphosis_template/core/global/graphql/gql_service_impl.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_general.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_response.dart';
import 'package:morphosis_template/features/tips/data/queries/tip_queries.dart';

@LazySingleton()
// ignore: one_member_abstracts
class TipService {
  Future<Either<TipResponse, Exception>> fetchTips(
      {required int page, required int perPage}) async {
    final _options = CustomQueryOption.queryOption(
      TipQueries.fetchTips(page: page, perPage: perPage),
    );
    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = TipResponse.fromJson(response.data!);

        return left(json);
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

  Future<Either<TipGeneral, Exception>> fetchTipById(
      {required String tipId}) async {
    final _options = CustomQueryOption.queryOption(
      TipQueries.fetchTipById(tipId: tipId),
    );
    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = TipGeneral.fromJson(response.data!);

        return left(json);
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
