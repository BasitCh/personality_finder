// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/permission_checker/src/functions.dart';
import 'package:morphosis_template/core/global/util/permission_checker/src/strings/messages.dart';
import '../../../../../..//test/core/global/util/permission_checker/src/functions_test.mocks.dart';

@GenerateMocks([PermissionFuncs])
void main() {
  late MockPermissionFuncs permissionFunc;

  // ignore: unused_element
  Future<bool> boolVal() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return true;
    });
  }

  const boolCheck = true;

  setUp(() {
    permissionFunc = MockPermissionFuncs();
  });
  test('test get Message to return string value', () async {
    final data = permissionFunc.getMessage('storage');
    expect(data, Strings.storageMessage);
    expect(data.runtimeType, Strings.storageMessage.runtimeType);
  });

  test('test isFirstTimeStoragePermission to return boolean', () async {
    when(await permissionFunc.isFirstTimeStoragePermission())
        .thenAnswer((realInvocation) => false);

    final data = await permissionFunc.isFirstTimeStoragePermission();

    verify(permissionFunc.isFirstTimeStoragePermission());

    expect(data, boolCheck);
  });

  test('test isFirstTimeLocationRequest to return boolean', () async {
    when(await permissionFunc.isFirstTimeLocationRequest())
        .thenAnswer((realInvocation) => false);

    final data = await permissionFunc.isFirstTimeLocationRequest();

    verify(permissionFunc.isFirstTimeLocationRequest());

    expect(data, boolCheck);
  });

  test('test isFirstTimeContactsPermission to return boolean', () async {
    when(await permissionFunc.isFirstTimeContactsPermission())
        .thenAnswer((realInvocation) => false);

    final data = await permissionFunc.isFirstTimeContactsPermission();

    verify(permissionFunc.isFirstTimeContactsPermission());

    expect(data, boolCheck);
  });

  test('test isFirstTimeMicrophonePermission to return boolean', () async {
    when(await permissionFunc.isFirstTimeMicrophonePermission())
        .thenAnswer((realInvocation) => false);

    final data = await permissionFunc.isFirstTimeMicrophonePermission();

    verify(permissionFunc.isFirstTimeMicrophonePermission());

    expect(data, boolCheck);
  });

  test('test isFirstTimeSpeechPermission to return boolean', () async {
    when(await permissionFunc.isFirstTimeSpeechPermission())
        .thenAnswer((realInvocation) => false);

    final data = await permissionFunc.isFirstTimeSpeechPermission();

    verify(permissionFunc.isFirstTimeSpeechPermission());

    expect(data, boolCheck);
  });

  test('test isFirstTimeMediaLibraryPermission to return boolean', () async {
    when(await permissionFunc.isFirstTimeMediaLibraryPermission())
        .thenAnswer((realInvocation) => false);

    final data = await permissionFunc.isFirstTimeMediaLibraryPermission();

    verify(permissionFunc.isFirstTimeMediaLibraryPermission());

    expect(data, boolCheck);
  });

  test('test isFirstTimeReminderPermission to return boolean', () async {
    when(await permissionFunc.isFirstTimeReminderPermission())
        .thenAnswer((realInvocation) => false);

    final data = await permissionFunc.isFirstTimeReminderPermission();

    verify(permissionFunc.isFirstTimeReminderPermission());

    expect(data, boolCheck);
  });
}
