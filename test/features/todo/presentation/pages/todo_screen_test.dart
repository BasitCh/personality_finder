// Dart imports:
import 'dart:async';

// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart' as con;
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:morphosis_template/core/global/theming/theme/theme_palatte.dart';
import 'package:morphosis_template/core/global/theming/theme_cubit/theme_cubit.dart';
import 'package:morphosis_template/core/global/util/preferences/preferences_storage.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';

import '../../../login/presentation/pages/login_screen_test.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:morphosis_template/features/app/presentation/widgets/connectivity_scaffold.dart';

GetIt sl = GetIt.instance;
MockThemeCubit mockThemeCubit = MockThemeCubit(isDarkTheme: false);

class MockConnectivity extends Mock implements con.Connectivity {
  @override
  Future<con.ConnectivityResult> checkConnectivity() async {
    // TODO: implement checkConnectivity
    return ConnectivityResult.mobile;
  }

  @override
  // TODO: implement onConnectivityChanged
  Stream<con.ConnectivityResult> get onConnectivityChanged {
    return Stream.value(con.ConnectivityResult.mobile);
  }
}

class MockWifiInfo extends Mock implements WifiInfo {
  @override
  Future<LocationAuthorizationStatus> getLocationServiceAuthorization() async {
    // TODO: implement getLocationServiceAuthorization

    return LocationAuthorizationStatus.authorizedAlways;
  }

  @override
  Future<String?> getWifiBSSID() async {
    // TODO: implement getWifiBSSID

    return 'baska';
  }

  @override
  Future<String?> getWifiIP() async {
    // TODO: implement getWifiIP

    return 'baska';
  }

  @override
  Future<String?> getWifiName() async {
    // TODO: implement getWifiName
    return 'baska';
  }

  @override
  Future<LocationAuthorizationStatus> requestLocationServiceAuthorization(
      {bool requestAlwaysLocationUsage = false}) async {
    // TODO: implement requestLocationServiceAuthorization

    return LocationAuthorizationStatus.authorizedAlways;
  }
}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.setMockInitialValues({});

  setUpAll(() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerFactory<SharedPreferenceStorage>(
        () => SharedPreferenceStorage(sharedPreferences));
    // await EasyLocalization.ensureInitialized();
  });
  group('todo screen', () {
    testWidgets('todo screen', (tester) async {
      // await tester.pumpWidget(wrapper(
      //     child: OfflineBuilder.initialize(
      //       builder: (ctx) {

      //         return const TodoScreen();
      //       },
      //       connectivityBuilder: (ctx, result, child) {
      //         result = con.ConnectivityResult.mobile;
      //         return const TodoScreen();
      //       },
      //       wifiInfo: MockWifiInfo(),
      //       connectivityService: MockConnectivity(),
      //       // child: const TodoScreen(),
      //     ),
      //     isLoggedIn: false,
      //     shouldShowError: false,
      //   ));
    });
  });
}

final mockObserver = MockNavigationObserver();
Widget wrapper(
    {required Widget child,
    required bool isLoggedIn,
    required bool shouldShowError}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (context) => MockThemeCubit(isDarkTheme: true)..fetchTheme(),
      ),
    ],
    child: MaterialApp(
      home: child,
      navigatorObservers: [
        mockObserver,
      ],
    ),
  );
}

class MockThemeCubit extends Mock implements ThemeCubit {
  late bool isDarkTheme;
  MockThemeCubit({required this.isDarkTheme});
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
  ThemePalatte get state => !isDarkTheme
      ? ThemePalatte.lightThemePalatte
      : ThemePalatte.darkThemePalatte;

  @override
  // TODO: implement stream
  Stream<ThemePalatte> get stream => isDarkTheme
      ? Stream.value(ThemePalatte.darkThemePalatte)
      : Stream.value(ThemePalatte.lightThemePalatte);

// call pump and settle to rebuild
  @override
  Future<void> switchTheme({required bool themeType}) async {
    isDarkTheme = themeType;
  }
}
