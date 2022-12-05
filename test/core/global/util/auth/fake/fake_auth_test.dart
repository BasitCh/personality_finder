// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/auth/auth_service/auth_service.dart';
import 'package:morphosis_template/core/global/util/auth/fake/fake_auth.dart';
import '../../../../../..//test/core/global/util/auth/fake/fake_auth_test.mocks.dart';
import '../../../../../..//test/features/login/presentation/bloc/login_bloc_test.dart';

// run : flutter packages pub run build_runner build --delete-conflicting-outputs
@GenerateMocks([FakeAuth])
void main() {
  late FakeAuth mockFakeAuth;

  setUp(() {
    mockFakeAuth = MockFakeAuth();
  });

  group('Fake auth', () {
    test('MockAppleAuth is a subtype of AuthService', () {
      expect(mockFakeAuth, isA<AuthService>());
    });
  });

  test('Should return authdata on sign in', () async {
    // arrange
    when(mockFakeAuth.signIn()).thenAnswer((_) async => data);
    // act
    final result = await mockFakeAuth.signIn();

    // assert
    verify(mockFakeAuth.signIn());
    expect(result, sampleAuthData);
  });
}
