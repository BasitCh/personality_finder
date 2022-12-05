// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/exceptions/code_error.dart';
import 'package:morphosis_template/core/global/exceptions/general_error.dart';
import 'package:morphosis_template/core/global/exceptions/no_internet_error.dart';
import 'package:morphosis_template/core/global/interceptors/network_error_interceptor.dart';
import 'package:morphosis_template/core/global/util/connectivity/connectivity.dart';

void main() {
  NetworkErrorInterceptor? networkErrorInterceptor;
  // ignore: unused_local_variable
  ConnectivityHelper? mockConnectivityHelper;

  group('onRequest', () {
    setUp(() {
      mockConnectivityHelper = MockConnectivityHelper();
      // networkErrorInterceptor = NetworkErrorInterceptor(mockConnectivityHelper);
    });
    test('should return object if network is available', () async {
      final result = await networkErrorInterceptor!
          .onRequest(RequestOptions(path: 'google.com'));
      expect(result, isA<Object?>());
    });
  });

  group('onRequest', () {
    setUp(() {
      mockConnectivityHelper =
          MockConnectivityHelper(isNetworkConnected: false);
      // networkErrorInterceptor =
      // NetworkErrorInterceptor(mockConnectivityHelper as C);
    });
    test('should throw a no netwoork error', () async {
      expect(
          () => networkErrorInterceptor!
              .onRequest(RequestOptions(path: 'google.com')),
          throwsA(isA<NoNetworkError>()));
    });
  });

  group('on Error', () {
    setUp(() {
      mockConnectivityHelper =
          MockConnectivityHelper(isNetworkConnected: false);
      // networkErrorInterceptor =
      //     NetworkErrorInterceptor(mockConnectivityHelper!);
    });

    test('should throw a no CodeError when no argument is passed error',
        () async {
      final result = await networkErrorInterceptor!.onError(null);
      expect(result, isA<CodeError>());
    });

    test('should reurn a GeneralNetworkError when no argument is passed error',
        () async {
      final result = await networkErrorInterceptor!.onError(DioError(
          requestOptions: RequestOptions(path: 'google.com'),
          response: Response<dynamic>(
              requestOptions: RequestOptions(path: 'www.google.com')),
          error: GeneralNetworkError(dioError))) as GeneralNetworkError;
      expect(result, isA<GeneralNetworkError>());
    });
  });
}

final dioError = DioError(requestOptions: RequestOptions(path: 'google.com'));

class MockConnectivityHelper extends Mock implements ConnectivityHelper {
  final bool isNetworkConnected;

  MockConnectivityHelper({this.isNetworkConnected = true});

  /// Returns true if the device is connected to an IP network
  @override
  Future<bool> hasConnection() async {
    return isNetworkConnected;
  }

  /// Returns a stream that monitors the connectivity state of the device
  @override
  Stream<bool> monitorConnection() {
    return Stream.value(isNetworkConnected);
  }
}
