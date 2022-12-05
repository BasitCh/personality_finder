// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/auth/apple/apple_auth.dart';
import 'package:morphosis_template/core/global/util/auth/auth_service/auth_service.dart';
import '../../../../../..//test/core/global/util/auth/apple/apple_auth_test.mocks.dart';
import '../../../../../..//test/features/login/presentation/bloc/login_bloc_test.dart';

@GenerateMocks([AppleAuth])
void main() {
  late AppleAuth mockAppleAuth;
  setUp(() {
    mockAppleAuth = MockAppleAuth();
  });

  group('Apple auth', () {
    test('MockAppleAuth is a subtype of AuthService', () {
      expect(mockAppleAuth, isA<AuthService>());
    });

    test('Should return authdata on sign in', () async {
      // arrange
      when(mockAppleAuth.signIn(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((realInvocation) async => data);
      // act
      final result =
          await mockAppleAuth.signIn(email: 'email', password: 'password');

      // assert
      verify(mockAppleAuth.signIn(
          email: anyNamed('email'), password: anyNamed('password')));
      expect(result, sampleAuthData);
    });
  });
}
