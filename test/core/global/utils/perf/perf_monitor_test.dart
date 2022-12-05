// Package imports:
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/perf/perf_monitor.dart';
import '../../../../..//test/core/global/utils/perf/perf_monitor_test.mocks.dart';

@GenerateMocks([PerfMonitor])
void main() {
  final mock = MockPerfMonitor();

  group('Perf Monitor', () {
    test('should return boolean', () async {
      when(mock.checkIsEnabled()).thenAnswer((_) async => false);
      expect(await mock.checkIsEnabled(), isA<bool>());
    });

    test('should return http metric', () async {
      when(mock.startNewMetric(
              'https://jsonplaceholder.typicode.com', HttpMethod.Get))
          .thenReturn(1 as Future<HttpMetric>);
      expect(
          await mock.startNewMetric(
              'https://jsonplaceholder.typicode.com', HttpMethod.Get),
          isA<HttpMetric>());
    });
  });
}
