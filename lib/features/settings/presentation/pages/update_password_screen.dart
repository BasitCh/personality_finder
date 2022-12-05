// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../di/injectable.dart';
import '../../../app/presentation/widgets/app_button_widget.dart';
import '../../../app/presentation/widgets/standard_text.dart';
import '../../../app/presentation/widgets/standard_textfield.dart';
import '../../../reset_password/presentation/bloc/reset_password_bloc.dart';

class UpdatePasswordScreen extends StatefulWidget {
  @override
  _UpdatePasswordScreenState createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  late final ResetPasswordBloc resetPasswordBloc;

  @override
  void initState() {
    super.initState();
    resetPasswordBloc = getIt<ResetPasswordBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.corePalatte.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => AutoRouter.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios_sharp,
              size: 20,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          title: StandardText.header5(
              context, AppLocalizations.of(context)!.password_title),
        ),
        body: BlocConsumer(
            bloc: resetPasswordBloc,
            listener: (context, state) {
              if (state is FailedUpdatingPassword) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.error,
                    style: TextStyle(color: context.theme.corePalatte.white),
                  ),
                ));
              } else if (state is PasswordUpdated) {
                AutoRouter.of(context).pushAndPopUntil(
                  const LoginRoute(),
                  predicate: (route) {
                    return route.settings.name == LoginRoute.name;
                  },
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        StandardText.semiBold(
                          AppLocalizations.of(context)!.current_password_text,
                          fontSize: 12,
                        ),
                        5.verticalSpace,
                        StandardTextField(
                          controller: currentPassController,
                          hintText: AppLocalizations.of(context)!
                              .current_password_text,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {
                            setState(_validateForm);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .password_title;
                            } else if (value.length < 8) {
                              return AppLocalizations.of(context)!
                                  .please_enter_current_password_text;
                            }
                            return null;
                          },
                        ),
                        15.verticalSpace,
                        StandardText.semiBold(
                          AppLocalizations.of(context)!.new_password_text,
                          fontSize: 12,
                        ),
                        5.verticalSpace,
                        StandardTextField(
                          controller: newPassController,
                          hintText:
                              AppLocalizations.of(context)!.new_password_text,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          obscureText: true,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {
                            setState(_validateForm);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .please_enter_new_password_text;
                            } else if (value.length < 8) {
                              return AppLocalizations.of(context)!
                                  .new_password_maust_mattch_8_characters_text;
                            }
                            return null;
                          },
                        ),
                        15.verticalSpace,
                        StandardText.semiBold(
                          AppLocalizations.of(context)!
                              .confirm_new_password_text,
                          fontSize: 12,
                        ),
                        5.verticalSpace,
                        StandardTextField(
                          controller: confirmPassController,
                          hintText: AppLocalizations.of(context)!
                              .confirm_new_password_text,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {
                            setState(_validateForm);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .please_enter_confrim_password_text;
                            } else if (value.length < 8) {
                              return AppLocalizations.of(context)!
                                  .confirm_password_must_match_of_8_characters_text;
                            } else if (newPassController.text.toLowerCase() !=
                                value.toLowerCase()) {
                              return AppLocalizations.of(context)!
                                  .password_and_confirm_password_dose_not_match;
                            }
                            return null;
                          },
                        ),
                        const Spacer(),
                        IgnorePointer(
                          ignoring: state is UpdatingPassword,
                          child: AppButton(
                            isLoading: state is UpdatingPassword,
                            width: MediaQuery.of(context).size.width,
                            onPressed: _validateForm()
                                ? () {
                                    resetPasswordBloc.add(UpdatePassword(
                                        oldPassword: currentPassController.text,
                                        newPassword: newPassController.text));
                                  }
                                : null,
                            text: AppLocalizations.of(context)!
                                .update_password_text,
                          ),
                        ),
                        50.verticalSpace
                      ]),
                ),
              );
            }));
  }

  bool _validateForm() {
    return currentPassController.text.isNotEmpty &&
        currentPassController.text.length >= 8 &&
        newPassController.text.isNotEmpty &&
        newPassController.text.length >= 8 &&
        confirmPassController.text.isNotEmpty &&
        confirmPassController.text.length >= 8 &&
        newPassController.text.toLowerCase() ==
            confirmPassController.text.toLowerCase();
  }
}
