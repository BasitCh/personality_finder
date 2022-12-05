// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/typography/app_typography.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../../core/global/global.dart';
import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../core/global/styles/theme_colors.dart';
import '../../../app/presentation/widgets/app_button_widget.dart';
import '../../../app/presentation/widgets/standard_text.dart';
import '../../../app/presentation/widgets/standard_textfield.dart';
import '../../data/model/user_data.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode companyFocusNode;

  bool showPassword = false;

  @override
  void initState() {
    // TODO: implement initState

    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    companyFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    companyFocusNode.dispose();

    emailController.dispose();
    passwordController.dispose();
    companyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ThemeColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32.flexibleWidth),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  30.verticalSpace,
                  Center(
                    child: SvgPicture.asset('assets/images/icons/app_logo.svg'),
                  ),
                  const Spacer(),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StandardText.header4(
                            context,
                            AppLocalizations.of(context)!.register_title,
                          ),
                          24.verticalSpace,
                          StandardText.semiBold(
                            AppLocalizations.of(context)!.email_title,
                            fontSize: 14.flexibleFontSize,
                          ),
                          6.verticalSpace,
                          StandardTextField(
                            hintText: AppLocalizations.of(context)!.email_title,
                            controller: emailController,
                            focusNode: emailFocusNode,
                            labelStyle: AppTypography.labelSemiBold
                                .copyWith(fontSize: 14.flexibleFontSize),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              setState(_validateForm);
                            },
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
                          16.verticalSpace,
                          StandardText.semiBold(
                            AppLocalizations.of(context)!.password_title,
                            fontSize: 14.flexibleFontSize,
                          ),
                          6.verticalSpace,
                          StandardTextField(
                            hintText:
                                AppLocalizations.of(context)!.password_title,
                            controller: passwordController,
                            focusNode: passwordFocusNode,
                            obscureText: !showPassword,
                            labelStyle: AppTypography.labelSemiBold
                                .copyWith(fontSize: 14.flexibleFontSize),
                            autocorrect: false,
                            showSuffixIcon: true,
                            suffixWidget: InkWell(
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child: Container(
                                    child: Icon(showPassword
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye_outlined))),
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              setState(_validateForm);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .please_enter_a_password_text;
                              } else if (value.length < 8) {
                                return AppLocalizations.of(context)!
                                    .please_enter_password_at_least_of_8_characters;
                              }
                              return null;
                            },
                          ),
                          16.verticalSpace,
                          StandardText.semiBold(
                            AppLocalizations.of(context)!.company_code_title,
                            fontSize: 14.flexibleFontSize,
                          ),
                          5.verticalSpace,
                          StandardTextField(
                            hintText: 'Code',
                            controller: companyController,
                            focusNode: companyFocusNode,
                            labelStyle: AppTypography.labelSemiBold
                                .copyWith(fontSize: 14.flexibleFontSize),
                            autocorrect: false,
                            textInputAction: TextInputAction.done,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: (value) {
                              setState(_validateForm);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .please_enter_a_code_text;
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
                      onPressed: _validateForm()
                          ? () {
                              final userDataInfo = UserData(
                                  userEmailAddress: emailController.text,
                                  userPassword: passwordController.text,
                                  companyCode: companyController.text);
                              AutoRouter.of(context).push(
                                  UserInformationRoute(userData: userDataInfo));
                            }
                          : null,
                      text: AppLocalizations.of(context)!.signup_title,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StandardText.label(
                        context,
                        AppLocalizations.of(context)!.already_have_an_account,
                        fontSize: 14.flexibleFontSize,
                      ),
                      InkWell(
                        onTap: () {
                          AutoRouter.of(context).popAndPush(const LoginRoute());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: StandardText.bold(
                            AppLocalizations.of(context)!.login_title,
                            fontSize: 14.flexibleFontSize,
                            fontWeight: FontWeight.bold,
                            color: context.theme.corePalatte.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  90.verticalSpace
                ],
              ),
            ),
          ),
        ));
  }

  bool _validateForm() {
    return emailController.text.isNotEmpty &&
        Global.isValidEmail(emailController.text) &&
        passwordController.text.isNotEmpty &&
        passwordController.text.length >= 8 &&
        companyController.text.isNotEmpty;
  }
}
