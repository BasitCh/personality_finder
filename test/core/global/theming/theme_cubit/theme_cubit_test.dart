// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/theming/theme/theme_palatte.dart';
import 'package:morphosis_template/core/global/theming/theme_cubit/theme_cubit.dart';
import 'package:morphosis_template/core/global/util/preferences/preferences_storage.dart';
import 'package:morphosis_template/di/injectable.dart';
import '../../../../..//test/core/global/theming/theme_cubit/theme_cubit_test.mocks.dart';

@GenerateMocks([SharedPreferenceStorage])
Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences.setMockInitialValues({});
  // final sharedPreferences = await SharedPreferences.getInstance();
  final sharedPrefStorage = MockSharedPreferenceStorage();
  getIt.registerFactory<SharedPreferenceStorage>(() => sharedPrefStorage);

  group('Theme cubit', () {
    blocTest<ThemeCubit, ThemePalatte>(
        'should return light theme if isDark is false',
        build: () => ThemeCubit(),
        setUp: () {
          when(sharedPrefStorage.isDark())
              .thenAnswer((realInvocation) => false);
        },
        act: (c) {
          c.fetchTheme();
        },
        expect: () => [ThemePalatte.lightThemePalatte]);

    blocTest<ThemeCubit, ThemePalatte>(
        'should transit from dark to light theme if switchTheme argument is false',
        build: () => ThemeCubit(),
        setUp: () {
          when(sharedPrefStorage.isDark()).thenReturn(true);
        },
        act: (c) async {
          await c.fetchTheme();
          await c.switchTheme(themeType: false);
        },
        verify: (c) {
          verify(sharedPrefStorage.isDark());
        },
        expect: () =>
            [ThemePalatte.darkThemePalatte, ThemePalatte.lightThemePalatte]);

    blocTest<ThemeCubit, ThemePalatte>(
        'should transit from dark to light theme if platform theme is changed',
        build: () => ThemeCubit(),
        setUp: () {
          when(sharedPrefStorage.isDark()).thenReturn(false);
        },
        act: (c) async {
          await c.onPlatformThemeChanged();
        },
        verify: (c) {
          // to comfirm if its called by onPlatformThemeChanged
          verify(sharedPrefStorage.isDark());
        },
        expect: () => [ThemePalatte.lightThemePalatte]);
  });
}
