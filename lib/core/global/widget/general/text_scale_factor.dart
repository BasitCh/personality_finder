// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../util/env/flavor_config.dart';

class TextScaleFactor extends StatelessWidget {
  final Widget child;

  const TextScaleFactor({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    FlavorConfig.instance.devicePixelRatio = mediaQuery.devicePixelRatio;
    if (FlavorConfig.isInTest()) return child;
    return MediaQuery(
      data: mediaQuery.copyWith(textScaleFactor: 1),
      child: child,
    );
  }
}
