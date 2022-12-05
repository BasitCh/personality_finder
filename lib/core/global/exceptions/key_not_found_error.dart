// Package imports:
import 'package:hive/hive.dart';

class KeyNotFoundError extends HiveError {
  KeyNotFoundError(String message) : super(message);
}
