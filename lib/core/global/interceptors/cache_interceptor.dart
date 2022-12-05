// Package imports:
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:injectable/injectable.dart';

@singleton
class CacheInterceptor extends DioCacheInterceptor {
  // Passed null to HiveCacheStore since hive is already being used and initialized.
  CacheInterceptor()
      : super(options: CacheOptions(store: HiveCacheStore(null)));
}
