// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/global.dart';
import 'package:morphosis_template/core/global/typography/app_typography.dart';
import 'package:scroll_when_needed/scroll_when_needed.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../di/injectable.dart';
import '../../../app/presentation/widgets/app_button_widget.dart';
import '../../../app/presentation/widgets/standard_text.dart';
import '../../../app/presentation/widgets/standard_textfield.dart';
import '../../../login/domain/repositories/auth_repo.dart';
import '../bloc/reset_password_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            AutoRouter.of(context).pop();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10.flexibleWidth),
            child: const Icon(
              Icons.arrow_back_ios_sharp,
              size: 18,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: context.theme.corePalatte.white,
      body: SafeArea(
        child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
            bloc: getIt<ResetPasswordBloc>(),
            listener: (context, state) {
              // TODO: implement listener
              if (state is ResetPasswordSuccess) {
                AutoRouter.of(context).popAndPush(const EmailSentRoute());

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    AppLocalizations.of(context)!.email_successfully_send_text,
                    style: TextStyle(color: context.theme.corePalatte.white),
                  ),
                ));
              } else if (state is ResetPasswordFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.failure,
                    style: TextStyle(color: context.theme.corePalatte.white),
                  ),
                ));
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: ScrollConfiguration(
                  behavior: ScrollWhenNeededBehavior(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.flexibleWidth),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                              'assets/images/icons/app_logo.svg'),
                        ),
                        const Spacer(),
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StandardText.bodyMediumBold(
                                  context,
                                  AppLocalizations.of(context)!
                                      .forgot_password_text,
                                  fontSize: 28.flexibleFontSize,
                                ),
                                15.verticalSpace,
                                StandardText.label(
                                  context,
                                  AppLocalizations.of(context)!
                                      .enter_your_registed_email_desc,
                                  color: context.theme.corePalatte.gray60,
                                  align: TextAlign.left,
                                  fontSize: 14.flexibleFontSize,
                                ),
                                24.verticalSpace,
                                StandardText.label(
                                  context,
                                  AppLocalizations.of(context)!.email_title,
                                  fontSize: 14.flexibleFontSize,
                                ),
                                6.verticalSpace,
                                StandardTextField(
                                  hintText:
                                      AppLocalizations.of(context)!.email_title,
                                  labelStyle: AppTypography.labelSemiBold
                                      .copyWith(fontSize: 14.flexibleFontSize),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  autocorrect: false,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .please_enter_an_email_text;
                                    } else if (!Global.isValidEmail(value)) {
                                      return AppLocalizations.of(context)!
                                          .please_enter_valid_email_text;
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )),
                        24.verticalSpace,
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AppButton(
                            width: MediaQuery.of(context).size.width,
                            isLoading: state is ResetPasswordLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                getIt<ResetPasswordBloc>().add(ForgetPassword(
                                  authType: AuthType.email,
                                  email: emailController.text.trim(),
                                ));
                              }
                            },
                            text: AppLocalizations.of(context)!.send_text,
                          ),
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StandardText.label(
                              context,
                              AppLocalizations.of(context)!
                                  .remember_password_text,
                              fontSize: 14.flexibleFontSize,
                            ),
                            InkWell(
                              onTap: () => AutoRouter.of(context)
                                  .popAndPush(const LoginRoute()),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: StandardText.semiBold(
                                  AppLocalizations.of(context)!.login_title,
                                  fontSize: 14.flexibleFontSize,
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
              );
            }),
      ),
    );
  }
}
