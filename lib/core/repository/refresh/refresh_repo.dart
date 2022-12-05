// Flutter imports:
// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class RefreshRepo {
  Future refresh(DioError err);

  void resetFailure();

  VoidCallback? logoutCallback;
}
