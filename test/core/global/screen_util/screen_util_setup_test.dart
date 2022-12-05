// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:morphosis_template/core/global/screen_util/scree_util_setup.dart';

import '../../../features/app/presentation/pages/splash_screen_test.dart';

void main() {
  setUp(() {});

  final Widget _testWidget = Container(
    child: const Text('hello there'),
  );
  group('ScreenUtilSetup', () {
    testWidgets('Should  add a child passed to its widget tree',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(wrapper(ScreenUtilSetup(
          child: _testWidget,
        )));
      });

      expect(find.text('hello there'), findsOneWidget);
      expect(find.byWidget(_testWidget), findsOneWidget);
    });
  });
}

Widget wrapper(Widget child) {
  return MaterialApp(
    home: child,
    navigatorObservers: [mockObserver],
  );
}
