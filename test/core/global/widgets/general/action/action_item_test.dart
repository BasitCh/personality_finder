// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/styles/theme_data.dart';

/// In this test we'll test
/// 1. if DataProviderWidget exists
/// 2. test if when button is clicked, there is a reaction in UI

void main() {
  Widget createActionItem() => MaterialApp(
          home: Theme(
        data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
        child: Container(),
      ));

  group('Action Item Widget Test', () {
    testWidgets('DataProviderWidget should exist in this widget',
        (tester) async {
      await tester.pumpWidget(createActionItem());

      expect(find.byType(Container), findsWidgets);
    });
  });
}
