// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morphosis_template/core/global/util/notifications/push_notifications.dart';
import 'package:morphosis_template/features/login/domain/entities/profile.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../../core/global/extensions/string_extensions.dart';
import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../di/injectable.dart';
import '../../../app/presentation/widgets/app_button_widget.dart';
import '../../../app/presentation/widgets/app_divider_widget.dart';
import '../../../app/presentation/widgets/shimmer_widget.dart';
import '../../../app/presentation/widgets/standard_text.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/settings/settings_bloc.dart';
import 'widgets/delete_account_dialog.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final ProfileBloc profileBloc;

  @override
  void initState() {
    super.initState();
    profileBloc = getIt<ProfileBloc>();
    getIt<SettingsBloc>().add(FetchUserProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.corePalatte.white,
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
              context, AppLocalizations.of(context)!.settings_title),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener(
                bloc: profileBloc,
                listener: (context, state) {
                  if (state is FailedDeletingAccount) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        state.error,
                        style:
                            TextStyle(color: context.theme.corePalatte.white),
                      ),
                    ));
                  } else if (state is AccountDeleted) {
                    AutoRouter.of(context).pushAndPopUntil(
                      const OnBoardingRoute(),
                      predicate: (route) => false,
                    );
                  }
                }),
            BlocListener(
                bloc: getIt<LoginBloc>(),
                listener: (context, state) {
                  if (state is LoginChecked) {
                    AutoRouter.of(context).pushAndPopUntil(
                      const OnBoardingRoute(),
                      predicate: (route) => false,
                    );
                  }
                })
          ],
          child: BlocConsumer<SettingsBloc, SettingsState>(
              listener: (context, state) {
            if (state is ErrorLoadingProfile) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.error,
                  style: TextStyle(color: context.theme.corePalatte.white),
                ),
              ));
            }
          }, builder: (context, state) {
            return (state is LoadingProfile)
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : (state is GotToHome)
                    ? SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.verticalSpace,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipOval(
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(38),
                                        child: state.userDetails.profile !=
                                                    null &&
                                                state.userDetails.profile!
                                                        .imageUrl ==
                                                    null
                                            ? Image.asset(
                                                'assets/images/icons/avatar.png')
                                            : CachedNetworkImage(
                                                imageUrl: state.userDetails
                                                    .profile!.imageUrl!,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    ShimmerContainer(
                                                  height: 30.flexibleHeight,
                                                  width: 30.flexibleWidth,
                                                  type: ShimmerType.square,
                                                ),
                                                errorWidget: (context, url,
                                                        dynamic error) =>
                                                    ShimmerContainer(
                                                  height: 30.flexibleHeight,
                                                  width: 30.flexibleWidth,
                                                  type: ShimmerType.square,
                                                ),
                                              ),
                                      ),
                                    ),
                                    15.horizontalSpace,
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        //used for aligning the children vertically
                                        children: [
                                          StandardText.labelSemiBold(
                                            context,
                                            '${'${state.userDetails.profile?.firstName!.toCapitalized()} ${state.userDetails.profile?.lastName!.toCapitalized()}'}',
                                            maxLines: 1,
                                            align: TextAlign.left,
                                            overflow: TextOverflow.visible,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              AutoRouter.of(context).push(
                                                  EditProfileRoute(
                                                      profile: state.userDetails
                                                          .profile!));
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: StandardText.labelSemiBold(
                                                context,
                                                AppLocalizations.of(context)!
                                                    .edit_profile_text,
                                                color: context.theme.corePalatte
                                                    .primaryColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                20.verticalSpace,
                                StandardText.label(
                                  context,
                                  AppLocalizations.of(context)!
                                      .email_address_text,
                                  color: context.theme.corePalatte.gray50,
                                  fontSize: 14,
                                ),
                                5.verticalSpace,
                                StandardText.labelSemiBold(
                                  context,
                                  state.userDetails.email ?? '',
                                ),
                                15.verticalSpace,
                                const AppDivider(),
                                15.verticalSpace,
                                StandardText.label(
                                  context,
                                  AppLocalizations.of(context)!
                                      .company_name_text,
                                  color: context.theme.corePalatte.gray50,
                                  fontSize: 14,
                                ),
                                5.verticalSpace,
                                StandardText.labelSemiBold(
                                  context,
                                  state.userDetails.company?.name ?? '',
                                ),
                                15.verticalSpace,
                                const AppDivider(),
                                15.verticalSpace,
                                StandardText.label(
                                  context,
                                  AppLocalizations.of(context)!
                                      .company_code_title,
                                  color: context.theme.corePalatte.gray50,
                                  fontSize: 14,
                                ),
                                5.verticalSpace,
                                StandardText.labelSemiBold(
                                  context,
                                  state.userDetails.company?.companyCode ?? '',
                                ),
                                15.verticalSpace,
                                const AppDivider(),
                                15.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StandardText.label(
                                      context,
                                      AppLocalizations.of(context)!
                                          .password_title,
                                      color: context.theme.corePalatte.gray50,
                                      fontSize: 14,
                                    ),
                                    InkWell(
                                      onTap: () => AutoRouter.of(context)
                                          .push(const UpdatePasswordRoute()),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: StandardText.labelSemiBold(
                                          context,
                                          AppLocalizations.of(context)!
                                              .change_text,
                                          fontSize: 12,
                                          color: context
                                              .theme.corePalatte.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                5.verticalSpace,
                                StandardText.labelSemiBold(
                                  context,
                                  '************',
                                ),
                                15.verticalSpace,
                                const AppDivider(),
                                15.verticalSpace,
                                StandardText.label(
                                  context,
                                  AppLocalizations.of(context)!.language_text,
                                  color: context.theme.corePalatte.gray50,
                                ),
                                5.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StandardText.labelSemiBold(
                                      context,
                                      state.userDetails.profile?.locale == 'en'
                                          ? 'English'
                                          : state.userDetails.profile?.locale ==
                                                  'fr'
                                              ? 'French'
                                              : 'Spanish',
                                    ),
                                    InkWell(
                                      onTap: () {
                                        AutoRouter.of(context)
                                            .push(const LanguageRoute());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: StandardText.labelSemiBold(
                                          context,
                                          AppLocalizations.of(context)!
                                              .change_text,
                                          fontSize: 12,
                                          color: context
                                              .theme.corePalatte.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                15.verticalSpace,
                                const AppDivider(),
                                15.verticalSpace,
                                StandardText.label(
                                  context,
                                  AppLocalizations.of(context)!
                                      .enable_push_notification_text,
                                  color: context.theme.corePalatte.gray50,
                                  fontSize: 14,
                                ),
                                5.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    StandardText.labelSemiBold(
                                      context,
                                      AppLocalizations.of(context)!.enable_text,
                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 30,
                                      child: CupertinoSwitch(
                                        value: state.userDetails.profile!
                                            .notificationEnabled!,
                                        onChanged: (value) async {
                                          setState(() {
                                            state.userDetails.profile
                                                ?.notificationEnabled = value;
                                          });

                                          profileBloc.add(UpdateProfile(
                                              profile: Profile(
                                                  id: state
                                                      .userDetails.profile!.id,
                                                  takenQuiz: state.userDetails
                                                      .profile!.takenQuiz,
                                                  firstName: state.userDetails
                                                      .profile!.firstName,
                                                  lastName: state.userDetails
                                                      .profile!.lastName,
                                                  yearOfBirth: state.userDetails
                                                      .profile!.yearOfBirth,
                                                  gender: state.userDetails
                                                      .profile!.gender,
                                                  imageUrl: state.userDetails
                                                      .profile!.imageUrl,
                                                  locale: state.userDetails
                                                      .profile!.locale,
                                                  notificationEnabled: value)));

                                          await getIt<PushNotifications>()
                                              .notificationSettings(
                                                  notificationStatus: value);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                30.verticalSpace,
                                BlocBuilder(
                                    bloc: profileBloc,
                                    builder: (context, state) {
                                      return state is DeletingAccount
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator
                                                  .adaptive())
                                          : InkWell(
                                              onTap: () {
                                                showDialog<dynamic>(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) =>
                                                      DeleteAccountDialog(
                                                    onCancel: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    onDelete: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      profileBloc
                                                          .add(DeleteAccount());
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child:
                                                    StandardText.labelSemiBold(
                                                  context,
                                                  AppLocalizations.of(context)!
                                                      .delete_account_text,
                                                  color: context.theme
                                                      .corePalatte.errorColor,
                                                ),
                                              ),
                                            );
                                    }),
                                30.verticalSpace,
                                BlocBuilder(
                                    bloc: getIt<LoginBloc>(),
                                    builder: (context, state) {
                                      return IgnorePointer(
                                        ignoring: state is LoggingOut,
                                        child: AppButton(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          isLoading: state is LoggingOut,
                                          onPressed: () {
                                            getIt<LoginBloc>()
                                                .add(const LogOut());
                                          },
                                          text: AppLocalizations.of(context)!
                                              .logout_text,
                                        ),
                                      );
                                    }),
                                const SizedBox(height: 50),
                              ]),
                        ),
                      )
                    : (state is ErrorLoadingProfile)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                StandardText.error('${state.error}'),
                                5.verticalSpace,
                                BlocBuilder(
                                    bloc: getIt<LoginBloc>(),
                                    builder: (context, state) {
                                      return IgnorePointer(
                                        ignoring: state is LoggingOut,
                                        child: AppButton(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          isLoading: state is LoggingOut,
                                          onPressed: () {
                                            getIt<LoginBloc>()
                                                .add(const LogOut());
                                          },
                                          text: AppLocalizations.of(context)!
                                              .logout_text,
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          )
                        : const SizedBox.shrink();
          }),
        ));
  }
}
