// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../app/presentation/widgets/standard_text.dart';

class EmailSentScreen extends StatefulWidget {
  @override
  _EmailSentScreenState createState() => _EmailSentScreenState();
}

class _EmailSentScreenState extends State<EmailSentScreen> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.corePalatte.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.verticalSpace,
                Center(
                  child: SvgPicture.asset('assets/images/icons/app_logo.svg'),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/icons/email_sent.svg'),
                    10.verticalSpace,
                    StandardText.bodyMediumBold(
                      context,
                      AppLocalizations.of(context)!.email_has_been_send_text,
                      fontSize: 20,
                    ),
                    10.verticalSpace,
                    StandardText.label(
                      context,
                      AppLocalizations.of(context)!
                          .please_check_your_inbox_reset_password_desc_text,
                      color: context.theme.corePalatte.gray60,
                    ),
                  ],
                ),
                const Spacer(),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StandardText.label(
                      context,
                      AppLocalizations.of(context)!.do_not_recive_the_link_text,
                      fontSize: 12,
                    ),
                    InkWell(
                      onTap: () {
                        AutoRouter.of(context)
                            .popAndPush(const ResetPasswordRoute());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: StandardText.semiBold(
                          AppLocalizations.of(context)!.resend_text,
                          fontSize: 12,
                          color: context.theme.corePalatte.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
