// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart' show GenerateMocks;

// Project imports:
import 'package:morphosis_template/core/global/exceptions/un_authorized_error.dart';
import 'package:morphosis_template/core/repository/refresh/refresh_repository.dart';

@GenerateMocks([RefreshRepository])
void main() {
  // final refresh = MockRefreshRepository();

  group('Refresh Repository', () {
    test('should throw unimplemented error', () async {
      // final err = DioError(requestOptions: RequestOptions(path: '/'));
      // dynamic error;
      // when(refresh.refresh(err)).thenThrow(UnimplementedError());
      // try {
      //   await refresh.refresh(err);
      // } catch (e) {
      //   error = e;
      // }
      expect(UnimplementedError, true);
      // expect(await refresh.refresh(err) as UnimplementedError, true);
    });

    test('should throw unauthorised error', () async {
      // final err = DioError(requestOptions: RequestOptions(path: '/'));
      // dynamic error;
      // when(refresh.refresh(err)).thenThrow(UnAuthorizedError(err));
      // try {
      //   await refresh.refresh(err);
      // } catch (e) {
      //   error = e;
      // }
      expect(UnAuthorizedError, true);
      // expect(await refresh.refresh(err) as UnimplementedError, true);
    });
  });
}
