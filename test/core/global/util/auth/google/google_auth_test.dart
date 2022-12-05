// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/auth/auth_service/auth_service.dart';
import 'package:morphosis_template/core/global/util/auth/google/google_auth.dart';
import '../../../../../..//test/core/global/util/auth/google/google_auth_test.mocks.dart';
import '../../../../../..//test/features/login/presentation/bloc/login_bloc_test.dart';

@GenerateMocks([GoogleAuth])
void main() {
  late GoogleAuth mockGoogleAuth;

  setUp(() {
    mockGoogleAuth = MockGoogleAuth();
  });

  group('Google auth', () {
    test('MockAppleAuth is a subtype of AuthService', () {
      expect(mockGoogleAuth, isA<AuthService>());
    });
  });

  test('Should return authdata on sign in', () async {
    // arrange
    when(mockGoogleAuth.signIn(
            email: anyNamed('email'), password: anyNamed('password')))
        .thenAnswer((_) async => data);

    // act
    final result =
        await mockGoogleAuth.signIn(email: 'ib@gmail.com', password: '1234');

    // assert
    verify(mockGoogleAuth.signIn(
        email: anyNamed('email'), password: anyNamed('password')));
    expect(result, sampleAuthData);
  });
}
