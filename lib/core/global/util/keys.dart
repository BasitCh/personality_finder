// Flutter imports:
import 'package:flutter/cupertino.dart';

class Keys {
  Keys._();

  //General
  static const backButton = ValueKey('back_button');
  static const themeLoading = ValueKey('theme_loading');

  //Debug
  static const debugSlowAnimations = ValueKey('debug_slow_animations');
  static const debugTargetPlatform = ValueKey('debug_target_platform');
  static const debugSelectLanguage = ValueKey('debug_select_language');
  static const debugShowTranslations = ValueKey('debug_show_language');
  static const debugLicense = ValueKey('debug_license');
  static const debugDatabase = ValueKey('debug_database');

  //Login
  static const emailInput = ValueKey('email_input');
  static const passwordInput = ValueKey('password_input');
  static const loginButton = ValueKey('login_button');

  //Todo List
  static const downloadAction = ValueKey('download_actions');
  static const addAction = ValueKey('add_action');
}
