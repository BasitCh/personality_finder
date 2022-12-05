// Dart imports:
import 'dart:io' as io;
import 'dart:typed_data';

// Package imports:
import 'package:file/local.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// Project imports:
import 'package:morphosis_template/core/global/util/cache/cache_controller.dart';
import 'package:morphosis_template/core/global/util/cache/default_cache_manager.dart'
    as df;

import '../../../../../..//test/core/global/util/auth/cache/cache_controller_test.mocks.dart';
import '../../../../../..//test/features/todo/services/todo_webservice_test.dart';

class CustomFileResponse implements FileResponse {
  @override
  // TODO: implement originalUrl
  String get originalUrl => URL;
}

Future<Uint8List> getImageAsByte() async {
  final dir = io.Directory.current.path;
  final byte = await io.File('$dir/test/sample_file/dog.jpeg').readAsBytes();
  return byte;
}

Future<io.File> getImageAsFile() async {
  final dir = io.Directory.current.path;
  final file = io.File('$dir/test/sample_file/dog.jpeg');
  return file;
}

@GenerateMocks([df.DefaultCacheManager])
Future<void> main() async {
  group('Cache controller', () {
    CacheController? cacheController;
    MockDefaultCacheManager? mockDefaultCacheManager;

    setUp(() {
      mockDefaultCacheManager = MockDefaultCacheManager();
      cacheController = CacheController(mockDefaultCacheManager!);
    });
    test('should get file from from default cache manageer', () async {
      // added this from file package because io.File is different from File in cache manager
      const fs = LocalFileSystem();
      final file = await getImageAsFile();
      final fileInfo = FileInfo(fs.file(file.path), FileSource.Cache,
          DateTime.now().add(const Duration(seconds: 2)), URL);

      when(mockDefaultCacheManager!.getFileFromCache('key'))
          .thenAnswer((realInvocation) async {
        return fileInfo;
      });

      final result = await cacheController!.getFileFromCache('key');
      final resultImageByte = await fileInfo.file.readAsBytes();
      expect(result, resultImageByte);
      verify(mockDefaultCacheManager!.getFileFromCache('key'));
    });

    test('should download file from from given url ', () async {
      const fs = LocalFileSystem();
      final file = await getImageAsFile();
      final fileInfo = FileInfo(fs.file(file.path), FileSource.Online,
          DateTime.now().add(const Duration(seconds: 2)), URL);

      when(mockDefaultCacheManager!.downloadFile(URL))
          .thenAnswer((realInvocation) async {
        return fileInfo;
      });

      final result = await cacheController!.downloadFile(URL);
      // used path instead of file because of dart referential equality
      expect(result.path, io.File(result.path).path);
      verify(mockDefaultCacheManager!.downloadFile(URL));
    });

    test('should put file into cache ', () async {
      const fs = LocalFileSystem();
      final fileByte = await getImageAsByte();
      final file = await getImageAsFile();

      when(mockDefaultCacheManager!
              .putFile(URL, fileByte, fileExtension: '.jpeg'))
          .thenAnswer((realInvocation) async => fs.file(file.path));

      await cacheController!.putFile(URL, fileByte, fileExtension: '.jpeg');
    });
  });
}
