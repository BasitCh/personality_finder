// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

// Project imports:
import '../logging/logging.dart';

class PerfMonitor {
  final _perf = FirebasePerformance.instance;

  Future<bool> checkIsEnabled() {
    return _perf.isPerformanceCollectionEnabled();
  }

  void setEnabled({required bool enabled}) {
    _perf.setPerformanceCollectionEnabled(enabled);
  }

  Future<HttpMetric> startNewMetric(String url, HttpMethod httpMethod) async {
    final metric = _perf.newHttpMetric(url, httpMethod);

    await metric.start();
    return metric;
  }

  Future<Response<T>> fetchWithMetrics<T>(RequestOptions requestOptions) async {
    final _dio = Dio();

    final metric =
        _perf.newHttpMetric(requestOptions.uri.toString(), HttpMethod.Options);

    await metric.start();

    final Response<T> response;

    try {
      response = await _dio.fetch<T>(requestOptions);
      logger.debug(
          'Called ${requestOptions.uri} with custom monitoring, response code: ${response.statusCode}');

      var responseLength = 0;
      if (response.data is Map) {
        responseLength = (response.data as Map).length;
      } else {
        responseLength = (response.data as List).length;
      }

      final requestData = requestOptions.data as Map<String, dynamic>?;
      metric
        ..responsePayloadSize = responseLength
        ..responseContentType = response.headers.value('Content-Type')
        ..requestPayloadSize = requestData?.length ?? 0
        ..httpResponseCode = response.statusCode;

      // TODO: Add your app specific custom metrics here.

      // ignore: cascade_invocations
      metric.putAttribute(
          'statusMessage', response.statusMessage ?? 'No statusMessage');
      // ignore: cascade_invocations
      metric.putAttribute('to_be_removed', 'should_not_be_logged');
    } finally {
      metric.removeAttribute('to_be_removed');

      await metric.stop();
    }

    // ignore: unawaited_futures
    // metric.getAttributes().then(
    //     (attributes) => logger.debug('Http metric attributes: $attributes'));
    metric.getAttributes();
    final statusMessage = metric.getAttribute('statusMessage')!;
    logger.debug('Http metric score attribute value: $statusMessage');

    return response;
  }

  Future<void> runTestTrace1() async {
    final trace = _perf.newTrace('test_trace_1');
    await trace.start();
    // TODO: Add app specific attributes.

    trace.putAttribute('favorite_color', 'blue');
    // ignore: cascade_invocations
    trace.putAttribute('to_be_removed', 'should_not_be_logged');

    for (var i = 0; i < 10; i++) {
      trace.incrementMetric('sum', i);
    }

    trace.removeAttribute('to_be_removed');
    await trace.stop();

    // ignore: unawaited_futures
    trace
      ..getMetric('sum')
      ..getAttributes();
    final favoriteColor = trace.getAttribute('favorite_color');
    logger.debug('test_trace_1 favorite_color: $favoriteColor');
  }

  Future<void> runTestTrace2() async {
    final trace = FirebasePerformance.instance.newTrace('test_trace_2');

    var sum = 0;
    for (var i = 0; i < 10000000; i++) {
      sum += i;
    }
    trace.setMetric('sum', sum);
    await trace.stop();

    trace.getMetric('sum');
  }

  void runTestAPIMetric() {
    fetchWithMetrics<List>(
      RequestOptions(
        path: '/posts',
        baseUrl: 'https://jsonplaceholder.typicode.com',
        method: 'GET',
      ),
    );
  }

  void runTests() {
    runTestAPIMetric();
    PerfMonitor().runTestTrace1();
    PerfMonitor().runTestTrace2();
  }
}
