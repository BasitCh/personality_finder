// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../extensions/context_extensions.dart';

class SnackBarHelper {
  static void showSnackbarWithText(
    BuildContext context, {
    required String text,
    Duration duration = const Duration(seconds: 4),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    TextStyle? textStyle,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: textStyle ??
              TextStyle(
                color: context.theme.corePalatte.white,
              ),
        ),
        duration: duration,
        action: action,
        behavior: behavior,
      ),
    );
  }

  static void showSnackbarWithCustomView(
    BuildContext context, {
    required Widget view,
    Duration duration = const Duration(seconds: 4),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: view,
        duration: duration,
        action: action,
        behavior: behavior,
      ),
    );
  }
}
