// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/auth/auth_service/auth_service.dart';
import 'package:morphosis_template/features/login/domain/entities/auth_data.dart';
import 'package:morphosis_template/features/login/domain/repositories/auth_repo.dart';
import 'package:morphosis_template/features/login/presentation/bloc/login_bloc.dart';

class MockAuthRepo extends Mock implements AuthRepo {
  @override
  AuthService authService;
  MockAuthRepo({required this.authService});
  @override
  Future<String> getAccessToken() {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  Future<String> getRefreshToken() {
    // TODO: implement getRefreshToken
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    return authService.isSignedIn();
  }

  // @override
  // Future<void> logOut() async {
  //   // TODO: implement logOut
  //   await authService.signOut();
  // }

}

const name = 'ibrahim';
// const password = '12345';

AuthData sampleAuthData = AuthData(
    accessToken: 'kdjhrjhrrrr.djdj.djdjd',
    refreshToken: 'kjfhr.jrjrr.jfj',
    displayName: name,
    idToken: 'kjfhrjr');

final Either<AuthData, Exception> data =
    data.fold((l) => left(sampleAuthData), (r) => right(Exception(r)));

class MockAuthService extends Mock implements AuthService {
  @override
  Future<Either<AuthData, Exception>> signIn({
    String? email,
    String? password,
  }) {
    return Future.value(data);
  }

  @override
  Future<bool> isSignedIn() {
    return Future.value(true);
  }

  // @override
  // Future<void> signOut() async {
  //   return Future.value();
  // }
}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // await configureDependencies(Environments.DEV);
  const samplePerformLogin = PerformLogIn(
      authType: AuthType.fake, email: 'ibrahim@gmail.com', password: 'test');
  group('Login bloc test', () {
    MockAuthRepo authRepo;
    LoginBloc? loginBloc;
    MockAuthService? mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      authRepo = MockAuthRepo(authService: mockAuthService!);
      loginBloc = LoginBloc(authRepo: authRepo);
    });

    blocTest<LoginBloc, LoginState>(
      'emits [LoginChecking, LoginChecked] states for'
      '_mapCheckLoginStatus',
      build: () => loginBloc!,
      act: (bloc) => bloc.add(const CheckLoginStatus()),
      expect: () {
        return [const LoginChecking(), const LoginChecked(isLoggedIn: true)];
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoggingIn, LoginSuccess] states for'
      '_mapLogIn',
      build: () => loginBloc!,
      act: (bloc) => bloc.add(samplePerformLogin),
      expect: () {
        return [const LoggingIn(), LoginSuccess(authData: sampleAuthData)];
      },
    );
    blocTest<LoginBloc, LoginState>(
      'emits [LoggingOut, LoginChecked] states for'
      '_mapLogOut',
      build: () => loginBloc!,
      act: (bloc) => bloc.add(const LogOut()),
      expect: () {
        return [const LoggingOut(), const LoginChecked(isLoggedIn: false)];
      },
    );
    tearDown(() {
      loginBloc?.close();
    });
  });
}
