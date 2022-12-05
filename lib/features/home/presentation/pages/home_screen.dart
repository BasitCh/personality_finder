// Flutter imports:
// Package imports:
// ignore_for_file: unrelated_type_equality_checks, unnecessary_null_comparison

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/extensions/string_extensions.dart';
import 'package:morphosis_template/core/global/util/notifications/local_notifications.dart';
import 'package:morphosis_template/core/global/util/notifications/messaging_background.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/home/presentation/widgets/awareness_showdialog.dart';
import 'package:morphosis_template/features/home/presentation/widgets/loading_shimmer.dart';
import 'package:morphosis_template/features/home/presentation/widgets/user_mix_chrono_type_item_widget.dart';
import 'package:morphosis_template/features/home/presentation/widgets/user_mix_type_item_widget.dart';
import 'package:morphosis_template/features/home/presentation/widgets/user_type_item_widget.dart';
import 'package:morphosis_template/features/login/domain/repositories/auth_repo.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/mix_person_avatar_widget.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/simple_person_avatar_widget.dart';
import 'package:morphosis_template/features/settings/presentation/bloc/profile/profile_bloc.dart';
import 'package:morphosis_template/features/settings/presentation/bloc/settings/settings_bloc.dart';
import 'package:morphosis_template/features/tips/presentation/blocs/tip_bloc/tip_bloc.dart';
import 'package:morphosis_template/features/tips/presentation/tips_view.dart';
import 'package:morphosis_template/features/tips/presentation/widgets/tip_loading_shimmer.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../di/injectable.dart';

const scoreThreshold = 2500;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late final ProfileBloc profileBloc;
  late final SettingsBloc settingsBloc;
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    settingsBloc = SettingsBloc(authRepo: getIt<AuthRepo>())
      ..add(FetchUserProfile());
    checkNotificationFromHome(firebaseMessagingBackgroundHandler, context);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> getUserDetails() async {
    return settingsBloc.add(FetchUserProfile());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResume();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  void onResume() {
    settingsBloc.add(FetchUserProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.corePalatte.white,
        body: BlocConsumer<SettingsBloc, SettingsState>(
          bloc: settingsBloc,
          listener: (context, state) async {
            if (state is GotToHome) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                setState(() {
                  getIt<TipBloc>().add(InitialEvent());
                });
              });
            }
          },
          builder: (context, state) {
            if (state is GotToHome) {
              return SafeArea(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return getUserDetails();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: AppBar(
                              actions: <Widget>[
                                InkWell(
                                  onTap: () => AutoRouter.of(context)
                                      .push(const SettingsRoute()),
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Icon(Icons.settings),
                                  ),
                                ),
                              ],
                              elevation: 0,
                            ),
                          ),
                          Center(
                              child: state.userDetails.profile?.quizResult
                                          ?.psychotype!.secondaryTrait ==
                                      null
                                  ? SimplePersonAvatar(
                                      avatarUrl: state.userDetails.profile
                                                  ?.imageUrl !=
                                              null
                                          ? '${state.userDetails.profile?.imageUrl}'
                                          : null,
                                      colorCodeData:
                                          '${state.userDetails.profile?.quizResult?.psychotype!.primaryTrait!.colorCode}',
                                    )
                                  : MixPersonAvatar(
                                      avatarUrl: state.userDetails.profile!
                                                  .imageUrl !=
                                              null
                                          ? '${state.userDetails.profile!.imageUrl}'
                                          : null,
                                      colorPrimaryTrait:
                                          '${state.userDetails.profile?.quizResult?.psychotype!.primaryTrait!.colorCode}',
                                      colorSecondaryTrait:
                                          '${state.userDetails.profile?.quizResult?.psychotype!.secondaryTrait!.colorCode}',
                                    )),
                          8.verticalSpace,
                          Center(
                            child: StandardText.bodyMediumBold(
                              context,
                              '${AppLocalizations.of(context)!.hello_text} ${state.userDetails.profile!.firstName!.toCapitalized()}!',
                              maxLines: 1,
                              fontSize: 24.flexibleFontSize,
                              color: context.theme.corePalatte.darkGrey,
                              align: TextAlign.center,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          24.verticalSpace,
                          Container(
                            child: state.userDetails.profile?.quizResult
                                        ?.psychotype?.secondaryTrait !=
                                    null
                                ? Center(
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          UserMixTypeItem(
                                            userType: 'Personality Type',
                                            userImagePrimaryTrait:
                                                '${state.userDetails.profile?.quizResult?.psychotype?.primaryTrait?.iconUrl}',
                                            userImageSecondaryTrait:
                                                '${state.userDetails.profile?.quizResult?.psychotype?.secondaryTrait?.iconUrl}',
                                            userTypeNamePrimaryTrait:
                                                '${state.userDetails.profile?.quizResult?.psychotype?.primaryTrait?.title}',
                                            userTypeNameSecondaryTrait:
                                                '${state.userDetails.profile?.quizResult?.psychotype?.secondaryTrait?.title}',
                                            colorPrimaryTrait:
                                                '${state.userDetails.profile?.quizResult?.psychotype?.primaryTrait?.colorCode}',
                                            colorSecondaryTrait:
                                                '${state.userDetails.profile?.quizResult?.psychotype?.secondaryTrait?.colorCode}',
                                            userPrimaryTypeId: int.parse(
                                                '${state.userDetails.profile?.quizResult?.psychotype?.primaryTrait?.id}'),
                                            userSecondaryTypeId: int.parse(
                                                '${state.userDetails.profile?.quizResult?.psychotype?.secondaryTrait?.id}'),
                                          ),
                                          12.horizontalSpace,
                                          UserMixChrono(
                                            userType: 'Chronotype',
                                            userImage:
                                                '${state.userDetails.profile?.quizResult?.chronotype!.iconUrl}',
                                            userTypeName:
                                                '${state.userDetails.profile?.quizResult?.chronotype?.title}',
                                            color:
                                                '${state.userDetails.profile?.quizResult?.chronotype?.colorCode}',
                                            userTypeID: int.parse(
                                                '${state.userDetails.profile?.quizResult?.chronotype!.id}'),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          UserTypeItem(
                                            userType: 'Personality Type',
                                            userImage:
                                                '${state.userDetails.profile?.quizResult?.psychotype?.primaryTrait?.iconUrl}',
                                            userTypeName:
                                                '${state.userDetails.profile?.quizResult?.psychotype?.primaryTrait?.title}',
                                            color:
                                                '${state.userDetails.profile?.quizResult?.psychotype?.primaryTrait?.colorCode}',
                                            userTypeID: int.parse(
                                                '${state.userDetails.profile?.quizResult?.psychotype!.primaryTrait!.id}'),
                                          ),
                                          12.horizontalSpace,
                                          UserTypeItem(
                                            userType: 'Chronotype',
                                            userImage:
                                                '${state.userDetails.profile?.quizResult?.chronotype!.iconUrl}',
                                            userTypeName:
                                                '${state.userDetails.profile?.quizResult?.chronotype!.title}',
                                            color:
                                                '${state.userDetails.profile?.quizResult?.chronotype?.colorCode}',
                                            userTypeID: int.parse(
                                                '${state.userDetails.profile?.quizResult?.chronotype!.id}'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                          24.verticalSpace,
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 32),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              child: LinearProgressIndicator(
                                minHeight: 16,
                                backgroundColor:
                                    context.theme.corePalatte.lightGreyColor,
                                value: int.parse(
                                        '${state.userDetails.awarenessScore}') /
                                    2500,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    context.theme.corePalatte.primaryColor),
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          Center(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: StandardText.bodyMediumBold(
                                      context,
                                      '${AppLocalizations.of(context)!.awareness_score_text} : ${int.parse('${state.userDetails.awarenessScore}') >= scoreThreshold ? int.parse('${state.userDetails.awarenessScore}') - scoreThreshold : int.parse('${state.userDetails.awarenessScore}')}',
                                      maxLines: 2,
                                      fontSize: 14.flexibleFontSize,
                                      color: context.theme.corePalatte.darkGrey,
                                      align: TextAlign.left,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  8.verticalSpace,
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24),
                                                topRight: Radius.circular(24))),
                                        builder: (context) {
                                          return const AwarenessExplainDialog();
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      margin: const EdgeInsets.only(left: 5),
                                      child: SvgPicture.asset(
                                        'assets/images/icons/question_mark.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => AutoRouter.of(context)
                                    .push(const QuizProgressRoute()),
                                child: StandardText.bodyMediumBold(
                                  context,
                                  AppLocalizations.of(context)!
                                      .retake_the_quiz_text,
                                  maxLines: 1,
                                  fontSize: 12.flexibleFontSize,
                                  color: context.theme.corePalatte.primaryColor,
                                  align: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          24.verticalSpace,
                          TipsView(
                            scrollController: scrollController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return ListView(
                children: [
                  LoadingShimmer(),
                  10.verticalSpace,
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, state) {
                        return TipLoadingShimmer();
                      })
                ],
              );
            }
          },
        ));
  }
}

Future<void> checkNotificationFromHome(
    BackgroundMessageHandler handler, BuildContext context) async {
  // workaround for onLaunch: When the app is completely closed (not in the background) and opened directly from the push notification

  try {
    await FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null && message.data != null) {
        final id =
            message.data.isNotEmpty ? message.data['link_id'] as String : '';

        if (id != null && id.isNotEmpty) {
          await AutoRouter.of(context).push(TipDetailRoute(tipId: id));
        }
      } else {}
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        '$e',
        style: TextStyle(color: context.theme.corePalatte.white),
      ),
    ));
  }

  try {
    // onMessage: When the app is open and it receives a push notification
    FirebaseMessaging.onMessage.listen((message) async {
      // final id =
      //     message.data.isNotEmpty ? message.data['link_id'] as String : null;

      // if (message.notification != null) {
      // await getIt<LocalNotfications>().showNotification(
      //     id: id!,
      //     title: message.notification!.title ?? '8w8re',
      //     body: message.notification!.body ?? '');
    });
  } catch (_) {}

  try {
    FirebaseMessaging.onBackgroundMessage(handler);

    // replacement for onResume: When the app is in the background and opened directly from the push notification.
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      final id =
          message.data.isNotEmpty ? message.data['link_id'] as String : null;

      // if (message.notification != null) {
      // await getIt<LocalNotfications>().showNotification(
      //     id: id!,
      //     title: message.notification!.title ?? '8w8re',
      //     body: message.notification!.body ?? '');

      await getIt<LocalNotfications>().selectNotification(id, context);
    });
  } catch (_) {}
}
