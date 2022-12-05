// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/styles/theme_data.dart';
import 'package:morphosis_template/core/global/widget/general/action/text_action_item.dart';

void main() {
  Widget createTextActionItem() => Theme(
      data: FlutterTemplateThemeData.lightTheme(TargetPlatform.iOS),
      child: LayoutBuilder(
        key: const Key('layout_builder'),
        builder: (context, constraint) => TextActionItem(
          text: 'Hello',
          enabled: false,
          onClick: () {},
        ),
      ));

  group('Text Action Item Widget', () {
    testWidgets('should find layout builder', (tester) async {
      await tester.pumpWidget(createTextActionItem());
      final findKey = find.byKey(const Key('layout_builder'));
      expect(findKey, findsWidgets);
    });
  });
}
