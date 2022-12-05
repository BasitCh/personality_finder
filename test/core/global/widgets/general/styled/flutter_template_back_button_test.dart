// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/styles/theme_data.dart';
import 'package:morphosis_template/core/global/util/keys.dart';
import 'package:morphosis_template/core/global/widget/general/styled/flutter_template_back_button.dart';

void main() {
  Widget createFlutterTemplateBackButton() => Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
      child: LayoutBuilder(
        builder: (context, constraint) => FlutterTemplateBackButton.dark(
          onClick: () {},
          fullScreen: true,
        ),
      ));

  group('Flutter Template Back Button', () {
    testWidgets('should return a light button', (tester) async {
      await tester.pumpWidget(createFlutterTemplateBackButton());
      final finder = find.byKey(Keys.backButton);
      expect(finder, findsWidgets);
    });
  });
}
