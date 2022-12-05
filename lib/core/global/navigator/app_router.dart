// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:morphosis_template/core/global/util/webview/webview.dart';
import 'package:morphosis_template/features/app/presentation/pages/dashboard_screen.dart';

// Project imports:
import 'package:morphosis_template/features/app/presentation/pages/locale_screen.dart';
import 'package:morphosis_template/features/app/presentation/pages/on_boarding_screen.dart';
import 'package:morphosis_template/features/app/presentation/pages/splash_screen.dart';
import 'package:morphosis_template/features/home/presentation/pages/home_screen.dart';
import 'package:morphosis_template/features/login/presentation/pages/login_screen.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/result_page.dart';
import 'package:morphosis_template/features/quiz_result_detail/presentaion/pages/quiz_result_detail_screen.dart';
import 'package:morphosis_template/features/quiz_tasking/presentation/pages/quiz_intro_screen.dart';
import 'package:morphosis_template/features/quiz_tasking/presentation/pages/quiz_progress.dart';
import 'package:morphosis_template/features/quiz_tasking/presentation/pages/quiz_retake_intro_screen.dart';
import 'package:morphosis_template/features/register/presentation/pages/sign_up_screen.dart';
import 'package:morphosis_template/features/register/presentation/pages/user_information_screen.dart';
import 'package:morphosis_template/features/reset_password/presentation/pages/change_password_screen.dart';
import 'package:morphosis_template/features/reset_password/presentation/pages/email_sent_screen.dart';
import 'package:morphosis_template/features/reset_password/presentation/pages/reset_password_screen.dart';
import 'package:morphosis_template/features/settings/presentation/pages/edit_profile_screen.dart';
import 'package:morphosis_template/features/settings/presentation/pages/language_screen.dart';
import 'package:morphosis_template/features/settings/presentation/pages/settings_screen.dart';
import 'package:morphosis_template/features/settings/presentation/pages/update_password_screen.dart';
import 'package:morphosis_template/features/tip_questions/presentation/tip_question_screen.dart';
import 'package:morphosis_template/features/tips/presentation/tip_detail_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<dynamic>(page: SplashScreen, initial: true),
    AutoRoute<dynamic>(page: LocaleScreen),
    AutoRoute<dynamic>(page: OnBoardingScreen),
    AutoRoute<dynamic>(page: LoginScreen),
    AutoRoute<dynamic>(page: ChangePasswordScreen),
    AutoRoute<dynamic>(page: EmailSentScreen),
    AutoRoute<dynamic>(page: SignUpScreen),
    AutoRoute<dynamic>(page: UserInformationScreen),
    AutoRoute<dynamic>(page: DashBoardScreen),
    AutoRoute<dynamic>(page: HomeScreen),
    AutoRoute<dynamic>(page: SettingsScreen),
    AutoRoute<dynamic>(page: QuizIntroScreen),
    AutoRoute<dynamic>(page: QuizProgressScreen),
    AutoRoute<dynamic>(page: QuizRetakeIntroScreen),
    AutoRoute<dynamic>(page: QuizResultScreen),
    AutoRoute<dynamic>(page: QuizResultDetailScreen),
    AutoRoute<dynamic>(page: EditProfileScreen),
    AutoRoute<dynamic>(page: ResetPasswordScreen),
    AutoRoute<dynamic>(page: UpdatePasswordScreen),
    AutoRoute<dynamic>(page: EditProfileScreen),
    AutoRoute<dynamic>(page: ResetPasswordScreen),
    AutoRoute<dynamic>(page: UpdatePasswordScreen),
    AutoRoute<dynamic>(page: LanguageScreen),
    AutoRoute<dynamic>(page: TipDetailScreen),
    AutoRoute<dynamic>(page: TipQuestionScreen),
    AutoRoute<dynamic>(page: WebViewScreen),
  ],
)
class $AppRouter {}
