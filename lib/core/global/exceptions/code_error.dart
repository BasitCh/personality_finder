// Project imports:
import '../../../generated/locale_keys.g.dart';
import '../util/env/flavor_config.dart';
import 'localized_error.dart';

class CodeError with LocalizedError {
  @override
  String getLocalizedKey() {
    if (FlavorConfig.isDev()) {
      return LocaleKeys.error_during_dev;
    }
    return LocaleKeys.error_general;
  }
}
