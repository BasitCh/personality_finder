// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../extensions/context_extensions.dart';
import '../../../styles/theme_assets.dart';
import '../../../styles/theme_dimens.dart';
import '../../data_provider_widget.dart';
import '../svg_icon.dart';

class FlutterTemplateCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const FlutterTemplateCheckBox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isIOSTheme) {
      return DataProviderWidget(
        childBuilderTheme: (context, theme) => GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            color: Colors.transparent,
            height: ThemeDimens.padding48,
            width: ThemeDimens.padding48,
            child: value
                ? Center(
                    child: SvgIcon(
                      svgAsset: ThemeAssets.doneIcon(context),
                      color: theme.colorsTheme.accent,
                      size: ThemeDimens.padding24,
                    ),
                  )
                : Container(),
          ),
        ),
      );
    }
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Checkbox(
        value: value,
        onChanged: (value) => onChanged(value ?? false),
        activeColor: theme.colorsTheme.accent,
      ),
    );
  }
}
