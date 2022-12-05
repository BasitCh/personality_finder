// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/languages/entities/language.dart';
import 'package:morphosis_template/core/global/languages/language_bloc.dart';
import 'package:morphosis_template/di/injectable.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../core/global/util/app_constants.dart';
import '../widgets/app_button_widget.dart';
import '../widgets/standard_text.dart';

class LocaleScreen extends StatefulWidget {
  @override
  _LocaleScreenState createState() => _LocaleScreenState();
}

class _LocaleScreenState extends State<LocaleScreen> {
  var _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.corePalatte.white,
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              30.verticalSpace,
              Center(
                child: SvgPicture.asset('assets/images/icons/app_logo.svg'),
              ),
              const Spacer(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                child: StandardText.bodyMediumBold(
                  context,
                  'Choose your preferred language',
                  color: context.theme.corePalatte.darkGrey,
                  align: TextAlign.left,
                  maxLines: 2,
                  fontSize: 24,
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          getIt<LanguageBloc>().add(
                              ToggleLanguageEvent(Languages.languages[index]));
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: index == _selectedIndex
                                  ? [
                                      const BoxShadow(
                                        color: Color.fromRGBO(16, 18, 35, 0.08),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                      ),
                                    ]
                                  : [],
                              border: Border.all(
                                  width: 1,
                                  color: index == _selectedIndex
                                      ? context.theme.corePalatte.tertiaryGreen
                                      : context.theme.corePalatte.gray20)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.flexibleWidth,
                              vertical: 16.flexibleHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StandardText.label(
                                context,
                                languages[index],
                                align: TextAlign.left,
                                fontSize: 16.flexibleFontSize,
                              ),
                              SvgPicture.asset(
                                index == _selectedIndex
                                    ? 'assets/images/icons/selected.svg'
                                    : 'assets/images/icons/uncheck_radio.svg',
                                width: 20.flexibleWidth,
                                height: 20.flexibleHeight,
                              )
                            ],
                          ),
                        ));
                  },
                  itemCount: languages.length),
              16.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: AppButton(
                  width: MediaQuery.of(context).size.width,
                  onPressed: _selectedIndex == -1
                      ? null
                      : () {
                          AutoRouter.of(context).push(const OnBoardingRoute());
                        },
                  text: AppLocalizations.of(context)!.continue_text,
                ),
              ),
              30.verticalSpace,
            ],
          ),
        )));
  }
}
