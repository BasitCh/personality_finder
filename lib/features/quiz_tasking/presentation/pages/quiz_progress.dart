import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/answers/bloc/save_bloc.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
import 'package:morphosis_template/core/global/styles/theme_font_size.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/presentation/widgets/app_next_button_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/shimmer_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/quiz_result/presentaion/bloc/submit_result_bloc.dart';
import 'package:morphosis_template/features/quiz_tasking/data/model/quiz_answers.dart';
import 'package:morphosis_template/features/quiz_tasking/domain/entities/quiz_response.dart'
    show GetQuizQuestions;
import 'package:morphosis_template/features/quiz_tasking/presentation/bloc/quiz_bloc.dart';

class QuizProgressScreen extends StatefulWidget {
  const QuizProgressScreen({Key? key}) : super(key: key);

  @override
  State<QuizProgressScreen> createState() => _QuizProgressScreenState();
}

enum SingingCharacter { blank, lafayette, jefferson }

class _QuizProgressScreenState extends State<QuizProgressScreen> {
  PageController pageController = PageController(initialPage: 0);
  List<QuizAnswers> quizAnswersList = [];

  int answerQuestCount = 0;

  @override
  initState() {
    super.initState();
    getIt<QuizBloc>().add(const QuizFetch());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.corePalatte.white,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10.flexibleWidth),
              child: const Icon(
                Icons.arrow_back_ios_sharp,
                size: 18,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: BlocConsumer<QuizBloc, QuizState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is QuizFetchSuccess) {
              if (quizAnswersList.isEmpty) {
                state.quizData.getQuizQuestionsList!.forEach((element) {
                  quizAnswersList
                      .add(QuizAnswers(questionId: element.id, answerId: '0'));
                });
              }

              return SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.flexibleWidth),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      5.verticalSpace,
                      Container(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            minHeight: 7,
                            backgroundColor:
                                context.theme.corePalatte.lightGreyColor,
                            value: answerQuestCount / quizAnswersList.length,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                context.theme.corePalatte.primaryColor),
                          ),
                        ),
                      ),
                      30.verticalSpace,
                      Flexible(
                        child: PageView.builder(
                            pageSnapping: true,
                            physics: const NeverScrollableScrollPhysics(),
                            controller: pageController,
                            itemCount:
                                state.quizData.getQuizQuestionsList!.length,
                            itemBuilder: (context, index) {
                              final myQuizData =
                                  state.quizData.getQuizQuestionsList![index];
                              return myQuizData.quizAnswers[0].imageUrl != null
                                  ? gridQuestWidget(
                                      context,
                                      state.quizData.getQuizQuestionsList!
                                          .length,
                                      myQuizData,
                                      state
                                          .quizData
                                          .getQuizQuestionsList![index]
                                          .questionOrder,
                                      index)
                                  : simpleQuestWidget(
                                      context,
                                      state.quizData.getQuizQuestionsList!
                                          .length,
                                      myQuizData,
                                      state
                                          .quizData
                                          .getQuizQuestionsList![index]
                                          .questionOrder,
                                      index);
                            }),
                      )
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

  Widget simpleQuestWidget(BuildContext context, int questionCount,
      GetQuizQuestions getQuizQuestions, int questionId, int currentPageIndex) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StandardText.bodySmallLight(
            context,
            '${AppLocalizations.of(context)!.question_text} ${getQuizQuestions.questionOrder} ${AppLocalizations.of(context)!.of_text} $questionCount',
            fontSize: TEXT_REGULAR_SMALL,
            maxLines: 1,
            align: TextAlign.center,
            overflow: TextOverflow.visible,
          ),
          10.verticalSpace,
          StandardText.bodyMediumBold(
            context,
            '${getQuizQuestions.question}',
            fontSize: 20.flexibleFontSize,
            align: TextAlign.start,
            maxLines: 5,
            overflow: TextOverflow.visible,
          ),
          25.verticalSpace,
          ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: getQuizQuestions.quizAnswers.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              quizAnswersList[currentPageIndex] = QuizAnswers(
                                  questionId: getQuizQuestions.id,
                                  answerId:
                                      getQuizQuestions.quizAnswers[index].id!);
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * .85,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            constraints: const BoxConstraints(minHeight: 56),
                            // padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: quizAnswersList[currentPageIndex]
                                              .answerId
                                              .compareTo(getQuizQuestions
                                                  .quizAnswers[index].id!) ==
                                          0
                                      ? context.theme.corePalatte.tertiaryGreen
                                      : context.theme.corePalatte.gray20),
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(12),
                                right: Radius.circular(12),
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.flexibleFontSize),
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      child: StandardText.bodySmall(
                                        context,
                                        '${getQuizQuestions.quizAnswers[index].answer}',
                                        // maxLines: 3,
                                        fontSize: 16.flexibleFontSize,
                                        align: TextAlign.left,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      height: 25.flexibleHeight,
                                      child: SvgPicture.asset(
                                        quizAnswersList[currentPageIndex]
                                                    .questionId
                                                    .compareTo(
                                                        getQuizQuestions.id) ==
                                                0
                                            ? quizAnswersList[currentPageIndex]
                                                        .answerId
                                                        .compareTo(
                                                            getQuizQuestions
                                                                .quizAnswers[
                                                                    index]
                                                                .id!) ==
                                                    0
                                                ? 'assets/images/icons/selected.svg'
                                                : 'assets/images/icons/uncheck_radio.svg'
                                            : 'assets/images/icons/uncheck_radio.svg',
                                      ),
                                    ),
                                  ),

                                  // ),
                                ],
                              ),
                            ),
                          )),
                      15.verticalSpace
                    ],
                  ),
                );
              }),
          Center(
            child: AppNextButton(
              width: MediaQuery.of(context).size.width * 0.85,
              onPressed: () {
                if (quizAnswersList[currentPageIndex].answerId.compareTo('0') !=
                    0) {
                  setState(() {
                    answerQuestCount += 1;
                  });
                  pageController.animateToPage(currentPageIndex + 1,
                      duration: const Duration(microseconds: 250),
                      curve: Curves.bounceInOut);
                }

                if (currentPageIndex.compareTo(questionCount - 1) == 0 &&
                    quizAnswersList[currentPageIndex].answerId.compareTo('0') !=
                        0) {
                  var answerLeft = 0;
                  for (var index = 0; index < quizAnswersList.length; index++) {
                    if (quizAnswersList[index].answerId.compareTo('0') == 0) {
                      answerLeft = quizAnswersList.length - (index + 1);
                      pageController.animateToPage(index,
                          duration: const Duration(microseconds: 250),
                          curve: Curves.bounceInOut);
                    }
                  }

                  if (answerLeft == 0) {
                    AutoRouter.of(context)
                        .pushAndPopUntil(const QuizResultRoute(),
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
                                });

                    var myData = '[';
                    quizAnswersList.forEach((element) {
                      myData +=
                          '{questionId:${element.questionId},answerId:${element.answerId}}';
                    });
                    myData += ']';

                    getIt<SubmitQuizResultBloc>()
                        .add(SubmitQuizUpload(answerQueires: myData));
                  }
                }
              },
              changeColor:
                  quizAnswersList[currentPageIndex].answerId.compareTo('0') !=
                      0,
              text: currentPageIndex.compareTo(questionCount - 1) == 0
                  ? AppLocalizations.of(context)!.submit_text
                  : AppLocalizations.of(context)!.next_text,
            ),
          ),
          59.verticalSpace
        ],
      ),
    );
  }

  void navigateToNextQuestion(int currentPageIndex) {
    pageController.animateToPage(currentPageIndex + 1,
        duration: const Duration(microseconds: 250), curve: Curves.bounceInOut);
  }

  Widget gridQuestWidget(BuildContext context, int questionCount,
      GetQuizQuestions getQuizQuestions, int questionId, int currentPageIndex) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: getQuizQuestions.quizAnswers.length <= 2 ? 1 : 0,
          child: Container(),
        ),
        Expanded(
          flex: getQuizQuestions.quizAnswers.length <= 2 ? 2 : 1,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.flexibleWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StandardText.bodySmallLight(
                    context,
                    '${AppLocalizations.of(context)!.question_text} ${getQuizQuestions.questionOrder} ${AppLocalizations.of(context)!.of_text} $questionCount',
                    fontSize: 14.flexibleFontSize,
                    maxLines: 1,
                    align: TextAlign.center,
                    overflow: TextOverflow.visible,
                  ),
                  6.verticalSpace,
                  StandardText.bodyMediumBold(
                    context,
                    '${getQuizQuestions.question}',
                    maxLines: 2,
                    fontSize: 24.flexibleFontSize,
                    align: TextAlign.start,
                    overflow: TextOverflow.visible,
                  ),
                  24.verticalSpace,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: ClampingScrollPhysics()),
                        itemCount: getQuizQuestions.quizAnswers.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 10,
                            mainAxisExtent: 210.flexibleHeight,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                quizAnswersList[currentPageIndex] = QuizAnswers(
                                    questionId: getQuizQuestions.id,
                                    answerId: getQuizQuestions
                                        .quizAnswers[index].id!);
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: quizAnswersList[
                                                          currentPageIndex]
                                                      .questionId
                                                      .compareTo(
                                                          getQuizQuestions
                                                              .id) ==
                                                  0
                                              ? quizAnswersList[
                                                              currentPageIndex]
                                                          .answerId
                                                          .compareTo(
                                                              getQuizQuestions
                                                                  .quizAnswers[
                                                                      index]
                                                                  .id!) ==
                                                      0
                                                  ? context.theme.corePalatte
                                                      .tertiaryGreen
                                                  : context
                                                      .theme.corePalatte.gray50
                                              : context
                                                  .theme.corePalatte.gray50)),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(8),
                                        width: 132.flexibleWidth,
                                        height: 132.flexibleHeight,
                                        constraints: BoxConstraints(
                                            minHeight: 132.flexibleHeight),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  '${getQuizQuestions.quizAnswers[index].imageUrl}',
                                              fit: BoxFit.fitWidth,
                                              placeholder: (context, url) =>
                                                  ShimmerContainer(
                                                width: 132.flexibleWidth,
                                                type: ShimmerType.square,
                                              ),
                                              errorWidget: (context, url,
                                                      dynamic error) =>
                                                  ShimmerContainer(
                                                width: 132.flexibleWidth,
                                                type: ShimmerType.square,
                                              ),
                                            )),
                                      ),
                                      4.verticalSpace,
                                      Container(
                                        child: StandardText.bodySmall(
                                          context,
                                          '${getQuizQuestions.quizAnswers[index].answer}',
                                          fontSize: 12.flexibleFontSize,
                                          align: TextAlign.center,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                      12.verticalSpace,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  32.verticalSpace,
                  Center(
                    child: AppNextButton(
                      width: MediaQuery.of(context).size.width * 0.68,
                      onPressed: () {
                        if (quizAnswersList[currentPageIndex]
                                .answerId
                                .compareTo('0') !=
                            0) {
                          setState(() {
                            answerQuestCount += 1;
                          });
                          pageController.animateToPage(currentPageIndex + 1,
                              duration: const Duration(microseconds: 250),
                              curve: Curves.bounceInOut);
                        }

                        if (currentPageIndex.compareTo(questionCount - 1) ==
                                0 &&
                            quizAnswersList[currentPageIndex]
                                    .answerId
                                    .compareTo('0') !=
                                0) {
                          var answerLeft = 0;
                          for (var index = 0;
                              index < quizAnswersList.length;
                              index++) {
                            if (quizAnswersList[index]
                                    .answerId
                                    .compareTo('0') ==
                                0) {
                              answerLeft = quizAnswersList.length - (index + 1);
                              pageController.animateToPage(index,
                                  duration: const Duration(microseconds: 250),
                                  curve: Curves.bounceInOut);
                            }
                          }

                          if (answerLeft == 0) {
                            AutoRouter.of(context)
                                .pushAndPopUntil(const QuizResultRoute(),
                                    predicate: (route) {
                                      return route.settings.name ==
                                          SettingsRoute.name;
                                    },
                                    onFailure: (onFaolure) => {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                AppLocalizations.of(context)!
                                                    .navigation_failed_title),
                                            backgroundColor: context
                                                .theme.corePalatte.errorColor,
                                          ))
                                        });

                            var myData = '[';
                            quizAnswersList.forEach((element) {
                              myData +=
                                  '{questionId:${element.questionId},answerId:${element.answerId}}';
                            });
                            myData += ']';
                            getIt<SaveAnswerBloc>().add(SaveAnswerData(
                                saveAnswerData: quizAnswersList));
                            getIt<SubmitQuizResultBloc>()
                                .add(SubmitQuizUpload(answerQueires: myData));
                          }
                        }
                      },
                      // ignore: avoid_bool_literals_in_conditional_expressions
                      changeColor: quizAnswersList[currentPageIndex]
                              .answerId
                              .compareTo('0') !=
                          0,
                      text: currentPageIndex.compareTo(questionCount - 1) == 0
                          ? AppLocalizations.of(context)!.submit_text
                          : AppLocalizations.of(context)!.next_text,
                    ),
                  ),
                  59.verticalSpace
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
