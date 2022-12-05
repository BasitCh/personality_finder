// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/styles/theme_data.dart';
import 'package:morphosis_template/core/global/widget/general/styled/flutter_template_checkbox.dart';

void main() {
  Widget createFlutterTemplateCheckbox() => Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
      child: LayoutBuilder(
          builder: (context, constraint) =>
              FlutterTemplateCheckBox(value: true, onChanged: (value) {})));

  group('Flutter Template Checkbox', () {
    testWidgets('should find checkbox widget', (tester) async {
      await tester.pumpWidget(createFlutterTemplateCheckbox());
      final finder = find.byType(Checkbox);
      expect(finder, findsOneWidget);
    });
  });
}
