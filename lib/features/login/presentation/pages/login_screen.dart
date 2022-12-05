// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/typography/app_typography.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../../core/global/global.dart';
import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../core/global/styles/theme_colors.dart';
import '../../../../di/injectable.dart';
import '../../../app/presentation/widgets/app_button_widget.dart';
import '../../../app/presentation/widgets/standard_text.dart';
import '../../../app/presentation/widgets/standard_textfield.dart';
import '../../domain/repositories/auth_repo.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;

  bool showPassword = false;

  @override
  void initState() {
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: getIt<LoginBloc>(),
      listener: (context, state) {
        if (state is LoginSuccess) {
          AutoRouter.of(context).pushAndPopUntil(const DashBoardRoute(),
              predicate: (route) {
                return route.settings.name == HomeRoute.name;
              },
              onFailure: (onFaolure) => {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(AppLocalizations.of(context)!
                          .navigation_failed_title),
                      backgroundColor: context.theme.corePalatte.errorColor,
                    ))
                  });
        } else if (state is LoginFailure) {
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
                      35.verticalSpace,
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
                            StandardText.header4(
                              context,
                              AppLocalizations.of(context)!.login_title,
                            ),
                            30.verticalSpace,
                            StandardText.semiBold(
                              AppLocalizations.of(context)!.email_title,
                              fontSize: 14.flexibleFontSize,
                            ),
                            6.verticalSpace,
                            StandardTextField(
                              key: const Key('login-email'),
                              controller: emailController,
                              hintText:
                                  AppLocalizations.of(context)!.email_title,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              labelStyle: AppTypography.labelSemiBold
                                  .copyWith(fontSize: 14.flexibleFontSize),
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
                              key: const Key('login-password'),
                              controller: passwordController,
                              hintText:
                                  AppLocalizations.of(context)!.password_title,
                              obscureText: !showPassword,
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
                              autocorrect: false,
                              labelStyle: AppTypography.labelSemiBold
                                  .copyWith(fontSize: 14.flexibleFontSize),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              textInputAction: TextInputAction.done,
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
                            InkWell(
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const ResetPasswordRoute());
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: StandardText.semiBold(
                                  AppLocalizations.of(context)!
                                      .forgot_password_text,
                                  color: context.theme.corePalatte.primaryColor,
                                  fontSize: 14.flexibleFontSize,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      24.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AppButton(
                          width: MediaQuery.of(context).size.width,
                          isLoading: state is LoggingIn,
                          onPressed: _validateForm()
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    getIt<LoginBloc>().add(PerformLogIn(
                                        authType: AuthType.email,
                                        email: emailController.text,
                                        password: passwordController.text));
                                  }
                                }
                              : null,
                          text: AppLocalizations.of(context)!.login_title,
                        ),
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StandardText.label(
                            context,
                            AppLocalizations.of(context)!
                                .do_not_have_account_text,
                            fontSize: 14.flexibleFontSize,
                          ),
                          InkWell(
                            onTap: () {
                              AutoRouter.of(context).pushAndPopUntil(
                                const SignUpRoute(),
                                predicate: (route) {
                                  return route.settings.name ==
                                      OnBoardingRoute.name;
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: StandardText.semiBold(
                                AppLocalizations.of(context)!.signup_title,
                                fontSize: 14.flexibleFontSize,
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
      },
    );
  }

  bool _validateForm() {
    return emailController.text.isNotEmpty &&
        Global.isValidEmail(emailController.text) &&
        passwordController.text.isNotEmpty &&
        passwordController.text.length >= 8;
  }
}
