// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../data_provider_widget.dart';

class FlutterTemplateSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const FlutterTemplateSwitch({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: theme.colorsTheme.accent,
      ),
    );
  }
}
