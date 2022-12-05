// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/repository/secure_storage/auth/auth_storage_impl.dart';
import 'package:morphosis_template/di/injectable.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';

import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../core/global/styles/theme_colors.dart';
import '../widgets/app_button_widget.dart';
import '../widgets/standard_text.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late final PageController controller;
  final onBoardingSuggestions = [
    OnBoarding(
        image: 'assets/images/icons/onboarding1.svg',
        title: 'From awareness to action',
        desc: 'Know yourself, understand others and work better together'),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
    clearDatabase();
    dynamicLinks();
  }

  Future<void> dynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      debugPrint(dynamicLinkData.link.toString());

      // https://eightweightre.page.link/resetpassword?token=gxKJx9r34WRnQa35edMr

      if (dynamicLinkData.link.path == '/resetpassword') {
        final token = dynamicLinkData.link.queryParameters['token'];

        debugPrint(token);

        AutoRouter.of(context).push(ChangePasswordRoute(resetCode: '$token'));
      }
      // ignore: avoid_types_on_closure_parameters
    }).onError((Object e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  Future<void> clearDatabase() async {
    try {
      final _authStorage = getIt<AuthStoring>();

      final accesstoken = await _authStorage.getAccessToken();
      debugPrint('access token : $accesstoken');

      await _authStorage.clear();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                90.verticalSpace,
                Center(
                  child: SvgPicture.asset('assets/images/icons/app_logo.svg'),
                ),
                Expanded(
                  child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      itemCount: onBoardingSuggestions.length,
                      itemBuilder: (context, index) {
                        // contents of slider
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // image given in slider
                                SvgPicture.asset(
                                  '${onBoardingSuggestions[index].image}',
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                ),
                                24.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  child: StandardText.header4(
                                    context,
                                    onBoardingSuggestions[index].title,
                                    align: TextAlign.center,
                                    fontSize: 24.flexibleFontSize,
                                  ),
                                ),
                                16.verticalSpace,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  child: StandardText.label(
                                    context,
                                    onBoardingSuggestions[index].desc,
                                    color: context.theme.corePalatte.gray60,
                                    align: TextAlign.center,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ));
                      }),
                ),
                30.verticalSpace,
                Container(
                  transform: Matrix4.translationValues(0, -30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBoardingSuggestions.length,
                      buildDot,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AppButton(
                          textSize: 16.flexibleFontSize,
                          onPressed: () =>
                              AutoRouter.of(context).push(const LoginRoute()),
                          text: AppLocalizations.of(context)!.login_title,
                        ),
                      ),
                      16.horizontalSpace,
                      Flexible(
                        child: AppButton(
                          textSize: 16.flexibleFontSize,
                          onPressed: () =>
                              AutoRouter.of(context).push(const SignUpRoute()),
                          text: AppLocalizations.of(context)!.signup_title,
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ));
  }

  // container created for dots
  Container buildDot(int index) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? context.theme.corePalatte.primaryColor
            : context.theme.corePalatte.gray10,
      ),
    );
  }
}

class OnBoarding {
  final String image;
  final String title;
  final String desc;

  OnBoarding({required this.image, required this.title, required this.desc});
}
