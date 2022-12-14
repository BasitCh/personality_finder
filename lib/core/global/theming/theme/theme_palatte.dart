// Flutter imports:
// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'core_palatte.dart';

class ThemePalatte extends Equatable {
  final CorePalatte corePalatte;
  final bool themeType;
  final Color background;
  final Color surface;
  final Color info;
  final Color success;
  final Color error;
  final Color onBackground;
  final Color onBackgroundLight;
  final Color onBackgroundDark;
  final Color onSurface;
  final Color onSurfaceLight;
  final Color onSurfaceDark;
  final Color onInfo;
  final Color onSuccess;
  final Color onError;
  final Color textColor;
  final Brightness brightness;

  const ThemePalatte({
    required this.themeType,
    required this.brightness,
    required this.background,
    required this.surface,
    required this.info,
    required this.success,
    required this.error,
    required this.onBackground,
    required this.onBackgroundLight,
    required this.onBackgroundDark,
    required this.onSurface,
    required this.onSurfaceLight,
    required this.onSurfaceDark,
    required this.onInfo,
    required this.onSuccess,
    required this.onError,
    required this.textColor,
    this.corePalatte = const CorePalatte(
      primaryColor: Color(0xFF007AFF),
      secondaryColor: Color(0xFF000000),
      primaryColorAccent: Color(0xFFEFE6FF),
      notificationIconColor: Color(0xFFB7C1D3),
      notificationbackgroundColor: Color(0xFFFD655C),
      notificationSennColor: Color(0xFF212121),
      iconColor: Color(0xFFCAD1DE),
      greyFontColor: Color(0xFF8D92A3),
      textBlueColor: Color(0xFF6478D3),
      lightWhite: Color(0xFFF8F8F8),
      backgroundBlueColor: Color(0xFFF6F9FF),
      getStartedBackGroundColor: Color(0xFFF6F9FF),
      greyColor: Color(0xFF9C9C9C),
      tabBarColor: Color(0xFF636366),
      lightGreyColor: Color(0xFFF0F0F0),
      greenColor: Color(0xFF3CC13C),
      lightGreenColor: Color(0xFFCADFB7),
      seaGreenColor: Color(0xFF15CDA8),
      outOfStockColor: Color(0xFFFD655C),
      splashColor: Color(0x33D01118),
      whiteTransparentColor: Color(0x80FFFFFF),
      white: Color(0xFFFFFFFF),
      progressBarColor: Color(0xFFECEFF4),
      black: Color(0xFF000000),
      gray: Color(0xFF333333),
      pink: Color(0xFFEF4B5F),
      gray30: Color.fromRGBO(0, 0, 0, 0.3),
      lightwhite: Color(0xFFF1F3F8),
      yellow: Color(0xFFEFE142),
      errorColor: Colors.red,
      blur: Color(
        0xFF647B8C,
      ),
      gray20: Color.fromRGBO(219, 222, 233, 1),
      gray05: Color(0xFFF2F2F7),
      gray10: Color(0xFFF0F1F8),
      gray50: Color(0xFF9496A1),
      gray60: Color(0xFF777986),
      gray80: Color(0xFF404252),
      tertiaryRed: Color(0xFFF15A5A),
      tertiaryGreen: Color(0xFF4ED483),
      darkGrey: Color(0xFF101223),
      secondaryRedColor: Color(0xFFFFC1C1),
      secondaryYellowColor: Color(0xFFFADD89),
      darkBlue: Color(0xFF007AFF),
    ),
  });

  // ignore: prefer_constructors_over_static_methods
  static ThemePalatte get lightThemePalatte => ThemePalatte(
      background: const Color(0xFFEFF0F5),
      surface: const Color(0xFFFFFFFF),
      info: const Color(0xFFFFFFFF),
      success: const Color(0xFFFFFFFF),
      error: const Color(0xFFFD655C),
      onBackground: const Color(0xFF000000),
      onBackgroundLight: const Color(0xFF000000).withOpacity(0.60),
      onBackgroundDark: const Color(0xFF000000).withOpacity(0.87),
      onSurface: const Color(0xFF000000),
      onSurfaceLight: const Color(0xFF000000).withOpacity(0.60),
      onSurfaceDark: const Color(0xFF000000).withOpacity(0.87),
      onInfo: const Color(0xFF000000),
      onSuccess: const Color(0xFF000000),
      onError: const Color(0xFF000000),
      brightness: Brightness.light,
      themeType: false,
      textColor: const Color(0xFF0A1A1E));

  // ignore: prefer_constructors_over_static_methods
  static ThemePalatte get darkThemePalatte => ThemePalatte(
      brightness: Brightness.dark,
      background: Colors.black,
      surface: const Color(0xFF202124),
      info: const Color(0xFF314045),
      success: const Color(0xFF314045),
      error: const Color(0xFF314045),
      onBackground: const Color(0xFFFFFFFF),
      onBackgroundLight: const Color(0xFFFFFFFF).withOpacity(0.60),
      onBackgroundDark: const Color(0xFFFFFFFF).withOpacity(0.87),
      onSurface: const Color(0xFFFFFFFF),
      onSurfaceLight: const Color(0xFFFFFFFF).withOpacity(0.60),
      onSurfaceDark: const Color(0xFFFFFFFF).withOpacity(0.87),
      onInfo: const Color(0xFFFFFFFF),
      onSuccess: const Color(0xFFFFFFFF),
      onError: const Color(0xFFFFFFFF),
      themeType: true,
      textColor: const Color(0xFFEEEEEE));

  @override
  // TODO: implement props
  List<Object?> get props =>
      [themeType, background, surface, onBackgroundLight];
}
