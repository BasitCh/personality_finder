// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
import 'package:morphosis_template/features/app/presentation/widgets/app_quiz_button_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';

class QuizIntroScreen extends StatefulWidget {
  const QuizIntroScreen({Key? key}) : super(key: key);

  @override
  State<QuizIntroScreen> createState() => _QuizIntroScreenState();
}

class _QuizIntroScreenState extends State<QuizIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: context.theme.corePalatte.white,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                40.verticalSpace,
                Center(
                  child: SvgPicture.asset('assets/images/icons/app_logo.svg'),
                ),
                const Spacer(),
                Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      child: SvgPicture.asset('assets/images/icons/magic.svg')),
                ),
                23.verticalSpace,
                Container(
                  margin: EdgeInsets.only(top: 10.flexibleHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StandardText.bodyMediumBold(
                        context,
                        AppLocalizations.of(context)!
                            .frustrated_with_relationship_at_work_text,
                        maxLines: 2,
                        fontSize: 24.flexibleFontSize,
                        align: TextAlign.center,
                        overflow: TextOverflow.visible,
                      ),
                      20.verticalSpace,
                      StandardText.bodySmallLight(
                        context,
                        AppLocalizations.of(context)!.let_us_help_you_text,
                        fontSize: 16.flexibleFontSize,
                        align: TextAlign.center,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
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
                      10.verticalSpace,
                      StandardText.bodySmall(
                        context,
                        AppLocalizations.of(context)!.only_take_5_minute_text,
                        align: TextAlign.left,
                        fontSize: 16.flexibleFontSize,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
                50.verticalSpace
              ],
            ),
          ),
        ));
  }
}
