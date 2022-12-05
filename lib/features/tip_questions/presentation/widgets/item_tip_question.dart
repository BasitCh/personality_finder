import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/presentation/widgets/app_button_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_textfield.dart';
import 'package:morphosis_template/features/tip_questions/data/entities/submit_answer_request.dart';
import 'package:morphosis_template/features/tip_questions/presentation/bloc/tip_question_bloc.dart';
import 'package:morphosis_template/features/tip_questions/presentation/widgets/item_grid_answers.dart';
import 'package:morphosis_template/features/tip_questions/presentation/widgets/item_list_answers.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_question.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_question_answers.dart';

enum TipQuestionType { selection, open_ended }

class ItemTipQuestion extends StatefulWidget {
  final TipQuestion tipQuestion;
  final PageController pageController;
  final bool? isLastQuestion;

  const ItemTipQuestion(
      {required this.tipQuestion,
      required this.pageController,
      this.isLastQuestion = false});

  @override
  State<ItemTipQuestion> createState() => _ItemTipQuestionState();
}

class _ItemTipQuestionState extends State<ItemTipQuestion> {
  late TipQuestionAnswers selectedQuestionAnswer;
  String questionAnswerText = '';
  bool isAnswered = false;
  late final TipQuestionBloc tipQuestionBloc;

  @override
  void initState() {
    super.initState();
    tipQuestionBloc = getIt<TipQuestionBloc>()..add(InitialTipEvent());
    widget.tipQuestion.tipQuestionAnswers!.forEach((element) {
      element.isSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: tipQuestionBloc,
        listener: (context, state) {
          if (state is AnswerSubmitted) {
            if (widget.isLastQuestion!) {
              AutoRouter.of(context).pop(true);
            } else {
              widget.pageController.animateToPage(
                  widget.pageController.page!.toInt() + 1,
                  duration: const Duration(microseconds: 250),
                  curve: Curves.bounceInOut);
            }
          } else if (state is FailedSubmittingAnswer) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.error,
                style: TextStyle(color: context.theme.corePalatte.white),
              ),
            ));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: StandardText.bodyMediumBold(
                    context,
                    '${widget.tipQuestion.question}',
                    maxLines: 2,
                    fontSize: 24,
                    align: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                25.verticalSpace,
                widget.tipQuestion.questionType ==
                        TipQuestionType.open_ended.name
                    ? StandardTextField(
                        hintText:
                            AppLocalizations.of(context)!.your_answer_text,
                        textInputAction: TextInputAction.done,
                        maxLines: 10,
                        fillColor: context.theme.corePalatte.white,
                        onChanged: (value) {
                          setState(() {
                            questionAnswerText = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!
                                .please_enter_your_thoughts_text;
                          }

                          return null;
                        },
                      )
                    : widget.tipQuestion.tipQuestionAnswers![0].imageUrl !=
                                null &&
                            widget.tipQuestion.tipQuestionAnswers![0].imageUrl!
                                .isNotEmpty
                        ? ItemGridAnswers(
                            tipQuestionAnswers:
                                widget.tipQuestion.tipQuestionAnswers!,
                            selectedAnswer: (tipQuestionAnswer) {
                              setState(() {
                                selectedQuestionAnswer = tipQuestionAnswer;
                                isAnswered = true;
                              });
                            },
                          )
                        : ItemListAnswers(
                            tipQuestionAnswers:
                                widget.tipQuestion.tipQuestionAnswers!,
                            selectedAnswer: (tipQuestionAnswer) {
                              setState(() {
                                selectedQuestionAnswer = tipQuestionAnswer;
                                isAnswered = true;
                              });
                            },
                          ),
                30.verticalSpace,
                IgnorePointer(
                  ignoring: state is SubmittingAnswer,
                  child: AppButton(
                    isLoading: state is SubmittingAnswer,
                    onPressed: (widget.tipQuestion.questionType ==
                                    TipQuestionType.open_ended.name &&
                                questionAnswerText.isNotEmpty) ||
                            (widget.tipQuestion.questionType ==
                                    TipQuestionType.selection.name &&
                                isAnswered)
                        ? () {
                            if (widget.tipQuestion.questionType ==
                                    TipQuestionType.selection.name &&
                                isAnswered) {
                              tipQuestionBloc.add(AnswerTipQuestion(
                                  submitAnswerRequest: SubmitAnswerRequest(
                                      tipQuestionId: widget.tipQuestion.id!,
                                      tipQuestionAnswerId:
                                          selectedQuestionAnswer.id!)));
                            } else {
                              tipQuestionBloc.add(AnswerTipQuestion(
                                  submitAnswerRequest: SubmitAnswerRequest(
                                      tipQuestionId: widget.tipQuestion.id!,
                                      openEndedAnswer:
                                          questionAnswerText.isNotEmpty
                                              ? questionAnswerText
                                              : null.toString())));
                            }
                          }
                        : null,
                    width: MediaQuery.of(context).size.width,
                    text: widget.isLastQuestion!
                        ? AppLocalizations.of(context)!.submit_text
                        : AppLocalizations.of(context)!.next_text,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
