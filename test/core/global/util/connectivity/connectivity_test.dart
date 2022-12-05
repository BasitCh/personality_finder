// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/connectivity/connectivity.dart';
import '../../../../features/todo/presentation/pages/todo_screen_test.dart';

@GenerateMocks([ConnectivityHelper, Connectivity])
void main() {
  ConnectivityHelper? connectivityHelper;
  Connectivity? mockConn;
  setUp(() {
    mockConn = MockConnectivity();
    connectivityHelper =
        ConnectivityHelper(connectivityProvider: () => mockConn!);
  });

  group('Has connection', () {
    test('Should return true if connectivity is mobile ', () async {
      when(mockConn!.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.mobile);

      final result = await connectivityHelper!.hasConnection();

      expect(result, true);
    });

    test('Should return true if connectivity is wifi ', () async {
      when(mockConn!.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.wifi);

      final result = await connectivityHelper!.hasConnection();

      expect(result, true);
    });

    test('Should return false if connectivity is none ', () async {
      // arrange
      when(mockConn!.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.none);
      // act
      final result = await connectivityHelper!.hasConnection();
      // assert
      verify(mockConn!.checkConnectivity());
      expect(result, false);
    });
  });
}
