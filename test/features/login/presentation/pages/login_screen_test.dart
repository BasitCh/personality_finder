// import 'package:firebase_core/firebase_core.dart';
// ignore_for_file: unused_local_variable

// Package imports:
import 'package:bloc_test/bloc_test.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:morphosis_template/core/global/theming/theme_cubit/theme_cubit.dart';
import 'package:morphosis_template/features/login/domain/repositories/auth_repo.dart';
import 'package:morphosis_template/features/login/presentation/bloc/login_bloc.dart';
import 'package:morphosis_template/features/login/presentation/pages/login_screen.dart';

import '../../../../firebase_mock_setup.dart';
import '../bloc/login_bloc_test.dart';

// import 'package:morphosis_template/architecture.dart';

class MockNavigationObserver extends Mock implements NavigatorObserver {}

class MockAuthenticationBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  setupFirebaseMock();
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // await initArchitecture();
    setupFirebaseMock();
  });

  MockAuthRepo? authRepo;
  late LoginBloc loginBloc;
  MockAuthService? mockAuthService;

  setUp(() {
    mockAuthService = MockAuthService();
    authRepo = MockAuthRepo(authService: mockAuthService!);
    loginBloc = LoginBloc(authRepo: authRepo!);
  });

  testWidgets('Should find login-button', (tester) async {
    await tester
        .pumpWidget(wrapper(child: const LoginScreen(), authRepo: authRepo!));

    await tester.pump(const Duration(seconds: 0));

    // expect(find.byType(ConnectivityScaffold), findsOneWidget);
    // expect(appbar, findsOneWidget);
    // final loginButton = find.byKey(const Key('login-btn'));

    // expect(loginButton, findsOneWidget);
  });
}

final mockObserver = MockNavigationObserver();
Widget wrapper({required Widget child, required AuthRepo authRepo}) {
  // mk.getAllTask();
  return MultiBlocProvider(
    providers: [
      BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit()..fetchTheme(),
      ),
      BlocProvider<LoginBloc>(
        create: (context) =>
            LoginBloc(authRepo: authRepo)..add(const CheckLoginStatus()),
      ),
    ],
    child: MaterialApp(
      home: child,
      navigatorObservers: [mockObserver],
    ),
  );
}
