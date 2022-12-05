// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/auth/auth_service/auth_service.dart';
import 'package:morphosis_template/core/global/util/auth/facebook/facebook_auth.dart';
import '../../../../../..//test/core/global/util/auth/facebook/facebook_auth_test.mocks.dart';
import '../../../../../..//test/features/login/presentation/bloc/login_bloc_test.dart';

@GenerateMocks([FacebookAuth])
void main() {
  late FacebookAuth mockFacebookAuth;

  setUp(() {
    mockFacebookAuth = MockFacebookAuth();
  });

  group('Facebook auth', () {
    test('MockAppleAuth is a subtype of AuthService', () {
      expect(mockFacebookAuth, isA<AuthService>());
    });
  });

  test('Should return authdata on sign in', () async {
    // arrange
    when(mockFacebookAuth.signIn(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => data);
    // act
    final result =
        await mockFacebookAuth.signIn(email: 'email', password: 'password');

    // assert
    verify(mockFacebookAuth.signIn(
        email: anyNamed('email'), password: anyNamed('password')));
    expect(result, sampleAuthData);
  });
}
