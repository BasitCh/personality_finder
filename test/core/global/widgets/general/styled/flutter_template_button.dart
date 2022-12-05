// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/styles/theme_data.dart';
import 'package:morphosis_template/core/global/widget/general/styled/flutter_template_button.dart';
import 'package:morphosis_template/core/global/widget/touch_feedback/touch_feedback.dart';

void main() {
  Widget createFlutterTemplateButton() => Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
      child: LayoutBuilder(
          builder: (context, constraint) => FlutterTemplateButton(
                text: 'test',
                key: const Key('flutter_template_button'),
                onClick: () {},
              )));

  group('Flutter Template Button', () {
    testWidgets('should have TouchFeedback', (tester) async {
      await tester.pumpWidget(createFlutterTemplateButton());
      final finder = find.byType(TouchFeedBack);
      expect(finder, findsWidgets);
    });

    testWidgets('should have text string', (tester) async {
      await tester.pumpWidget(createFlutterTemplateButton());
      final finder = find.text('test');
      expect(finder, findsWidgets);
    });
  });
}
