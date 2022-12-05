// Package imports:
import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CustomQueryOption {
  static WatchQueryOptions queryOption(String query) {
    return WatchQueryOptions(
      document: parseString(
        query,
      ),
      variables: const <String, dynamic>{},
      fetchResults: true,
      fetchPolicy: FetchPolicy.noCache,
    );
  }
}
