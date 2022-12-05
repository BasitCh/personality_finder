import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/color/hex_color.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/quiz_result_detail/presentaion/bloc/quiz_result_detail_bloc.dart';

// ignore: must_be_immutable
class UserMixTypeItem extends StatelessWidget {
  String userType;
  String userImagePrimaryTrait;
  String userImageSecondaryTrait;
  String userTypeNamePrimaryTrait;
  String userTypeNameSecondaryTrait;
  String colorPrimaryTrait;
  String colorSecondaryTrait;
  int userPrimaryTypeId;
  int userSecondaryTypeId;

  UserMixTypeItem({
    required this.userType,
    required this.userImagePrimaryTrait,
    required this.userImageSecondaryTrait,
    required this.userTypeNamePrimaryTrait,
    required this.userTypeNameSecondaryTrait,
    required this.colorPrimaryTrait,
    required this.colorSecondaryTrait,
    required this.userPrimaryTypeId,
    required this.userSecondaryTypeId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      constraints: BoxConstraints(
        minWidth: 0.45 * MediaQuery.of(context).size.width,
        maxWidth: 0.55 * MediaQuery.of(context).size.width,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.theme.corePalatte.gray10),
      child: Column(
        children: [
          Container(
            child: StandardText.bodyMedium(
              context,
              '$userType',
              maxLines: 1,
              fontSize: 12,
              color: context.theme.corePalatte.gray80,
              align: TextAlign.left,
              overflow: TextOverflow.visible,
            ),
          ),
          8.verticalSpace,
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      3.8.verticalSpace,
                      InkWell(
                        onTap: () {
                          getIt<QuizResultDetailBloc>().add(
                              QuizResultDetailFetch(
                                  quizResultContentId: userPrimaryTypeId));
                          AutoRouter.of(context)
                              .push(const QuizResultDetailRoute());
                        },
                        child: Container(
                          width: 56.flexibleWidth,
                          height: 56.flexibleHeight,
                          decoration: BoxDecoration(
                            color: HexColor(colorPrimaryTrait),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Container(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 5,
                                  right: 5,
                                  top: 5,
                                  bottom: 5,
                                  child: Container(
                                    width: 56.flexibleWidth,
                                    height: 56.flexibleHeight,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              '$userImagePrimaryTrait',
                                            ),
                                            scale: 0.1,
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      6.verticalSpace,
                      Container(
                        child: StandardText.bodyMediumBold(
                          context,
                          '$userTypeNamePrimaryTrait',
                          maxLines: 1,
                          fontSize: 14,
                          color: context.theme.corePalatte.darkGrey,
                          align: TextAlign.center,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                10.horizontalSpace,
                Flexible(
                  child: Column(
                    children: [
                      3.8.verticalSpace,
                      InkWell(
                        onTap: () {
                          getIt<QuizResultDetailBloc>().add(
                              QuizResultDetailFetch(
                                  quizResultContentId: userSecondaryTypeId));
                          AutoRouter.of(context)
                              .push(const QuizResultDetailRoute());
                        },
                        child: Container(
                          width: 56.flexibleWidth,
                          height: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: HexColor(colorSecondaryTrait)),
                          child: Container(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 5,
                                  right: 5,
                                  top: 5,
                                  bottom: 5,
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                '$userImageSecondaryTrait'),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      6.verticalSpace,
                      Container(
                        child: StandardText.bodyMediumBold(
                          context,
                          '$userTypeNameSecondaryTrait',
                          maxLines: 1,
                          fontSize: 14,
                          color: context.theme.corePalatte.darkGrey,
                          align: TextAlign.center,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
