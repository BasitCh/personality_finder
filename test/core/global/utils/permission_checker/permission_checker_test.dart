// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/permission_checker/permission_checker.dart';

@GenerateMocks([PermissionChecker])
void main() {
  group('Permission Checker', () {
    test('should return bool', () async {
      //nothing to test
    });
  });
}
