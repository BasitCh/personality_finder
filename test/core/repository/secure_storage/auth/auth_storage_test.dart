// class MockAuthStorage extends Mock implements AuthStorage {}

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/repository/refresh/refresh_repository.dart';
import 'package:morphosis_template/core/repository/secure_storage/auth/auth_storage.dart';
import '../../../../..//test/core/repository/secure_storage/auth/auth_storage_test.mocks.dart';

// class MockAuthStorage extends Mock implements AuthStorage {}

@GenerateMocks([AuthStorage])
void main() {
  final mockStorage = MockAuthStorage();

  group('Auth Storage', () {
    group('Access token test', () {
      test('should return a string of token', () async {
        when(mockStorage.getAccessToken())
            .thenAnswer((_) async => 'access-token');
        expect(await mockStorage.getAccessToken(), isA<String>());
      });

      test('should return access token', () async {
        when(mockStorage.getAccessToken())
            .thenAnswer((_) async => 'access-token');
        expect(await mockStorage.getAccessToken(), 'access-token');
      });
    });

    group('Refresh token test', () {
      test('should return a string of token', () async {
        when(mockStorage.getRefreshToken())
            .thenAnswer((_) async => 'refresh-token');
        expect(await mockStorage.getRefreshToken(), isA<String>());
      });

      final refreshRepository = RefreshRepository(mockStorage);
      test('Refreshing with success', () async {
        when(mockStorage.getAccessToken())
            .thenAnswer((_) async => 'access-token-1x1x');
        when(mockStorage.getAccessToken())
            .thenAnswer((_) async => 'access-token-1x1x');
        when(mockStorage.getRefreshToken())
            .thenAnswer((_) => Future.value(null));
        final err = DioError(requestOptions: RequestOptions(path: '/'));
        dynamic error;
        try {
          await refreshRepository.refresh(err);
        } catch (e) {
          error = e;
        }
        expect(error is UnimplementedError, true);
        verify(mockStorage.getAccessToken()).called(2);
        verify(mockStorage.getRefreshToken()).called(1);
        verifyNoMoreInteractions(mockStorage);
      });
    });
  });
}
