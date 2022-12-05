// Flutter imports:
// Package imports:
// ignore_for_file: unrelated_type_equality_checks, unawaited_futures

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morphosis_template/core/global/languages/entities/language.dart';
import 'package:morphosis_template/core/global/util/app_constants.dart';
import 'package:morphosis_template/core/global/util/preferences/preferences_storage.dart';
import 'package:morphosis_template/core/repository/secure_storage/auth/auth_storage_impl.dart';
import 'package:morphosis_template/features/home/presentation/pages/home_screen.dart';
import 'package:morphosis_template/features/quiz_tasking/presentation/pages/quiz_intro_screen.dart';
import 'package:morphosis_template/features/quiz_tasking/presentation/pages/quiz_retake_intro_screen.dart';
import 'package:morphosis_template/features/settings/presentation/bloc/profile/profile_bloc.dart';
import 'package:morphosis_template/features/settings/presentation/bloc/settings/settings_bloc.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/graphql/gql_service_impl.dart';
import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../di/injectable.dart';

const scoreThreshold = 2500;

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late final ProfileBloc profileBloc;
  late final ScrollController scrollController;

  bool finishedInitalizing = false;

  @override
  void initState() {
    super.initState();
    updateGQL(getLocale());
  }

  Future<void> updateLocale() async {
    final languageCode = getLocale();
    getIt<ProfileBloc>().add(UpdateLocale(
        locale: languageCode == 'en'
            ? Locale.en
            : languageCode == 'fr'
                ? Locale.fr
                : Locale.es));
  }

  String getLocale() {
    final sp = getIt<SharedPreferenceStorage>();
    final languageCode = sp.getLocale() ?? Languages.languages[0].code;
    return languageCode;
  }

  Future<void> updateGQL(String locale) async {
    final accessToken = await getIt<AuthStoring>().getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      await getIt<GraphQLServiceImpl>()
          .updateClient(locale, accessToken, context)
          .then((value) {
        updateLocale().whenComplete(() {
          setState(() {});
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          backgroundColor: context.theme.corePalatte.white,
          body: MultiBlocListener(
              listeners: [
                BlocListener(
                    bloc: getIt<ProfileBloc>(),
                    listener: (context, state) {
                      if (state is LocaleUpdated ||
                          state is FailedUpdatingLocale) {
                        getIt<SettingsBloc>().add(FetchUserProfile());
                      }
                    }),
                BlocListener(
                    bloc: getIt<SettingsBloc>(),
                    listener: (context, state) {
                      if (state is ErrorLoadingProfile) {
                        AutoRouter.of(context).pushAndPopUntil(
                          const LoginRoute(),
                          predicate: (route) => false,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            state.error,
                            style: TextStyle(
                                color: context.theme.corePalatte.white),
                          ),
                        ));
                      }
                    }),
              ],
              child: BlocBuilder<SettingsBloc, SettingsState>(
                bloc: getIt<SettingsBloc>(),
                builder: (context, state) {
                  return (state is GotToHome)
                      ? HomeScreen()
                      : (state is QuizTaken)
                          ? const QuizIntroScreen()
                          : (state is QuizForceRetake)
                              ? const QuizRetakeIntroScreen()
                              : Center(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    child: const CircularProgressIndicator
                                        .adaptive(),
                                  ),
                                );
                },
              )

              // BlocListener<SettingsBloc, SettingsState>(
              //     bloc: getIt<SettingsBloc>(),
              //     listener: (context, state) async {
              //       if (state is GotToHome) {
              //         AutoRouter.of(context).pushAndPopUntil(
              //           const HomeRoute(),
              //           predicate: (route) => false,
              //         );
              //       } else if (state is QuizTaken) {
              //         AutoRouter.of(context).pushAndPopUntil(
              //           const QuizIntroRoute(),
              //           predicate: (route) => false,
              //         );
              //       } else if (state is QuizForceRetake) {
              //         AutoRouter.of(context).pushAndPopUntil(
              //           const QuizRetakeIntroRoute(),
              //           predicate: (route) => false,
              //         );
              //       } else if (state is ErrorLoadingProfile) {
              //         AutoRouter.of(context).pushAndPopUntil(
              //           const LoginRoute(),
              //           predicate: (route) => false,
              //         );
              //
              //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //           backgroundColor: Colors.red,
              //           content: Text(
              //             state.error,
              //             style:
              //                 TextStyle(color: context.theme.corePalatte.white),
              //           ),
              //         ));
              //       }
              //     },
              //     child: Center(
              //       child: Container(
              //           height: 40,
              //           width: 40,
              //           child: const CircularProgressIndicator.adaptive()),
              //     )),
              ));
    });
  }
}
