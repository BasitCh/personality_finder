// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/analytics/analytics.dart';

@GenerateMocks([Analytics])
void main() {
  group('Analytics', () {
    test('log even should be successful', () async {});
  });
}
