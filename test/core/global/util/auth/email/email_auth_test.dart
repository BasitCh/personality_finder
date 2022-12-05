// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/auth/auth_service/auth_service.dart';
import 'package:morphosis_template/core/global/util/auth/email/email_auth.dart';
import '../../../../../../test/core/global/util/auth/email/email_auth_test.mocks.dart';
import '../../../../../../test/features/login/presentation/bloc/login_bloc_test.dart';

// run : flutter packages pub run build_runner build --delete-conflicting-outputs
@GenerateMocks([EmailAuth])
void main() {
  late EmailAuth mockEmailAuth;

  setUp(() {
    mockEmailAuth = MockEmailAuth();
  });

  group('Email auth', () {
    test('MockAppleAuth is a subtype of AuthService', () {
      expect(mockEmailAuth, isA<AuthService>());
    });
  });

  test('Should return authdata on sign in', () async {
    // arrange
    when(mockEmailAuth.signIn(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => data);
    // act
    final result =
        await mockEmailAuth.signIn(email: 'ib@gmail.com', password: '1224455');

    // assert
    verify(mockEmailAuth.signIn(
        email: anyNamed('email'), password: anyNamed('password')));
    expect(result, sampleAuthData);
  });
}
