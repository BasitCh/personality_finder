// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/features/app/domain/entities/version_data.dart';

import '../../../../json_reader.dart';

void main() {
  const tVersionData = VersionData(
      androidLatestVersionCode: 2,
      androidMiniVersionCode: 1,
      iosLatestVersionCode: 2,
      iosMiniVersionCode: 1);

  group('Todo', () {
    test(
      'should return a valid model when the VersionData.fromJson is called',
      () async {
        // arrange
        final jsonMap =
            json.decode(fixture('app_version.json')) as Map<String, dynamic>;
        // act
        final result = VersionData.fromJson(jsonMap);
        // assert
        expect(result, tVersionData);
      },
    );
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tVersionData.toJson();
        // assert
        final expectedMap = <String, dynamic>{
          'androidMiniVersionCode': 1,
          'androidLatestVersionCode': 2,
          'iosMiniVersionCode': 1,
          'iosLatestVersionCode': 2,
          'changeLog': null
        };
        expect(result, expectedMap);
      },
    );
  });
}
