// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../di/injectable.dart';
import '../../util/preferences/preferences_storage.dart';
import '../theme/theme_palatte.dart';

class ThemeCubit extends Cubit<ThemePalatte> {
  ThemeCubit() : super(ThemePalatte.lightThemePalatte);

  //

  Future fetchTheme() async {
    final sp = getIt<SharedPreferenceStorage>();

    /// Register theme change listener.
    SchedulerBinding.instance.window.onPlatformBrightnessChanged =
        onPlatformThemeChanged;
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    final isDarkMode = sp.isDark() ?? brightness == Brightness.light;
    final themePallet = isDarkMode
        ? ThemePalatte.lightThemePalatte
        : ThemePalatte.lightThemePalatte;

    return emit(themePallet);
  }

  Future<void> onPlatformThemeChanged() async {
    final sp = getIt<SharedPreferenceStorage>();
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    final isDarkMode = sp.isDark() ?? brightness == Brightness.light;
    final themePallet = isDarkMode
        ? ThemePalatte.lightThemePalatte
        : ThemePalatte.lightThemePalatte;
    return emit(themePallet);
  }

  //
  Future<void> switchTheme({required bool themeType}) async {
    final sp = getIt<SharedPreferenceStorage>();
    final themePallet = themeType
        ? ThemePalatte.lightThemePalatte
        : ThemePalatte.lightThemePalatte;

    await sp.setIsDark(value: themeType);

    return emit(themePallet);
  }
}
