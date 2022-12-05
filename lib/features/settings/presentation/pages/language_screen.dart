// Flutter imports:
// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morphosis_template/core/global/graphql/gql_service_impl.dart';
import 'package:morphosis_template/core/global/languages/entities/language.dart';
import 'package:morphosis_template/core/global/languages/language_bloc.dart';
import 'package:morphosis_template/core/global/util/preferences/preferences_storage.dart';
import 'package:morphosis_template/core/repository/secure_storage/auth/auth_storage_impl.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/login/domain/repositories/auth_repo.dart';
import 'package:morphosis_template/features/settings/presentation/bloc/profile/profile_bloc.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/navigator/app_router.gr.dart';
import '../../../../core/global/util/app_constants.dart';
import '../../../app/presentation/widgets/standard_text.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var _selectedIndex = 0;
  late final ProfileBloc profileBloc;

  @override
  void initState() {
    super.initState();
    profileBloc = ProfileBloc(authRepo: getIt<AuthRepo>());
    _detectLocale();
  }

  Future<void> _detectLocale() async {
    final sp = getIt<SharedPreferenceStorage>();
    final locale = sp.getLocale() ?? Languages.languages[0].code;
    for (var index = 0; index < Languages.languages.length; index++) {
      if (Languages.languages[index].code == locale) {
        setState(() {
          _selectedIndex = index;
        });
      }
    }
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
              context, AppLocalizations.of(context)!.language_text),
        ),
        body: BlocConsumer(
            bloc: profileBloc,
            listener: (context, state) {
              if (state is FailedUpdatingLocale) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.error,
                    style: TextStyle(color: context.theme.corePalatte.white),
                  ),
                ));
              } else if (state is LocaleUpdated) {
                AutoRouter.of(context).pushAndPopUntil(const HomeRoute(),
                    predicate: (route) => false);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    AppLocalizations.of(context)!.locale_update,
                    style: TextStyle(color: context.theme.corePalatte.white),
                  ),
                ));
              }
            },
            builder: (context, state) {
              return ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        getIt<LanguageBloc>().add(
                            ToggleLanguageEvent(Languages.languages[index]));
                        profileBloc.add(UpdateLocale(
                            locale: Languages.languages[index].code == 'en'
                                ? Locale.en
                                : Languages.languages[index].code == 'fr'
                                    ? Locale.fr
                                    : Locale.es));

                        updateClient();
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            index == _selectedIndex
                                ? StandardText.semiBold(
                                    languages[index],
                                    textAlign: TextAlign.left,
                                    fontSize: 14,
                                  )
                                : StandardText.label(
                                    context,
                                    languages[index],
                                    align: TextAlign.left,
                                    fontSize: 14,
                                  ),
                            index == _selectedIndex
                                ? SvgPicture.asset(
                                    'assets/images/icons/selected.svg')
                                : const SizedBox(
                                    height: 10,
                                    width: 10,
                                  ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: languages.length);
            }));
  }

  Future<void> updateClient() async {
    final accessToken = await getIt<AuthStoring>().getAccessToken();
    final sp = getIt<SharedPreferenceStorage>();
    final languageCode = sp.getLocale() ?? Languages.languages[0].code;
    await getIt<GraphQLServiceImpl>()
        .updateClient(languageCode, accessToken!, context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
