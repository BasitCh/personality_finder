// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../di/injectable.dart';
import '../../repository/secure_storage/auth/auth_storage_impl.dart';
import '../util/env/flavor_config.dart';
import 'gql_service.dart';

@Singleton(as: GraphQLService)
class GraphQLServiceImpl extends GraphQLService {
  late ValueNotifier<GraphQLClient> valueNotifierClient;
  GraphQLClient? graphQLClient;

  @override
  GraphQLClient getGraphQlClient() {
    final httpLink = HttpLink(
      '${FlavorConfig.instance.values.baseUrl}graphql',
      defaultHeaders: {
        'Content-Type': 'application/json',
        'App-Version': '1.0.0',
      },
    );

    final authLink =
        AuthLink(getToken: () async => 'Bearer ${getAccessToken()}');

    final authlink = authLink.concat(httpLink);

    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: authlink,
      defaultPolicies: DefaultPolicies(
        mutate: Policies(fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.networkOnly),
        subscribe: Policies(fetch: FetchPolicy.networkOnly),
        watchMutation: Policies(fetch: FetchPolicy.networkOnly),
        watchQuery: Policies(fetch: FetchPolicy.networkOnly),
      ),
    );
  }

  Future<ValueNotifier<GraphQLClient>> client() async {
    final httpLink = HttpLink(
      '${FlavorConfig.instance.values.baseUrl}graphql',
      defaultHeaders: {
        'Content-Type': 'application/json',
        'App-Version': '1.0.0',
      },
    );

    final authLink =
        AuthLink(getToken: () async => 'Bearer ${getAccessToken()}');

    final updatedLink = authLink.concat(httpLink);

    if (graphQLClient == null) {
      graphQLClient = GraphQLClient(
        link: updatedLink,
        defaultPolicies: DefaultPolicies(
          mutate: Policies(fetch: FetchPolicy.networkOnly),
          query: Policies(fetch: FetchPolicy.networkOnly),
          subscribe: Policies(fetch: FetchPolicy.networkOnly),
          watchMutation: Policies(fetch: FetchPolicy.networkOnly),
          watchQuery: Policies(fetch: FetchPolicy.networkOnly),
        ),
        cache: GraphQLCache(
          store: InMemoryStore(),
        ),
      );

      valueNotifierClient = ValueNotifier(
        graphQLClient!,
      );
    }

    return valueNotifierClient;
  }

  @override
  Future<String> getAccessToken() async {
    return await getIt<AuthStoring>().getAccessToken() ?? '';
  }

  Future<ValueNotifier<GraphQLClient>> updateClient(
      String locale, String token, BuildContext context) async {
    final token = await getAccessToken();

    final authLink = AuthLink(
      getToken: () async => 'Bearer $token',
    );

    final httplink = HttpLink(
      '${FlavorConfig.instance.values.baseUrl}graphql',
      defaultHeaders: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'App-Version': '1.0.0',
        'locale': '$locale'
      },
    );

    final client = getIt<GraphQLServiceImpl>().getGraphQlClient();

    httplink.concat(authLink);

    graphQLClient = client.copyWith(
      link: httplink,
      defaultPolicies: DefaultPolicies(
        mutate: Policies(fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.networkOnly),
        subscribe: Policies(fetch: FetchPolicy.networkOnly),
        watchMutation: Policies(fetch: FetchPolicy.networkOnly),
        watchQuery: Policies(fetch: FetchPolicy.networkOnly),
      ),
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
    );

    // ignore: join_return_with_assignment
    valueNotifierClient = ValueNotifier(
      graphQLClient!,
    );

    return valueNotifierClient;
  }
}
