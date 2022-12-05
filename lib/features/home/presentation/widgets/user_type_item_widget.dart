import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/color/hex_color.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/quiz_result_detail/presentaion/bloc/quiz_result_detail_bloc.dart';

// ignore: must_be_immutable
class UserTypeItem extends StatelessWidget {
  String userType;
  String userImage;
  String userTypeName;
  String color;
  int userTypeID;
  UserTypeItem({
    required this.userType,
    required this.userImage,
    required this.userTypeName,
    required this.color,
    required this.userTypeID,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 130,
      padding: EdgeInsets.symmetric(vertical: 12.flexibleHeight),
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
              color: context.theme.corePalatte.darkGrey,
              align: TextAlign.left,
              overflow: TextOverflow.visible,
            ),
          ),
          8.verticalSpace,
          InkWell(
            onTap: () {
              getIt<QuizResultDetailBloc>()
                  .add(QuizResultDetailFetch(quizResultContentId: userTypeID));
              AutoRouter.of(context).push(const QuizResultDetailRoute());
            },
            child: Container(
              width: 65.flexibleWidth,
              height: 65.flexibleHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: HexColor(color)),
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
                                image: NetworkImage('$userImage'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          1.verticalSpace,
          Container(
            child: StandardText.bodyMediumBold(
              context,
              '$userTypeName',
              maxLines: 1,
              fontSize: 14,
              color: context.theme.corePalatte.darkGrey,
              align: TextAlign.left,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
