// Project imports:
import '../../../generated/locale_keys.g.dart';
import 'localized_error.dart';

class GeneralError with LocalizedError {
  GeneralError() : super();

  @override
  String getLocalizedKey() => LocaleKeys.error_general;
}
