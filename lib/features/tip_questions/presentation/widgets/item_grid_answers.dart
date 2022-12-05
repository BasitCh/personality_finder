import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/shimmer_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/tips/data/entities/tip_question_answers.dart';

class ItemGridAnswers extends StatelessWidget {
  final List<TipQuestionAnswers> tipQuestionAnswers;
  final Function(TipQuestionAnswers) selectedAnswer;

  const ItemGridAnswers(
      {required this.tipQuestionAnswers, required this.selectedAnswer});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: tipQuestionAnswers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 210,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                tipQuestionAnswers.forEach((element) {
                  element.isSelected = false;
                });
                tipQuestionAnswers[index].isSelected = true;
                selectedAnswer(tipQuestionAnswers[index]);
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: tipQuestionAnswers[index].isSelected!
                                ? context.theme.corePalatte.primaryColor
                                : context.theme.corePalatte.gray20),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 132,
                            height: 132,
                            margin: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${tipQuestionAnswers[index].imageUrl}',
                                  fit: BoxFit.fitWidth,
                                  placeholder: (context, url) =>
                                      ShimmerContainer(
                                    height: 132.flexibleHeight,
                                    width: 132.flexibleWidth,
                                    type: ShimmerType.square,
                                  ),
                                  errorWidget: (context, url, dynamic error) =>
                                      ShimmerContainer(
                                    height: 132.flexibleHeight,
                                    width: 132.flexibleWidth,
                                    type: ShimmerType.square,
                                  ),
                                )),
                          ),
                          20.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: StandardText.label(
                              context,
                              tipQuestionAnswers[index].answer ?? '',
                              maxLines: 2,
                              fontSize: 16,
                              align: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
