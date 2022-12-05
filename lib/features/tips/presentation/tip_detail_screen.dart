// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/extensions/string_extensions.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/presentation/widgets/app_button_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/shimmer_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/feedback/bloc/feedback_bloc.dart';
import 'package:morphosis_template/features/home/presentation/widgets/awareness_showdialog.dart';
import 'package:morphosis_template/features/quiz_result_detail/presentaion/pages/item_widget.dart';
import 'package:morphosis_template/features/tips/presentation/blocs/tip_details/tip_details_bloc.dart';
import 'package:morphosis_template/features/tips/presentation/widgets/tip_details_loading_shimmer.dart';

// ignore: must_be_immutable
class TipDetailScreen extends StatefulWidget {
  final String tipId;

  const TipDetailScreen({required this.tipId});

  @override
  _TipDetailScreenState createState() => _TipDetailScreenState();
}

class _TipDetailScreenState extends State<TipDetailScreen> {
  bool? useful = false;
  late final TipDetailsBloc tipDetailsBloc;

  @override
  void initState() {
    super.initState();
    tipDetailsBloc = getIt<TipDetailsBloc>();

    Future<dynamic>.delayed(const Duration(seconds: 3));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      tipDetailsBloc.add(FetchTipById(tipId: widget.tipId));
    });
  }

  @override
  Widget build(BuildContext context) {
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
        title: StandardText.header5(
            context, AppLocalizations.of(context)!.weekly_text),
      ),
      body: BlocConsumer(
        bloc: tipDetailsBloc,
        listener: (context, state) {
          if (state is TipDetailsLoaded) {
            useful = state.tip.userFeedback;
          }
        },
        builder: (context, state) {
          return state is LoadingTipDetails
              ? TipDetailsLoadingShimmer()
              : (state is TipDetailsLoaded)
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: state
                                      .tip.quizResultContent?.colorCode?.toColor
                                      .call(),
                                  borderRadius: BorderRadius.circular(6)),
                              child: StandardText.bodyMediumBold(
                                context,
                                '${state.tip.quizResultContent?.title ?? ''}',
                                fontSize: 10,
                                color: context.theme.corePalatte.darkGrey,
                                align: TextAlign.left,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            12.verticalSpace,
                            StandardText.header4(
                              context,
                              '${state.tip.title ?? ''}',
                              maxLines: 3,
                              fontSize: 16,
                              color: context.theme.corePalatte.darkGrey,
                              align: TextAlign.left,
                              overflow: TextOverflow.visible,
                            ),
                            4.verticalSpace,
                            StandardText.label(
                              context,
                              '${state.tip.publishDate != null && state.tip.publishDate!.isNotEmpty ? getFormattedDate(state.tip.publishDate!) : ''}',
                              maxLines: 2,
                              fontSize: 12,
                              color: context.theme.corePalatte.gray60,
                              align: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                            20.verticalSpace,
                            Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 4,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: state.tip.imageUrl != null &&
                                            state.tip.imageUrl!.isNotEmpty
                                        ? Colors.transparent
                                        : context.theme.corePalatte.gray10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: state.tip.imageUrl != null &&
                                          state.tip.imageUrl!.isNotEmpty
                                      ? CachedNetworkImage(
                                          imageUrl: '${state.tip.imageUrl}',
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              ShimmerContainer(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            type: ShimmerType.square,
                                          ),
                                          errorWidget:
                                              (context, url, dynamic error) =>
                                                  ShimmerContainer(
                                            height: 200.flexibleHeight,
                                            type: ShimmerType.square,
                                          ),
                                        )
                                      : ShimmerContainer(
                                          height: 200.flexibleHeight,
                                          type: ShimmerType.square,
                                        ),
                                ),
                              ),
                            ),
                            20.verticalSpace,
                            StandardText.bodyMedium(
                              context,
                              '${state.tip.description ?? ''}',
                              fontSize: 12,
                              color: context.theme.corePalatte.gray60,
                              align: TextAlign.left,
                            ),
                            50.verticalSpace,
                            state.tip.tipQuestions != null &&
                                    state.tip.tipQuestions!.isNotEmpty
                                ? Center(
                                    child: Column(
                                      children: [
                                        AppButton(
                                          onPressed: () async {
                                            final result =
                                                await AutoRouter.of(context)
                                                    .push(TipQuestionRoute(
                                                        tipQuestions: state
                                                            .tip.tipQuestions));
                                            if (result != null) {
                                              tipDetailsBloc.add(FetchTipById(
                                                  tipId: widget.tipId));
                                            }
                                          },
                                          width:
                                              MediaQuery.of(context).size.width,
                                          text: AppLocalizations.of(context)!
                                              .share_your_thoughts_text,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet<void>(
                                              context: context,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(24),
                                                              topRight:
                                                                  Radius
                                                                      .circular(
                                                                          24))),
                                              builder: (context) {
                                                return const AwarenessExplainDialog();
                                              },
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: StandardText.label(
                                              context,
                                              AppLocalizations.of(context)!
                                                  .tip_earn_awareness_point,
                                              maxLines: 2,
                                              fontSize: 12,
                                              color: context
                                                  .theme.corePalatte.gray60,
                                              align: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 16, horizontal: 32),
                                          child: StandardText.bodyMediumBold(
                                            context,
                                            AppLocalizations.of(context)!
                                                .is_this_useful_text,
                                            maxLines: 8,
                                            fontSize: 14,
                                            color: context
                                                .theme.corePalatte.darkGrey,
                                            align: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          width: 250,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    useful = false;
                                                  });
                                                  getIt<FeedbackBloc>().add(
                                                      SubmitTipFeedback(
                                                          feedbackStatus:
                                                              useful!,
                                                          id: int.parse(
                                                              state.tip.id!)));
                                                },
                                                child: ItemWidget(
                                                    content:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .less_useful_text,
                                                    isSelected: useful != false
                                                        ? false
                                                        : true),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      useful = true;
                                                    });
                                                    getIt<FeedbackBloc>().add(
                                                        SubmitTipFeedback(
                                                            feedbackStatus:
                                                                useful!,
                                                            id: int.parse(state
                                                                .tip.id!)));
                                                  },
                                                  child: ItemWidget(
                                                      content:
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .useful_text,
                                                      isSelected: useful != true
                                                          ? false
                                                          : true))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            20.verticalSpace,
                          ],
                        ),
                      ),
                    )
                  : (state is FailedLoadingTipDetails)
                      ? Center(
                          child: StandardText.label(context, state.error),
                        )
                      : const SizedBox.shrink();
        },
      ),
    );
  }
}
