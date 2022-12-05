// Dart imports:
import 'dart:io';
import 'dart:typed_data';

// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:morphosis_template/core/global/util/cache/cache_controlling.dart';
import 'package:morphosis_template/core/global/util/cache/default_cache_manager.dart';

// import 'package:flutter_cache_manager/flutter_cache_manager.dart';

@Singleton(as: CacheControlling)
class CacheController extends CacheControlling {
  final DefaultCacheManager defaultCacheManager;

  CacheController(this.defaultCacheManager);

  @override
  Future<Uint8List?> getFileFromCache(String url) async {
    final fileInfo = await defaultCacheManager.getFileFromCache(url);
    return fileInfo?.file.readAsBytes();
  }

  @override
  Future<Uint8List> downloadFileByBytes(String url) async {
    final file = await downloadFile(url);
    return file.readAsBytes();
  }

  @override
  Future<File> downloadFile(String url) async {
    final fileInfo = await defaultCacheManager.downloadFile(url);
    return fileInfo.file;
  }

  @override
  Future<void> putFile(String url, Uint8List fileBytes,
      {required String fileExtension}) async {
    await defaultCacheManager.putFile(url, fileBytes,
        fileExtension: fileExtension);
  }
}
