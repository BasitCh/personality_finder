// ignore_for_file: prefer_const_constructors

// Dart imports:

// Package imports:

import 'dart:io';

import 'package:auto_route/auto_route.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
import 'package:morphosis_template/core/global/styles/theme_colors.dart';
import 'package:morphosis_template/core/global/typography/app_typography.dart';
import 'package:morphosis_template/core/global/util/app_constants.dart';
import 'package:morphosis_template/core/global/util/permission_checker/src/main.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/file_upload/file_manager.dart';
import 'package:morphosis_template/features/app/presentation/widgets/app_button_widget.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_text.dart';
import 'package:morphosis_template/features/app/presentation/widgets/standard_textfield.dart';
import 'package:morphosis_template/features/login/domain/repositories/auth_repo.dart';
import 'package:morphosis_template/features/register/data/model/user_data.dart';
import 'package:morphosis_template/features/register/presentation/bloc/register_bloc.dart';
import 'package:morphosis_template/features/register/presentation/pages/widgets/gender_item.dart';
import 'package:morphosis_template/features/upload/presentation/bloc/upload_document_bloc.dart';

class UserInformationScreen extends StatefulWidget {
  final UserData userData;

  const UserInformationScreen({
    required this.userData,
    Key? key,
  }) : super(key: key);

  @override
  _UserInformationScreenState createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedYear = '';
  int genderIndex = 0;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  File file = File('');
  late final RegisterBloc registerBloc;

  late String? signedUrl;

  @override
  void initState() {
    super.initState();
    signedUrl = null;
    registerBloc = getIt<RegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: registerBloc,
      listener: (context, state) {
        if (state is RegisterSuccess) {
          AutoRouter.of(context).popAndPush(const DashBoardRoute());
        }

        if (state is RegisterFailure) {
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
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColors.white,
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  AutoRouter.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 20,
                ),
              ),
              elevation: 0,
            ),
            body: BlocProvider(
              create: (context) => getIt<UploadDocumentBloc>(),
              child: BlocConsumer<UploadDocumentBloc, UploadDocumentState>(
                listener: (context, state) {
                  // TODO: implement listener

                  if (state is UploadDocumentSuccess) {
                    setState(() {
                      signedUrl = state.imageUrlFromServer;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        AppLocalizations.of(context)!.upload_image_success_text,
                        style:
                            TextStyle(color: context.theme.corePalatte.white),
                      ),
                    ));
                  } else if (state is UploadDocumentFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        state.exception.toString(),
                        style:
                            TextStyle(color: context.theme.corePalatte.white),
                      ),
                    ));
                  }
                },
                builder: (context, state) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.flexibleWidth, vertical: 10),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StandardText.header4(
                                  context,
                                  AppLocalizations.of(context)!
                                      .get_to_know_you_text,
                                  fontSize: 28.flexibleFontSize,
                                ),
                                24.verticalSpace,
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final permission =
                                              await PermissionChecker
                                                  .hasStoragePermission(
                                                      context);

                                          // ignore: unrelated_type_equality_checks
                                          if (permission) {
                                            file =
                                                await FileManager.pickImage();
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                    (timeStamp) {
                                              setState(() {});
                                            });

                                            if (file.path.isNotEmpty) {
                                              getIt<UploadDocumentBloc>().add(
                                                  GetSignedUrl(file: file));
                                            }
                                          }
                                        },
                                        child: file.path.isNotEmpty
                                            ?
                                            // state is UploadDocumentLoading
                                            //         ? Container(
                                            //             width: 88,
                                            //             height: 88,
                                            //             decoration: BoxDecoration(
                                            //                 color: context.theme
                                            //                     .corePalatte.gray05,
                                            //                 shape: BoxShape.circle),
                                            //             child: Center(
                                            //                 child:
                                            //                     CircularProgressIndicator
                                            //                         .adaptive()),
                                            //           )
                                            //         :
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(88),
                                                child: Image.file(
                                                  file,
                                                  fit: BoxFit.fitWidth,
                                                  width: 88,
                                                  height: 88,
                                                ),
                                              )
                                            : Container(
                                                width: 88,
                                                height: 88,
                                                decoration: BoxDecoration(
                                                    color: context.theme
                                                        .corePalatte.gray05,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  color: context
                                                      .theme.corePalatte.gray60,
                                                )),
                                              ),
                                      ),
                                      10.verticalSpace,
                                      StandardText.semiBold(
                                          AppLocalizations.of(context)!
                                              .up_load_your_profile_image_text),
                                    ],
                                  ),
                                ),
                                24.verticalSpace,
                                StandardText.semiBold(
                                  AppLocalizations.of(context)!
                                      .first_name_title,
                                ),
                                6.verticalSpace,
                                StandardTextField(
                                  key: const Key('first-name'),
                                  controller: firstNameController,
                                  hintText: AppLocalizations.of(context)!
                                      .first_name_title,
                                  keyboardType: TextInputType.text,
                                  autocorrect: false,
                                  textInputAction: TextInputAction.next,
                                  labelStyle: AppTypography.labelSemiBold
                                      .copyWith(fontSize: 14.flexibleFontSize),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  onChanged: (value) {
                                    setState(_validateForm);
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .please_enter_firstname_text;
                                    }
                                    return null;
                                  },
                                ),
                                16.verticalSpace,
                                StandardText.semiBold(
                                  AppLocalizations.of(context)!.lastname_title,
                                ),
                                6.verticalSpace,
                                StandardTextField(
                                  key: const Key('last-name'),
                                  controller: lastNameController,
                                  hintText: AppLocalizations.of(context)!
                                      .lastname_title,
                                  labelStyle: AppTypography.labelSemiBold
                                      .copyWith(fontSize: 14.flexibleFontSize),
                                  keyboardType: TextInputType.text,
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
                                          .please_enter_last_name_text;
                                    }
                                    return null;
                                  },
                                ),
                                16.verticalSpace,
                                StandardText.semiBold(
                                  AppLocalizations.of(context)!
                                      .year_of_birth_title,
                                ),
                                6.verticalSpace,
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: DropdownButtonFormField<String>(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor:
                                            context.theme.corePalatte.gray10,
                                      ),
                                      validator: (value) {
                                        final yearToday = DateTime.now().year;
                                        final lessThan18Year = yearToday - 18;

                                        if (value?.toString().isEmpty ?? true) {
                                          return AppLocalizations.of(context)!
                                              .please_select_year_of_birth_text;
                                        }

                                        if (int.parse(selectedYear) >
                                            lessThan18Year) {
                                          return AppLocalizations.of(context)!
                                              .cannot_be_less_than_18_years_text;
                                        }
                                        return null;
                                      },
                                      hint: Text(
                                        AppLocalizations.of(context)!
                                            .select_year_title,
                                        style: AppTypography.labelSemiBold
                                            .copyWith(
                                                fontSize: 12.flexibleFontSize),
                                      ),
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_sharp),
                                      isExpanded: true,
                                      isDense: true,
                                      value: selectedYear.isNotEmpty
                                          ? selectedYear
                                          : null,
                                      items: years.reversed.map((item) {
                                        return DropdownMenuItem<String>(
                                          value: item.toString(),
                                          child: Text(
                                            item.toString(),
                                            style: AppTypography.label.copyWith(
                                                color: context
                                                    .theme.corePalatte.black),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (selectedItem) => setState(
                                        () {
                                          selectedYear =
                                              selectedItem.toString();
                                          _validateForm();
                                        },
                                      ),
                                    )),
                                16.verticalSpace,
                                StandardText.semiBold(
                                  AppLocalizations.of(context)!.gender_text,
                                ),
                                10.verticalSpace,
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    itemCount: genders.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            genders.forEach((element) =>
                                                element.isSelected = false);
                                            genders[index].isSelected = true;
                                            genderIndex = index;
                                          });
                                        },
                                        child: GenderItem(
                                          genders[index],
                                          isEditProfile: true,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                16.verticalSpace,
                                BlocBuilder(
                                    bloc: getIt<UploadDocumentBloc>(),
                                    builder: (context, state) {
                                      return IgnorePointer(
                                        ignoring:
                                            state is UploadDocumentLoading ||
                                                state is CreatingUser,
                                        child: AppButton(
                                          isLoading: state is CreatingUser,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          onPressed: () async {
                                            _validateForm()
                                                ? registerBlocFunction()
                                                // ignore: unnecessary_statements
                                                : null;

                                            // if (_validateForm()) {
                                            //   if (Platform.isIOS) {
                                            //     final permissionStatus =
                                            //         await Permission
                                            //             .notification.status;

                                            //     if (permissionStatus !=
                                            //         PermissionStatus.granted) {
                                            //       await showNudgeDialog();
                                            //     } else {
                                            //       registerBlocFunction();
                                            //     }
                                            //   } else {
                                            //     return;
                                            //   }
                                            // }
                                          },

                                          //
                                          text: AppLocalizations.of(context)!
                                              .confirm_title,
                                        ),
                                      );
                                    }),
                                16.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        StandardText.label(
                                          context,
                                          AppLocalizations.of(context)!
                                              .by_continuing_you_agree_to_our_text,
                                          fontSize: 14.flexibleFontSize,
                                          align: TextAlign.center,
                                        ),
                                        3.verticalSpace,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                context.router
                                                    .push(WebViewRoute(
                                                  webviewUrl:
                                                      'https://www.8w8re.com/privacy-policy.html',
                                                  title: AppLocalizations.of(
                                                          context)!
                                                      .privacy_policy_text,
                                                ));
                                              },
                                              child: StandardText.semiBold(
                                                AppLocalizations.of(context)!
                                                    .privacy_policy_text,
                                                fontSize: 14.flexibleFontSize,
                                                color: context.theme.corePalatte
                                                    .primaryColor,
                                              ),
                                            ),
                                            StandardText.label(
                                              context,
                                              ' ${AppLocalizations.of(context)!.and_text} ',
                                              fontSize: 14.flexibleFontSize,
                                              align: TextAlign.center,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                context.router
                                                    .push(WebViewRoute(
                                                  webviewUrl:
                                                      'https://www.8w8re.com/terms-and-conditions.html',
                                                  title: AppLocalizations.of(
                                                          context)!
                                                      .trems_of_service_text,
                                                ));
                                              },
                                              child: StandardText.semiBold(
                                                AppLocalizations.of(context)!
                                                    .trems_of_service_text,
                                                fontSize: 14.flexibleFontSize,
                                                color: context.theme.corePalatte
                                                    .primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            )),
                      ),
                    ),
                  );
                },
              ),
            ));
      },
    );
  }

  void registerBlocFunction() {
    return registerBloc.add(PerformRegister(
        authType: AuthType.email,
        email: '${widget.userData.userEmailAddress!.trim()}',
        password: '${widget.userData.userPassword}',
        companyCode: '${widget.userData.companyCode!.trim()}',
        firstName: '${firstNameController.text.trim()}',
        lastName: '${lastNameController.text.trim()}',
        yearOfBirth: int.parse(selectedYear),
        image: signedUrl != null && signedUrl!.isNotEmpty ? signedUrl : null,
        gender: genderIndex == 0
            ? Gender.male
            : genderIndex == 1
                ? Gender.female
                : Gender.other));
  }

  bool _validateForm() {
    final yearToday = DateTime.now().year;
    final lessThan18Year = yearToday - 18;

    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        lessThan18Year >=
            (selectedYear.isNotEmpty ? int.parse(selectedYear) : 0) &&
        selectedYear.isNotEmpty;
  }

  // Future<void> showNudgeDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(20))),
  //         content: SingleChildScrollView(
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //             ),
  //             child: ListBody(
  //               children: <Widget>[
  //                 SvgPicture.asset('assets/images/icons/nudge.svg'),
  //                 24.verticalSpace,
  //                 StandardText.header1(
  //                   context,
  //                   'Allow Aware to send you daily nudge?',
  //                   fontSize: 24.flexibleFontSize,
  //                 ),
  //                 24.verticalSpace,
  //                 Row(
  //                   children: [
  //                     Icon(
  //                       Icons.notifications_active_outlined,
  //                     ),
  //                     12.horizontalSpace,
  //                     StandardText.label(
  //                       context,
  //                       'Received daily motivation',
  //                       fontSize: 16.flexibleFontSize,
  //                     ),
  //                   ],
  //                 ),
  //                 12.verticalSpace,
  //                 Row(
  //                   children: [
  //                     Icon(
  //                       Icons.file_copy_outlined,
  //                     ),
  //                     12.horizontalSpace,
  //                     StandardText.bodyMedium(
  //                       context,
  //                       'Personalized lifestyle articles',
  //                       fontSize: 16.flexibleFontSize,
  //                     ),
  //                   ],
  //                 ),
  //                 50.verticalSpace,
  //                 AppButton(
  //                   text: 'Allow',
  //                   color: context.theme.corePalatte.primaryColor,
  //                   onPressed: () async {
  //                     try {
  //                       await getIt<PushNotifications>()
  //                           .requestNotificationPermission(
  //                         isEnabled: true,
  //                       )
  //                           .whenComplete(() async {
  //                         await AutoRouter.of(context).pop();
  //                         registerBlocFunction();
  //                       });

  //                       // ignore: avoid_catching_errors
  //                     } on Error catch (_) {
  //                       final status = await Permission.notification.status;

  //                       if (status.isGranted) {
  //                         await AutoRouter.of(context).pop();
  //                       }

  //                       registerBlocFunction();
  //                     }
  //                   },
  //                 ),
  //                 16.verticalSpace,
  //                 AppButton(
  //                   text: 'Deny',
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   color: context.theme.corePalatte.white,
  //                   textColor: context.theme.corePalatte.primaryColor,
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
