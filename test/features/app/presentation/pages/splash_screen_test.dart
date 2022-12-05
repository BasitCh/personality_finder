// ignore_for_file: unused_local_variable, deprecated_member_use

// Dart imports:
import 'dart:async';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:morphosis_template/core/global/theming/theme/theme_palatte.dart';
import 'package:morphosis_template/core/global/theming/theme_cubit/theme_cubit.dart';
import 'package:morphosis_template/core/global/util/preferences/preferences_storage.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/app/presentation/pages/splash_screen.dart';
import 'package:morphosis_template/features/login/domain/repositories/auth_repo.dart';
import 'package:morphosis_template/features/login/presentation/bloc/login_bloc.dart';
import 'package:morphosis_template/features/login/presentation/pages/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../firebase_mock_setup.dart';
import '../../../login/presentation/bloc/login_bloc_test.dart';
import '../../../login/presentation/pages/login_screen_test.dart';

// import 'package:bloc_test/bloc_test.dart';

GetIt sl = GetIt.instance;
Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseMock();
  await Firebase.initializeApp();

// always add this before sharedpref mock
  SharedPreferences.setMockInitialValues({});
  //   final sharedPreferences = await SharedPreferences.getInstance();
  // getIt.registerFactory<SharedPreferences>(() => sharedPreferences);
  // await EasyLocalization.ensureInitialized();
  // await initArchitecture();

  MockAuthRepo? authRepo;
  MockAuthService? mockAuthService;
  setUpAll(() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerFactory<SharedPreferenceStorage>(
        () => SharedPreferenceStorage(sharedPreferences));
    mockAuthService = MockAuthService();
    authRepo = MockAuthRepo(authService: mockAuthService!);
  });
  group('splash screen', () {
    testWidgets('Should show login screen if user is not looged in',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(wrapper(
          child: const SplashScreen(),
          isLoggedIn: false,
          shouldShowError: false,
        ));
      });
      await tester.pump();
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('Should  show todo screen if  user is logged in',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(wrapper(
            child: const SplashScreen(),
            isLoggedIn: true,
            shouldShowError: false));
      });
      await tester.pump();
      expect(find.byType(LoginScreen), findsNothing);
    });

    testWidgets('Should  show error text if failure happened', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(wrapper(
            child: const SplashScreen(),
            isLoggedIn: true,
            shouldShowError: true));
      });
      await tester.pump();
      expect(find.text('Failed to Log in'), findsOneWidget);
    });
  });
}

// FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics();
// FirebaseAnalyticsObserver firebaseObserver =
//     FirebaseAnalyticsObserver(analytics: firebaseAnalytics);

final mockObserver = MockNavigationObserver();
Widget wrapper(
    {required Widget child,
    required bool isLoggedIn,
    required bool shouldShowError}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (context) => MockThemeCubit()..fetchTheme(),
      ),
      BlocProvider<LoginBloc>(
          create: (context) => MockLoginBloc(
              isLoggedIn: isLoggedIn, shouldShowError: shouldShowError)
            ..add(const CheckLoginStatus())),
    ],
    child: MaterialApp(
      home: child,
      navigatorObservers: [
        mockObserver,
      ],
    ),
  );
}

class MockLoginBloc extends Mock implements LoginBloc {
  late bool isLoggedIn;
  late bool shouldShowError;
  MockLoginBloc({required this.isLoggedIn, required this.shouldShowError});

  Stream<LoginState> mapCheckLoginStatus(CheckLoginStatus event) async* {
    yield const LoginChecking();
    await Future<dynamic>.delayed(const Duration(seconds: 1));

    final isLoggedIn = await authRepo.isLoggedIn();
    yield LoginChecked(isLoggedIn: isLoggedIn);
  }

  @override
  void add(LoginEvent event) {
    // TODO: implement add
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    // TODO: implement addError
  }

  @override
  // TODO: implement authRepo
  AuthRepo get authRepo => throw UnimplementedError();

  @override
  Future<void> close() async {
    // TODO: implement close
  }

  @override
  void emit(LoginState state) {
    // TODO: implement emit
  }

  Stream<LoginState> mapEventToState(LoginEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

  @override
  void onChange(Change<LoginState> change) {
    // TODO: implement onChange
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(LoginEvent event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    // TODO: implement onTransition
  }

  @override
  // TODO: implement state
  LoginState get state => shouldShowError
      ? const LoginFailure('Failed to Log in')
      : LoginChecked(isLoggedIn: isLoggedIn);

  @override
  // TODO: implement stream
  Stream<LoginState> get stream => shouldShowError
      ? Stream.value(const LoginFailure('Failed to Log in'))
      : Stream.value(LoginChecked(isLoggedIn: isLoggedIn));

  Stream<Transition<LoginEvent, LoginState>> transformEvents(
      Stream<LoginEvent> events,
      Transition<LoginEvent, LoginState> transitionFn) {
    // TODO: implement transformEvents
    throw UnimplementedError();
  }

  Stream<Transition<LoginEvent, LoginState>> transformTransitions(
      Stream<Transition<LoginEvent, LoginState>> transitions) {
    // TODO: implement transformTransitions
    throw UnimplementedError();
  }
}

class MockThemeCubit extends Mock implements ThemeCubit {
  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    // TODO: implement addError
  }

  @override
  Future<void> close() async {
    // TODO: implement close
  }

  @override
  void emit(ThemePalatte state) {
    // TODO: implement emit
  }

  @override
  Future fetchTheme() async {
    return emit(ThemePalatte.darkThemePalatte);
  }

  @override
  void onChange(Change<ThemePalatte> change) {
    // TODO: implement onChange
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  Future<void> onPlatformThemeChanged() async {}

  @override
  // TODO: implement state
  ThemePalatte get state => ThemePalatte.darkThemePalatte;

  @override
  // TODO: implement stream
  Stream<ThemePalatte> get stream =>
      Stream.value(ThemePalatte.darkThemePalatte);

  @override
  Future<void> switchTheme({required bool themeType}) async {}
}
