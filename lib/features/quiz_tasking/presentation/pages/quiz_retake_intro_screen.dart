import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/app_quiz_button_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';

import '../../../../core/global/navigator/app_router.gr.dart';

class QuizRetakeIntroScreen extends StatefulWidget {
  const QuizRetakeIntroScreen({Key? key}) : super(key: key);

  @override
  State<QuizRetakeIntroScreen> createState() => _QuizRetakeIntroScreenState();
}

class _QuizRetakeIntroScreenState extends State<QuizRetakeIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.corePalatte.white,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                40.verticalSpace,
                Center(
                  child: SvgPicture.asset('assets/images/icons/app_logo.svg'),
                ),
                30.verticalSpace,
                Center(
                  child: Container(
                      width: 319.flexibleWidth,
                      height: 267.flexibleHeight,
                      child: SvgPicture.asset(
                          'assets/images/icons/retake_quiz_avatar.svg')),
                ),
                23.verticalSpace,
                Container(
                  margin: EdgeInsets.only(top: 10.flexibleHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StandardText.bodyMediumBold(
                        context,
                        AppLocalizations.of(context)!.it_is_been_desc_text,
                        maxLines: 2,
                        fontSize: 24,
                        align: TextAlign.center,
                        overflow: TextOverflow.visible,
                      ),
                      12.verticalSpace,
                      StandardText.bodySmallLight(
                        context,
                        AppLocalizations.of(context)!.retake_the_quiz_desc_text,
                        maxLines: 2,
                        fontSize: 16,
                        color: context.theme.corePalatte.gray60,
                        align: TextAlign.center,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
                60.verticalSpace,
                Container(
                  height: 80.flexibleHeight,
                  margin: EdgeInsets.only(top: 10.flexibleHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppQuizButton(
                        onPressed: () => AutoRouter.of(context).push(
                            const QuizProgressRoute()), //QuizProgressRoute
                        text: AppLocalizations.of(context)!
                            .take_our_short_quiz_text,
                      ),
                      12.verticalSpace,
                      StandardText.bodySmall(
                        context,
                        AppLocalizations.of(context)!.only_take_5_minute_text,
                        maxLines: 1,
                        align: TextAlign.left,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ));
  }
}
