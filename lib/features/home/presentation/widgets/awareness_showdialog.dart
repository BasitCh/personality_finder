import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/features/app/presentation/widgets/app_quiz_button_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';

class AwarenessExplainDialog extends StatelessWidget {
  const AwarenessExplainDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height / 2.3,
          decoration: BoxDecoration(
              color: context.theme.corePalatte.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: SafeArea(
            child: Column(
              children: [
                32.verticalSpace,
                StandardText.bodyMediumBold(
                  context,
                  AppLocalizations.of(context)!.what_is_the_awareness_score_text,
                  maxLines: 2,
                  fontSize: 24,
                  color: context.theme.corePalatte.darkGrey,
                  align: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
                16.verticalSpace,
                StandardText.bodyLarge(
                  context,
                  AppLocalizations.of(context)!.the_more_you_know_desc,
                  maxLines: 4,
                  fontSize: 14,
                  color: context.theme.corePalatte.gray60,
                  align: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
                const Spacer(),
                AppQuizButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: context.theme.corePalatte.darkBlue,
                  text: AppLocalizations.of(context)!.got_it_text,
                ),
                32.verticalSpace
              ],
            ),
          )),
    );
  }
}
