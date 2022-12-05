// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/presentation/widgets/shimmer_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/feedback/bloc/feedback_bloc.dart';
import 'package:morphosis_template/features/quiz_result_detail/presentaion/bloc/quiz_result_detail_bloc.dart';
import 'package:morphosis_template/features/quiz_result_detail/presentaion/pages/item_widget.dart';

class QuizResultDetailScreen extends StatefulWidget {
  const QuizResultDetailScreen({Key? key}) : super(key: key);

  @override
  State<QuizResultDetailScreen> createState() => _QuizResultDetailScreenState();
}

class _QuizResultDetailScreenState extends State<QuizResultDetailScreen> {
  bool? useful;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizResultDetailBloc, QuizResultDetailState>(
      bloc: getIt<QuizResultDetailBloc>(),
      listener: (context, state) {
        if (state is QuizResultDetailSuccess) {
          setState(() {
            useful = state
                        .quizResultData.getResultContentGeneral!.userFeedback !=
                    null
                ? state.quizResultData.getResultContentGeneral!.userFeedback ==
                        true
                    ? true
                    : false
                : null;
          });
        }
      },
      builder: (context, state) {
        if (state is QuizResultDetailSuccess) {
          return Scaffold(
            backgroundColor: context.theme.corePalatte.white,
            appBar: AppBar(
              leading: InkWell(
                onTap: () => AutoRouter.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 20,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              title: StandardText.header5(context,
                  '${state.quizResultData.getResultContentGeneral!.title}'),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 32),
                        width: 326.flexibleWidth,
                        height: 210.flexibleHeight,
                        child: CachedNetworkImage(
                          imageUrl:
                              '${state.quizResultData.getResultContentGeneral!.imageUrl}',
                          placeholder: (context, url) => ShimmerContainer(
                            height: 326.flexibleHeight,
                            width: 210.flexibleWidth,
                            type: ShimmerType.square,
                          ),
                          errorWidget: (context, url, dynamic error) =>
                              ShimmerContainer(
                            height: 326.flexibleHeight,
                            width: 210.flexibleWidth,
                            type: ShimmerType.square,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        child: StandardText.bodyMediumBold(
                          context,
                          '${state.quizResultData.getResultContentGeneral!.boldDescription}',
                          fontSize: 16,
                          color: context.theme.corePalatte.darkGrey,
                          align: TextAlign.left,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        child: StandardText.bodyLarge(
                          context,
                          '${state.quizResultData.getResultContentGeneral!.description}',
                          fontSize: 14,
                          color: context.theme.corePalatte.gray60,
                          align: TextAlign.left,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      30.verticalSpace,
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        child: StandardText.bodyMediumBold(
                          context,
                          AppLocalizations.of(context)!.is_this_useful_text,
                          fontSize: 14,
                          color: context.theme.corePalatte.darkGrey,
                          align: TextAlign.left,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    useful = false;
                                  });

                                  getIt<FeedbackBloc>().add(FeedbackGive(
                                      feedbackStatus: useful!,
                                      id: int.parse(state.quizResultData
                                          .getResultContentGeneral!.id)));
                                },
                                child: ItemWidget(
                                    content: AppLocalizations.of(context)!
                                        .less_useful_text,
                                    isSelected: useful != false ? false : true),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      useful = true;
                                    });

                                    getIt<FeedbackBloc>().add(FeedbackGive(
                                        feedbackStatus: useful!,
                                        id: int.parse(state.quizResultData
                                            .getResultContentGeneral!.id)));
                                  },
                                  child: ItemWidget(
                                    content: AppLocalizations.of(context)!
                                        .useful_text,
                                    isSelected: useful != true ? false : true,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      30.verticalSpace
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          );
        }
      },
    );
  }
}
