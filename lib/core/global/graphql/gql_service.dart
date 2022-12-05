// Flutter imports:

// Package imports:
import 'package:graphql_flutter/graphql_flutter.dart';

// ignore: one_member_abstracts
abstract class GraphQLService {
  GraphQLClient getGraphQlClient();
  Future<String> getAccessToken();
}
