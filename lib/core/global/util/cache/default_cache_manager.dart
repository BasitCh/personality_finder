// Package imports:
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';

// import '../../flutter_cache_manager.dart';
// import '../config/config.dart';

/// The DefaultCacheManager that can be easily used directly. The code of
/// this implementation can be used as inspiration for more complex cache
/// managers.
@injectable
class DefaultCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static final DefaultCacheManager _instance = DefaultCacheManager._();
  factory DefaultCacheManager() {
    return _instance;
  }

  DefaultCacheManager._() : super(Config(key));
}
