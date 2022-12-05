// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../data_provider_widget.dart';

class FlutterTemplateProgressIndicator extends StatelessWidget {
  final bool dark;

  const FlutterTemplateProgressIndicator.dark() : dark = true;

  const FlutterTemplateProgressIndicator.light() : dark = false;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) {
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(dark
              ? theme.colorsTheme.darkProgressIndicator
              : theme.colorsTheme.lightProgressIndicator),
        );
      },
    );
  }
}
