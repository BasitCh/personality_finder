import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/extensions/string_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/shimmer_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/tips/data/entities/tip.dart';

class TipsItem extends StatelessWidget {
  final Tip tip;
  final bool? displayShadow;

  const TipsItem({required this.tip, this.displayShadow = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.theme.corePalatte.gray20,
        ),
        color: context.theme.corePalatte.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: displayShadow!
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 20,
                ),
              ]
            : null,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: tip.imageUrl != null && tip.imageUrl!.isNotEmpty
                      ? Colors.transparent
                      : context.theme.corePalatte.gray10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: tip.imageUrl != null && tip.imageUrl!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: '${tip.imageUrl}',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => ShimmerContainer(
                          height: 88.flexibleHeight,
                          width: 88.flexibleWidth,
                          type: ShimmerType.square,
                        ),
                        errorWidget: (context, url, dynamic error) =>
                            ShimmerContainer(
                          height: 88.flexibleHeight,
                          width: 88.flexibleWidth,
                          type: ShimmerType.square,
                        ),
                      )
                    : ShimmerContainer(
                        height: 88.flexibleHeight,
                        width: 88.flexibleWidth,
                        type: ShimmerType.square,
                      ),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tip.quizResultContent != null
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              color: tip.quizResultContent != null
                                  ? tip.quizResultContent!.colorCode!.toColor
                                      .call()
                                  : context.theme.corePalatte.primaryColor,
                              borderRadius: BorderRadius.circular(6)),
                          child: StandardText.bodyMediumBold(
                            context,
                            '${tip.quizResultContent?.title ?? ''}',
                            maxLines: 2,
                            fontSize: 10.flexibleFontSize,
                            color: context.theme.corePalatte.darkGrey,
                            align: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : const SizedBox.shrink(),
                  7.verticalSpace,
                  StandardText.header4(
                    context,
                    '${tip.title ?? ''}',
                    maxLines: 2,
                    fontSize: 16.flexibleFontSize,
                    color: context.theme.corePalatte.darkGrey,
                    align: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                  6.verticalSpace,
                  StandardText.bodyMedium(
                    context,
                    '${tip.description ?? ''}',
                    maxLines: 3,
                    fontSize: 12.flexibleFontSize,
                    color: context.theme.corePalatte.darkGrey,
                    align: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                  7.verticalSpace,
                  StandardText.bodyLarge(
                    context,
                    '${tip.publishDate != null && tip.publishDate!.isNotEmpty ? getFormattedDate(tip.publishDate!) : ''}',
                    maxLines: 2,
                    fontSize: 12.flexibleFontSize,
                    color: context.theme.corePalatte.gray60,
                    align: TextAlign.left,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
