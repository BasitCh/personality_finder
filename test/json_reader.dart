// Dart imports:
import 'dart:io';

String fixture(String name) => File('test/sample_file/$name').readAsStringSync();
