import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_question_answers.dart';

class ItemListAnswers extends StatelessWidget {
  final List<TipQuestionAnswers> tipQuestionAnswers;
  final Function(TipQuestionAnswers) selectedAnswer;

  const ItemListAnswers(
      {required this.tipQuestionAnswers, required this.selectedAnswer});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: tipQuestionAnswers.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                tipQuestionAnswers.forEach((element) {
                  element.isSelected = false;
                });
                tipQuestionAnswers[index].isSelected = true;
                selectedAnswer(tipQuestionAnswers[index]);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(vertical: 16),
                constraints: const BoxConstraints(minHeight: 56),
                // padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: context.theme.corePalatte.gray20),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(12),
                    right: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.flexibleWidth),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 270.flexibleWidth,
                          child: StandardText.bodySmall(
                            context,
                            '${tipQuestionAnswers[index].answer}',
                            maxLines: 3,
                            fontSize: 16,
                            align: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 40.flexibleWidth,
                          height: 25.flexibleHeight,
                          margin: const EdgeInsets.only(right: 5),
                          child: SvgPicture.asset(
                              tipQuestionAnswers[index].isSelected!
                                  ? 'assets/images/icons/checked.svg'
                                  : 'assets/images/icons/uncheck_radio.svg'),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
