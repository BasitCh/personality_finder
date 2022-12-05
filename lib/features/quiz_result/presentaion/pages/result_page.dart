// ignore_for_file: unnecessary_null_comparison
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morphosis_template/core/global/color/hex_color.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/presentation/widgets/app_button_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/bloc/submit_result_bloc.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/mix_person_avatar_widget.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/simple_person_avatar_widget.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/user_type_chrono_item_widget.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/pages/widgets/user_type_item_widget.dart';
import 'package:morphosis_template/features/quiz_result_detail/presentaion/bloc/quiz_result_detail_bloc.dart';
import 'package:morphosis_template/features/settings/presentation/bloc/settings/settings_bloc.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({Key? key}) : super(key: key);

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    return getIt<SettingsBloc>().add(FetchUserProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SubmitQuizResultBloc, SubmitResultState>(
      bloc: getIt<SubmitQuizResultBloc>(),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SubmitQuizSuccess) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: context.theme.corePalatte.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  80.verticalSpace,
                  BlocConsumer<SettingsBloc, SettingsState>(
                    bloc: getIt<SettingsBloc>()..add(FetchUserProfile()),
                    listener: (context, profileState) {
                      // TODO: implement listener
                    },
                    builder: (context, profileState) {
                      return Center(
                        child: state.submitQuizData.calculateQuizResult!
                                    .psychotype!.secondaryTrait ==
                                null
                            ? SimplePersonAvatar(
                                avatarUrl: profileState is GotToHome
                                    ? profileState.userDetails.profile!
                                                .imageUrl !=
                                            null
                                        ? '${profileState.userDetails.profile!.imageUrl}'
                                        : null
                                    : null,
                                colorCodeData:
                                    '${state.submitQuizData.calculateQuizResult!.psychotype!.primaryTrait!.colorCode}',
                              )
                            : MixPersonAvatar(
                                avatarUrl: profileState is GotToHome
                                    ? profileState.userDetails.profile!
                                                .imageUrl !=
                                            null
                                        ? '${profileState.userDetails.profile!.imageUrl}'
                                        : null
                                    : null,
                                colorPrimaryTrait:
                                    '${state.submitQuizData.calculateQuizResult!.psychotype!.primaryTrait!.colorCode}',
                                colorSecondaryTrait:
                                    '${state.submitQuizData.calculateQuizResult!.psychotype!.secondaryTrait!.colorCode}',
                              ),
                      );
                    },
                  ),
                  10.verticalSpace,
                  Center(
                    child: StandardText.bodyMediumBold(
                      context,
                      state.submitQuizData.calculateQuizResult!.psychotype!
                                  .secondaryTrait ==
                              null
                          ? state.submitQuizData.calculateQuizResult!
                              .psychotype!.primaryTrait!.title!
                          : AppLocalizations.of(context)!.you_are_a_mix_text,
                      maxLines: 1,
                      fontSize: 24,
                      color: context.theme.corePalatte.darkGrey,
                      align: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: StandardText.bodyMedium(
                      context,
                      AppLocalizations.of(context)!.personality_type_text,
                      maxLines: 1,
                      fontSize: 16,
                      align: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  10.verticalSpace,
                  Center(
                    child: Container(
                      child: state.submitQuizData.calculateQuizResult!
                                  .psychotype!.secondaryTrait ==
                              null
                          ? InkWell(
                              onTap: () {
                                getIt<QuizResultDetailBloc>().add(
                                    QuizResultDetailFetch(
                                        quizResultContentId: int.parse(state
                                            .submitQuizData
                                            .calculateQuizResult!
                                            .psychotype!
                                            .primaryTrait!
                                            .id!)));
                                AutoRouter.of(context)
                                    .push(const QuizResultDetailRoute());
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width - 64,
                                height: 72.flexibleHeight,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: HexColor(
                                        '${state.submitQuizData.calculateQuizResult!.psychotype!.primaryTrait!.colorCode}')),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8.flexibleWidth),
                                          width: 56.flexibleWidth,
                                          height: 56.flexibleHeight,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    '${state.submitQuizData.calculateQuizResult!.psychotype!.primaryTrait!.iconUrl}')),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8)),
                                          ),
                                        ),
                                        Container(
                                          child: StandardText.bodyMediumBold(
                                            context,
                                            '${state.submitQuizData.calculateQuizResult!.psychotype!.primaryTrait!.title}',
                                            maxLines: 1,
                                            align: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: 8.flexibleWidth),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color:
                                            context.theme.corePalatte.darkGrey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              child: Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        getIt<QuizResultDetailBloc>().add(
                                            QuizResultDetailFetch(
                                                quizResultContentId: int.parse(
                                                    state
                                                        .submitQuizData
                                                        .calculateQuizResult!
                                                        .psychotype!
                                                        .primaryTrait!
                                                        .id!)));
                                        AutoRouter.of(context).push(
                                            const QuizResultDetailRoute());
                                      },
                                      child: UserTypeItemWidget(
                                          userColor:
                                              '${state.submitQuizData.calculateQuizResult!.psychotype!.primaryTrait!.colorCode}',
                                          userTypeImage:
                                              '${state.submitQuizData.calculateQuizResult!.psychotype!.primaryTrait!.iconUrl}',
                                          psychoTypeName: 'Primary type',
                                          psychoTypeTitle:
                                              '${state.submitQuizData.calculateQuizResult!.psychotype!.primaryTrait!.title}')),
                                  12.verticalSpace,
                                  InkWell(
                                    onTap: () {
                                      getIt<QuizResultDetailBloc>().add(
                                          QuizResultDetailFetch(
                                              quizResultContentId: int.parse(
                                                  state
                                                      .submitQuizData
                                                      .calculateQuizResult!
                                                      .psychotype!
                                                      .secondaryTrait!
                                                      .id!)));
                                      AutoRouter.of(context)
                                          .push(const QuizResultDetailRoute());
                                    },
                                    child: UserTypeItemWidget(
                                        userColor:
                                            '${state.submitQuizData.calculateQuizResult!.psychotype!.secondaryTrait!.colorCode}',
                                        userTypeImage: state
                                                    .submitQuizData
                                                    .calculateQuizResult!
                                                    .psychotype!
                                                    .secondaryTrait!
                                                    .imageUrl ==
                                                null
                                            ? '${state.submitQuizData.calculateQuizResult!.psychotype!.primaryTrait!.iconUrl}'
                                            : '${state.submitQuizData.calculateQuizResult!.psychotype!.secondaryTrait!.iconUrl}',
                                        psychoTypeName: 'Secondary type',
                                        psychoTypeTitle:
                                            '${state.submitQuizData.calculateQuizResult!.psychotype!.secondaryTrait!.title}'),
                                  )
                                ],
                              ),
                            ),
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: StandardText.bodyMedium(
                      context,
                      AppLocalizations.of(context)!.chrono_type_text,
                      maxLines: 1,
                      fontSize: 16,
                      align: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  10.verticalSpace,
                  Center(
                    child: InkWell(
                      onTap: () {
                        getIt<QuizResultDetailBloc>().add(QuizResultDetailFetch(
                            quizResultContentId: int.parse(state.submitQuizData
                                .calculateQuizResult!.chronotype!.id!)));
                        AutoRouter.of(context)
                            .push(const QuizResultDetailRoute());
                      },
                      child: UserTypeChronoWidget(
                          userTypeImage:
                              '${state.submitQuizData.calculateQuizResult!.chronotype!.iconUrl}',
                          userTypeTitle:
                              '${state.submitQuizData.calculateQuizResult!.chronotype!.title}',
                          userColor:
                              '${state.submitQuizData.calculateQuizResult!.chronotype!.colorCode}'),
                    ),
                  ),
                  30.verticalSpace,
                  Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StandardText.bodyLarge(
                            context,
                            '${AppLocalizations.of(context)!.not_happy_with_result_text} ',
                            maxLines: 1,
                            fontSize: 14.flexibleFontSize,
                            align: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                          InkWell(
                            onTap: () => AutoRouter.of(context)
                                .push(const QuizProgressRoute()),
                            child: StandardText.bodyMediumBold(
                              context,
                              AppLocalizations.of(context)!
                                  .retake_the_quiz_text,
                              maxLines: 1,
                              fontSize: 14.flexibleFontSize,
                              color: context.theme.corePalatte.primaryColor,
                              align: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: AppButton(
                      width:
                          MediaQuery.of(context).size.width - 64.flexibleWidth,
                      onPressed: () => AutoRouter.of(context).pushAndPopUntil(
                          const HomeRoute(),
                          predicate: (route) {
                            return route.settings.name == SettingsRoute.name;
                          },
                          onFailure: (onFaolure) => {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(AppLocalizations.of(context)!
                                      .navigation_failed_title),
                                  backgroundColor:
                                      context.theme.corePalatte.errorColor,
                                ))
                              }),
                      text: AppLocalizations.of(context)!.home_title,
                    ),
                  ),
                  const Spacer(),
                  15.verticalSpace,
                ],
              ),
            ),
          );
        } else {
          return Container(
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
      },
    ));
  }
}
