// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:morphosis_template/features/app/presentation/pages/dashboard_screen.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/util/logging/logging.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import 'locale_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        buildWhen: (previous, current) {
          return !(current is LoggingIn) && !(current is LoginFailure);
        },
        builder: (context, state) {
          logger.debug('STATE: ========> ${state.toString()}');
          if (state is LoginInitial || state is LoginChecking) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/icons/Logo Animation@3x.png'),
                  fit: BoxFit.contain,
                ),
              ),
            );
          }

          if (state is LoginChecked) {
            return state.isLoggedIn ? DashBoardScreen() : LocaleScreen();
          }

          if (state is LoginSuccess) {
            return HomeScreen();
          }

          if (state is LoginFailure) {
            return Center(
              child: Text(AppLocalizations.of(context)!.failed_to_login_text),
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
