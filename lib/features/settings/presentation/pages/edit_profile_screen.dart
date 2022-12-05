// Flutter imports:
// Package imports:
// ignore_for_file: unawaited_futures

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morphosis_template/core/global/navigator/app_router.gr.dart';
import 'package:morphosis_template/core/global/util/permission_checker/permission_checker.dart';
import 'package:morphosis_template/features/app/file_upload/file_manager.dart';
import 'package:morphosis_template/features/upload/presentation/bloc/upload_document_bloc.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../../core/global/typography/app_typography.dart';
import '../../../../core/global/util/app_constants.dart';
import '../../../../di/injectable.dart';
import '../../../app/presentation/widgets/app_button_widget.dart';
import '../../../app/presentation/widgets/shimmer_widget.dart';
import '../../../app/presentation/widgets/standard_text.dart';
import '../../../app/presentation/widgets/standard_textfield.dart';
import '../../../login/domain/entities/profile.dart';
import '../../../register/presentation/pages/widgets/gender_item.dart';
import '../bloc/profile/profile_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  final Profile profile;

  const EditProfileScreen({required this.profile});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String selectedYear = '';
  int genderIndex = 0;
  bool isValidForm = false;
  bool imageSelected = false;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  late final ProfileBloc profileBloc;
  File file = File('');

  late String? signedUrl;
  late final UploadDocumentBloc uploadDocumentBloc;

  @override
  void initState() {
    super.initState();
    profileBloc = getIt<ProfileBloc>();
    uploadDocumentBloc = UploadDocumentBloc();
    signedUrl = null;
    firstNameController.text = widget.profile.firstName ?? '';
    lastNameController.text = widget.profile.lastName ?? '';
    selectedYear = widget.profile.yearOfBirth.toString();
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
              context, AppLocalizations.of(context)!.edit_profile_text),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<ProfileBloc>()),
          ],
          child: BlocListener<UploadDocumentBloc, UploadDocumentState>(
            bloc: uploadDocumentBloc,
            listener: (context, state) {
              // TODO: implement listener

              if (state is UploadDocumentSuccess) {
                setState(() {
                  signedUrl = state.imageUrlFromServer;
                  widget.profile.imageUrl = signedUrl;
                });
              }
            },
            child: BlocConsumer(
                bloc: getIt<ProfileBloc>(),
                listener: (context, state) async {
                  if (state is ProfileUpdated) {
                    AutoRouter.of(context).pushAndPopUntil(
                      const HomeRoute(),
                      predicate: (route) => false,
                    );
                  } else if (state is ErrorUpdatingProfile) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        state.error,
                        style:
                            TextStyle(color: context.theme.corePalatte.white),
                      ),
                    ));
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              5.verticalSpace,
                              Center(
                                  child: Stack(
                                children: [
                                  file.path.isNotEmpty
                                      ? state is UploadDocumentLoading ||
                                              state is ProfileLoading
                                          ? Container(
                                              width: 88,
                                              height: 88,
                                              decoration: BoxDecoration(
                                                  color: context
                                                      .theme.corePalatte.gray05,
                                                  shape: BoxShape.circle),
                                              child: const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(88),
                                              child: Image.file(
                                                file,
                                                fit: BoxFit.cover,
                                                width: 75.flexibleWidth,
                                                height: 75.flexibleHeight,
                                              ),
                                            )
                                      : ClipOval(
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(38),
                                            child: widget.profile.imageUrl ==
                                                        null ||
                                                    widget.profile.imageUrl!
                                                        .isEmpty
                                                ? Container(
                                                    width: 38,
                                                    height: 38,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: context.theme
                                                          .corePalatte.gray10,
                                                    ),
                                                    child:
                                                        const Icon(Icons.error),
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl: widget
                                                        .profile.imageUrl!,
                                                    fit: BoxFit.cover,
                                                    placeholder:
                                                        (context, url) =>
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
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: InkWell(
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
                                              uploadDocumentBloc.add(
                                                  GetSignedUrl(file: file));
                                            }
                                          }
                                        },
                                        child: Container(
                                          height: 38,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(100),
                                              bottomRight: Radius.circular(100),
                                            ),
                                          ),
                                          child: Center(
                                            child: StandardText.label(
                                              context,
                                              AppLocalizations.of(context)!
                                                  .edit_text,
                                              color: context
                                                  .theme.corePalatte.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              )),
                              10.verticalSpace,
                              StandardText.semiBold(
                                'First name',
                              ),
                              5.verticalSpace,
                              StandardTextField(
                                controller: firstNameController,
                                key: const Key('first-name'),
                                hintText: AppLocalizations.of(context)!
                                    .first_name_title,
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
                                        .please_enter_firstname_text;
                                  }
                                  return null;
                                },
                              ),
                              15.verticalSpace,
                              StandardText.semiBold(
                                AppLocalizations.of(context)!.lastname_title,
                              ),
                              5.verticalSpace,
                              StandardTextField(
                                controller: lastNameController,
                                key: const Key('last-name'),
                                hintText: AppLocalizations.of(context)!
                                    .lastname_title,
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
                              15.verticalSpace,
                              StandardText.semiBold(
                                AppLocalizations.of(context)!
                                    .year_of_birth_title,
                              ),
                              5.verticalSpace,
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
                                    hint: Text(
                                        '${AppLocalizations.of(context)!.select_year_title} ${widget.profile.yearOfBirth}',
                                        style: AppTypography.label),
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_sharp),
                                    isExpanded: true,
                                    isDense: true,
                                    value: '${widget.profile.yearOfBirth}',
                                    items: years.map((item) {
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
                                    onChanged: (selectedItem) => setState(
                                      () {
                                        selectedYear = selectedItem.toString();
                                        _validateForm();
                                      },
                                    ),
                                  )),
                              15.verticalSpace,
                              StandardText.semiBold(
                                  AppLocalizations.of(context)!.gender_text),
                              5.verticalSpace,
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
                              const Spacer(),
                              BlocBuilder(
                                  bloc: uploadDocumentBloc,
                                  builder: (context, state) {
                                    return IgnorePointer(
                                      ignoring: state is UpdatingProfile,
                                      child: AppButton(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        isLoading: state is UpdatingProfile ||
                                            state is UploadDocumentLoading,
                                        onPressed: _validateForm()
                                            ? () {
                                                profileBloc.add(UpdateProfile(
                                                    profile: Profile(
                                                  id: widget.profile.id,
                                                  takenQuiz:
                                                      widget.profile.takenQuiz,
                                                  firstName:
                                                      firstNameController.text,
                                                  lastName:
                                                      lastNameController.text,
                                                  imageUrl: signedUrl != null &&
                                                          signedUrl!.isNotEmpty
                                                      ? signedUrl
                                                      : null,
                                                  gender: genderIndex == 0
                                                      ? Gender.male
                                                      : genderIndex == 1
                                                          ? Gender.female
                                                          : Gender.other,
                                                  yearOfBirth: selectedYear
                                                          .isNotEmpty
                                                      ? int.parse(selectedYear)
                                                      : null,
                                                )));
                                              }
                                            : null,
                                        text: AppLocalizations.of(context)!
                                            .save_change_text,
                                      ),
                                    );
                                  }),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StandardText.label(
                                        context,
                                        AppLocalizations.of(context)!
                                            .by_continuing_you_agree_to_our_text,
                                        fontSize: 12,
                                        align: TextAlign.center,
                                      ),
                                      3.verticalSpace,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              context.router.push(WebViewRoute(
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
                                              fontSize: 12,
                                              color: context.theme.corePalatte
                                                  .primaryColor,
                                            ),
                                          ),
                                          StandardText.label(
                                            context,
                                            ' ${AppLocalizations.of(context)!.and_text} ',
                                            fontSize: 12,
                                            align: TextAlign.center,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context.router.push(WebViewRoute(
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
                                              fontSize: 12,
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
                              const Spacer(),
                            ]),
                      ),
                    ),
                  );
                }),
          ),
        ));
  }

  bool _validateForm() {
    final yearToday = DateTime.now().year;
    final lessThan18Year = yearToday - 18;

    if (widget.profile.yearOfBirth != null) {
      return firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          lessThan18Year >=
              (selectedYear.isNotEmpty ? int.parse(selectedYear) : 0) &&
          selectedYear.isNotEmpty;
    } else {
      return firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty;
    }
  }
}
