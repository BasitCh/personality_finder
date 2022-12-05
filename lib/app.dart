// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import 'core/global/languages/language_bloc.dart';
import 'core/global/navigator/app_router.gr.dart';
import 'core/global/screen_util/scree_util_setup.dart';
import 'core/global/theming/theme/base_theme.dart';
import 'core/global/theming/theme/theme_builder.dart';
import 'core/global/theming/theme_cubit/theme_cubit.dart';
import 'core/global/typography/app_typography.dart';
import 'core/global/util/analytics/analytics.dart';
import 'core/global/util/env/flavor_config.dart';
import 'di/injectable.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/quiz_tasking/presentation/bloc/quiz_bloc.dart';
import 'features/register/presentation/bloc/register_bloc.dart';
import 'features/settings/presentation/bloc/settings/settings_bloc.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const InternalApp();
  }
}

final appRouter = AppRouter(globalNavigatorKey);

class InternalApp extends StatelessWidget {
  const InternalApp();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => getIt<ThemeCubit>()..fetchTheme(),
        ),
        BlocProvider<LanguageBloc>(
          create: (context) =>
              getIt<LanguageBloc>()..add(const GetLanguageEvent()),
        ),
        BlocProvider<LoginBloc>(
            create: (context) =>
                getIt<LoginBloc>()..add(const CheckLoginStatus())),
        BlocProvider<SettingsBloc>(create: (context) => getIt<SettingsBloc>()),
        BlocProvider<RegisterBloc>(
            create: (context) =>
                getIt<RegisterBloc>()..add(const UploadDocumentRegister())),
        BlocProvider<QuizBloc>(create: (context) => getIt<QuizBloc>()),
      ],
      child: ScreenUtilSetup(
        child: ThemeBuilder(
          builder: (ctx, palatte) {
            return BlocBuilder<LanguageBloc, LanguageState>(
                builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: !FlavorConfig.isInTest(),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                locale: state is LanguageLoaded
                    ? state.locale
                    : const Locale('en', 'US'),
                routeInformationParser: appRouter.defaultRouteParser(),
                routerDelegate: appRouter.delegate(
                  navigatorObservers: () => [
                    Analytics.observer,
                    // SentryNavigatorObserver(),
                  ],
                ),
                theme: BaseThemeData.baseTheme.copyWith(
                  scaffoldBackgroundColor: palatte.background,
                  primaryColor: palatte.corePalatte.primaryColor,
                  canvasColor: palatte.background,
                  brightness: palatte.brightness,
                  textTheme: AppTypography.textTheme,
                  appBarTheme: AppBarTheme(
                    // brightness: palatte.brightness,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarBrightness: palatte.brightness),
                    color: palatte.surface,
                    iconTheme: IconThemeData(
                      color: palatte.onSurface,
                    ),
                  ),
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: palatte.corePalatte.secondaryColor),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
