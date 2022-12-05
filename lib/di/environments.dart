// Package imports:
import 'package:injectable/injectable.dart';

class Environments {
  static const String PROD = 'prod';
  static const String DEV = 'dev';
  static const String DUMMY = 'dummy';
  static const String TEST = 'test';
  static const String STAGE = 'stage';
}

const dummy = Environment(Environments.DUMMY);
// Dev, prod and test are defined in injectable
