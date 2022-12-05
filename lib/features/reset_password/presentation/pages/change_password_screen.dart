// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

class ChangePasswordScreen extends StatefulWidget {
  final String resetCode;

  const ChangePasswordScreen({
    required this.resetCode,
    Key? key,
  }) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordControler =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.corePalatte.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
            bloc: getIt<ResetPasswordBloc>(),
            listener: (context, state) {
              // TODO: implement listener

              if (state is ResetPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(AppLocalizations.of(context)!
                      .change_password_successfully_text),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 2),
                ));

                Future.delayed(const Duration(seconds: 2), () {
                  AutoRouter.of(context).push(const LoginRoute());
                });
              }

              if (state is ResetPasswordFailure) {
                //show a snackbar with error

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.failure),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    30.verticalSpace,
                    Center(
                      child:
                          SvgPicture.asset('assets/images/icons/app_logo.svg'),
                    ),
                    const Spacer(),
                    StandardText.bodyMediumBold(
                      context,
                      AppLocalizations.of(context)!.reset_password_text,
                      fontSize: 20,
                      align: TextAlign.start,
                    ),
                    20.verticalSpace,
                    StandardTextField(
                      key: const Key('change-password'),
                      controller: passwordController,
                      hintText: AppLocalizations.of(context)!.new_password_text,
                      obscureText: false,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .please_enter_a_password_text;
                        }
                        return null;
                      },
                    ),
                    20.verticalSpace,
                    StandardTextField(
                      key: const Key('change-password-confirm-password'),
                      controller: confirmPasswordControler,
                      hintText:
                          AppLocalizations.of(context)!.confirm_password_text,
                      obscureText: false,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppLocalizations.of(context)!
                              .please_enter_a_password_text;
                        }
                        return null;
                      },
                    ),
                    20.verticalSpace,
                    AppButton(
                      isLoading: state is ResetPasswordLoading,
                      width: MediaQuery.of(context).size.width,
                      onPressed: () {
                        getIt<ResetPasswordBloc>().add(
                          ResetPassword(
                            authType: AuthType.email,
                            password: passwordController.text,
                            token: widget.resetCode,
                          ),
                        );
                      },
                      text: AppLocalizations.of(context)!.save_change_text,
                    ),
                    20.verticalSpace,
                    const SizedBox(height: 50),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
