// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import '../styles/theme_data.dart';
import 'theme_provider_widget.dart';

class DataProviderWidget
    extends BaseThemeProviderWidget<FlutterTemplateTheme, AppLocalizations> {
  const DataProviderWidget({
    Widget Function(BuildContext context, FlutterTemplateTheme theme)?
        childBuilderTheme,
    Widget Function(BuildContext context, AppLocalizations localization)?
        childBuilderLocalization,
    Widget Function(BuildContext context, FlutterTemplateTheme theme,
            AppLocalizations localization)?
        childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
