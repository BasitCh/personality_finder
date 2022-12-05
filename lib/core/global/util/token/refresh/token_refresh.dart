import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/core/global/graphql/gql_service_impl.dart';
import 'package:morphosis_template/core/global/util/token/token_service/token_service.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/token_refresh/domain/entities/refresh_data.dart';
import 'package:morphosis_template/features/token_refresh/domain/queries/refresh_queries.dart';

class TokenRefresh extends TokenService{
  @override
  Future<Either<RefreshData, Exception>> tokenRefresh() async{
    
     final _options = MutationOptions(
        document:
            gql(TokenRefreshQueries.tokenRefresh ()),
        variables: const <String, dynamic>{'Content-Type': 'application/json'});

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.mutate(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = RefreshData.fromJson(response.data!);
 
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
  
}