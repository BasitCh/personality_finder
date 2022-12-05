// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;

import '../../../features/app/presentation/pages/dashboard_screen.dart' as _i9;
import '../../../features/app/presentation/pages/locale_screen.dart' as _i2;
import '../../../features/app/presentation/pages/on_boarding_screen.dart'
    as _i3;
import '../../../features/app/presentation/pages/splash_screen.dart' as _i1;
import '../../../features/home/presentation/pages/home_screen.dart' as _i10;
import '../../../features/login/domain/entities/profile.dart' as _i27;
import '../../../features/login/presentation/pages/login_screen.dart' as _i4;
import '../../../features/quiz_result/presentaion/pages/result_page.dart'
    as _i15;
import '../../../features/quiz_result_detail/presentaion/pages/quiz_result_detail_screen.dart'
    as _i16;
import '../../../features/quiz_tasking/presentation/pages/quiz_intro_screen.dart'
    as _i12;
import '../../../features/quiz_tasking/presentation/pages/quiz_progress.dart'
    as _i13;
import '../../../features/quiz_tasking/presentation/pages/quiz_retake_intro_screen.dart'
    as _i14;
import '../../../features/register/data/model/user_data.dart' as _i26;
import '../../../features/register/presentation/pages/sign_up_screen.dart'
    as _i7;
import '../../../features/register/presentation/pages/user_information_screen.dart'
    as _i8;
import '../../../features/reset_password/presentation/pages/change_password_screen.dart'
    as _i5;
import '../../../features/reset_password/presentation/pages/email_sent_screen.dart'
    as _i6;
import '../../../features/reset_password/presentation/pages/reset_password_screen.dart'
    as _i18;
import '../../../features/settings/presentation/pages/edit_profile_screen.dart'
    as _i17;
import '../../../features/settings/presentation/pages/language_screen.dart'
    as _i20;
import '../../../features/settings/presentation/pages/settings_screen.dart'
    as _i11;
import '../../../features/settings/presentation/pages/update_password_screen.dart'
    as _i19;
import '../../../features/tip_questions/presentation/tip_question_screen.dart'
    as _i22;
import '../../../features/tips/data/entities/tip_question.dart' as _i28;
import '../../../features/tips/presentation/tip_detail_screen.dart' as _i21;
import '../util/webview/webview.dart' as _i23;

class AppRouter extends _i24.RootStackRouter {
  AppRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    LocaleRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LocaleScreen());
    },
    OnBoardingRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.OnBoardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginScreen());
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ChangePasswordScreen(
              resetCode: args.resetCode, key: args.key));
    },
    EmailSentRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.EmailSentScreen());
    },
    SignUpRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.SignUpScreen());
    },
    UserInformationRoute.name: (routeData) {
      final args = routeData.argsAs<UserInformationRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.UserInformationScreen(
              userData: args.userData, key: args.key));
    },
    DashBoardRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.DashBoardScreen());
    },
    HomeRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.HomeScreen());
    },
    SettingsRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.SettingsScreen());
    },
    QuizIntroRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.QuizIntroScreen());
    },
    QuizProgressRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.QuizProgressScreen());
    },
    QuizRetakeIntroRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.QuizRetakeIntroScreen());
    },
    QuizResultRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.QuizResultScreen());
    },
    QuizResultDetailRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.QuizResultDetailScreen());
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.EditProfileScreen(profile: args.profile));
    },
    ResetPasswordRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.ResetPasswordScreen());
    },
    UpdatePasswordRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i19.UpdatePasswordScreen());
    },
    LanguageRoute.name: (routeData) {
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i20.LanguageScreen());
    },
    TipDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TipDetailRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData, child: _i21.TipDetailScreen(tipId: args.tipId));
    },
    TipQuestionRoute.name: (routeData) {
      final args = routeData.argsAs<TipQuestionRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i22.TipQuestionScreen(tipQuestions: args.tipQuestions));
    },
    WebViewRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewRouteArgs>();
      return _i24.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.WebViewScreen(
              webviewUrl: args.webviewUrl, title: args.title, key: args.key));
    }
  };

  @override
  List<_i24.RouteConfig> get routes => [
        _i24.RouteConfig(SplashRoute.name, path: '/'),
        _i24.RouteConfig(LocaleRoute.name, path: '/locale-screen'),
        _i24.RouteConfig(OnBoardingRoute.name, path: '/on-boarding-screen'),
        _i24.RouteConfig(LoginRoute.name, path: '/login-screen'),
        _i24.RouteConfig(ChangePasswordRoute.name,
            path: '/change-password-screen'),
        _i24.RouteConfig(EmailSentRoute.name, path: '/email-sent-screen'),
        _i24.RouteConfig(SignUpRoute.name, path: '/sign-up-screen'),
        _i24.RouteConfig(UserInformationRoute.name,
            path: '/user-information-screen'),
        _i24.RouteConfig(DashBoardRoute.name, path: '/dash-board-screen'),
        _i24.RouteConfig(HomeRoute.name, path: '/home-screen'),
        _i24.RouteConfig(SettingsRoute.name, path: '/settings-screen'),
        _i24.RouteConfig(QuizIntroRoute.name, path: '/quiz-intro-screen'),
        _i24.RouteConfig(QuizProgressRoute.name, path: '/quiz-progress-screen'),
        _i24.RouteConfig(QuizRetakeIntroRoute.name,
            path: '/quiz-retake-intro-screen'),
        _i24.RouteConfig(QuizResultRoute.name, path: '/quiz-result-screen'),
        _i24.RouteConfig(QuizResultDetailRoute.name,
            path: '/quiz-result-detail-screen'),
        _i24.RouteConfig(EditProfileRoute.name, path: '/edit-profile-screen'),
        _i24.RouteConfig(ResetPasswordRoute.name,
            path: '/reset-password-screen'),
        _i24.RouteConfig(UpdatePasswordRoute.name,
            path: '/update-password-screen'),
        _i24.RouteConfig(EditProfileRoute.name, path: '/edit-profile-screen'),
        _i24.RouteConfig(ResetPasswordRoute.name,
            path: '/reset-password-screen'),
        _i24.RouteConfig(UpdatePasswordRoute.name,
            path: '/update-password-screen'),
        _i24.RouteConfig(LanguageRoute.name, path: '/language-screen'),
        _i24.RouteConfig(TipDetailRoute.name, path: '/tip-detail-screen'),
        _i24.RouteConfig(TipQuestionRoute.name, path: '/tip-question-screen'),
        _i24.RouteConfig(WebViewRoute.name, path: '/web-view-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i24.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LocaleScreen]
class LocaleRoute extends _i24.PageRouteInfo<void> {
  const LocaleRoute() : super(LocaleRoute.name, path: '/locale-screen');

  static const String name = 'LocaleRoute';
}

/// generated route for
/// [_i3.OnBoardingScreen]
class OnBoardingRoute extends _i24.PageRouteInfo<void> {
  const OnBoardingRoute()
      : super(OnBoardingRoute.name, path: '/on-boarding-screen');

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i24.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-screen');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.ChangePasswordScreen]
class ChangePasswordRoute extends _i24.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({required String resetCode, _i25.Key? key})
      : super(ChangePasswordRoute.name,
            path: '/change-password-screen',
            args: ChangePasswordRouteArgs(resetCode: resetCode, key: key));

  static const String name = 'ChangePasswordRoute';
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({required this.resetCode, this.key});

  final String resetCode;

  final _i25.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{resetCode: $resetCode, key: $key}';
  }
}

/// generated route for
/// [_i6.EmailSentScreen]
class EmailSentRoute extends _i24.PageRouteInfo<void> {
  const EmailSentRoute()
      : super(EmailSentRoute.name, path: '/email-sent-screen');

  static const String name = 'EmailSentRoute';
}

/// generated route for
/// [_i7.SignUpScreen]
class SignUpRoute extends _i24.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-screen');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i8.UserInformationScreen]
class UserInformationRoute
    extends _i24.PageRouteInfo<UserInformationRouteArgs> {
  UserInformationRoute({required _i26.UserData userData, _i25.Key? key})
      : super(UserInformationRoute.name,
            path: '/user-information-screen',
            args: UserInformationRouteArgs(userData: userData, key: key));

  static const String name = 'UserInformationRoute';
}

class UserInformationRouteArgs {
  const UserInformationRouteArgs({required this.userData, this.key});

  final _i26.UserData userData;

  final _i25.Key? key;

  @override
  String toString() {
    return 'UserInformationRouteArgs{userData: $userData, key: $key}';
  }
}

/// generated route for
/// [_i9.DashBoardScreen]
class DashBoardRoute extends _i24.PageRouteInfo<void> {
  const DashBoardRoute()
      : super(DashBoardRoute.name, path: '/dash-board-screen');

  static const String name = 'DashBoardRoute';
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i11.SettingsScreen]
class SettingsRoute extends _i24.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-screen');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i12.QuizIntroScreen]
class QuizIntroRoute extends _i24.PageRouteInfo<void> {
  const QuizIntroRoute()
      : super(QuizIntroRoute.name, path: '/quiz-intro-screen');

  static const String name = 'QuizIntroRoute';
}

/// generated route for
/// [_i13.QuizProgressScreen]
class QuizProgressRoute extends _i24.PageRouteInfo<void> {
  const QuizProgressRoute()
      : super(QuizProgressRoute.name, path: '/quiz-progress-screen');

  static const String name = 'QuizProgressRoute';
}

/// generated route for
/// [_i14.QuizRetakeIntroScreen]
class QuizRetakeIntroRoute extends _i24.PageRouteInfo<void> {
  const QuizRetakeIntroRoute()
      : super(QuizRetakeIntroRoute.name, path: '/quiz-retake-intro-screen');

  static const String name = 'QuizRetakeIntroRoute';
}

/// generated route for
/// [_i15.QuizResultScreen]
class QuizResultRoute extends _i24.PageRouteInfo<void> {
  const QuizResultRoute()
      : super(QuizResultRoute.name, path: '/quiz-result-screen');

  static const String name = 'QuizResultRoute';
}

/// generated route for
/// [_i16.QuizResultDetailScreen]
class QuizResultDetailRoute extends _i24.PageRouteInfo<void> {
  const QuizResultDetailRoute()
      : super(QuizResultDetailRoute.name, path: '/quiz-result-detail-screen');

  static const String name = 'QuizResultDetailRoute';
}

/// generated route for
/// [_i17.EditProfileScreen]
class EditProfileRoute extends _i24.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({required _i27.Profile profile})
      : super(EditProfileRoute.name,
            path: '/edit-profile-screen',
            args: EditProfileRouteArgs(profile: profile));

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({required this.profile});

  final _i27.Profile profile;

  @override
  String toString() {
    return 'EditProfileRouteArgs{profile: $profile}';
  }
}

/// generated route for
/// [_i18.ResetPasswordScreen]
class ResetPasswordRoute extends _i24.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password-screen');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i19.UpdatePasswordScreen]
class UpdatePasswordRoute extends _i24.PageRouteInfo<void> {
  const UpdatePasswordRoute()
      : super(UpdatePasswordRoute.name, path: '/update-password-screen');

  static const String name = 'UpdatePasswordRoute';
}

/// generated route for
/// [_i20.LanguageScreen]
class LanguageRoute extends _i24.PageRouteInfo<void> {
  const LanguageRoute() : super(LanguageRoute.name, path: '/language-screen');

  static const String name = 'LanguageRoute';
}

/// generated route for
/// [_i21.TipDetailScreen]
class TipDetailRoute extends _i24.PageRouteInfo<TipDetailRouteArgs> {
  TipDetailRoute({required String tipId})
      : super(TipDetailRoute.name,
            path: '/tip-detail-screen', args: TipDetailRouteArgs(tipId: tipId));

  static const String name = 'TipDetailRoute';
}

class TipDetailRouteArgs {
  const TipDetailRouteArgs({required this.tipId});

  final String tipId;

  @override
  String toString() {
    return 'TipDetailRouteArgs{tipId: $tipId}';
  }
}

/// generated route for
/// [_i22.TipQuestionScreen]
class TipQuestionRoute extends _i24.PageRouteInfo<TipQuestionRouteArgs> {
  TipQuestionRoute({required List<_i28.TipQuestion>? tipQuestions})
      : super(TipQuestionRoute.name,
            path: '/tip-question-screen',
            args: TipQuestionRouteArgs(tipQuestions: tipQuestions));

  static const String name = 'TipQuestionRoute';
}

class TipQuestionRouteArgs {
  const TipQuestionRouteArgs({required this.tipQuestions});

  final List<_i28.TipQuestion>? tipQuestions;

  @override
  String toString() {
    return 'TipQuestionRouteArgs{tipQuestions: $tipQuestions}';
  }
}

/// generated route for
/// [_i23.WebViewScreen]
class WebViewRoute extends _i24.PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute(
      {required String webviewUrl, required String title, _i25.Key? key})
      : super(WebViewRoute.name,
            path: '/web-view-screen',
            args: WebViewRouteArgs(
                webviewUrl: webviewUrl, title: title, key: key));

  static const String name = 'WebViewRoute';
}

class WebViewRouteArgs {
  const WebViewRouteArgs(
      {required this.webviewUrl, required this.title, this.key});

  final String webviewUrl;

  final String title;

  final _i25.Key? key;

  @override
  String toString() {
    return 'WebViewRouteArgs{webviewUrl: $webviewUrl, title: $title, key: $key}';
  }
}
