// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import '../../../../../core/global/extensions/context_extensions.dart';
import '../../../../../core/global/extensions/number_extensions.dart';
import '../../../../../core/global/styles/theme_colors.dart';
import '../../../../app/presentation/widgets/app_button_widget.dart';
import '../../../../app/presentation/widgets/standard_text.dart';

class DeleteAccountDialog extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const DeleteAccountDialog({required this.onDelete, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: context.theme.corePalatte.white,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: ThemeColors.black,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            24.verticalSpace,
            SvgPicture.asset(
              'assets/images/icons/delete_account.svg',
              fit: BoxFit.cover,
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  StandardText.header3(
                    context,
                    AppLocalizations.of(context)!.we_are_sad_to_see_you_go_text,
                    align: TextAlign.center,
                  ),
                  10.verticalSpace,
                  StandardText.label(
                    context,
                    AppLocalizations.of(context)!.confirm_delete_account_text,
                    color: context.theme.corePalatte.gray50,
                    fontSize: 16,
                    align: TextAlign.center,
                  ),
                  50.verticalSpace,
                  AppButton(
                    width: MediaQuery.of(context).size.width,
                    color: context.theme.corePalatte.tertiaryRed,
                    borderColor: context.theme.corePalatte.tertiaryRed,
                    onPressed: onDelete,
                    text: AppLocalizations.of(context)!.delete_text,
                  ),
                  15.verticalSpace,
                  AppButton(
                    width: MediaQuery.of(context).size.width,
                    color: context.theme.corePalatte.white,
                    borderColor: context.theme.corePalatte.primaryColor,
                    textColor: context.theme.corePalatte.primaryColor,
                    onPressed: onCancel,
                    text: AppLocalizations.of(context)!.no_text,
                  ),
                ],
              ),
            ),
            24.verticalSpace
          ],
        ),
      ),
    );
  }
}
