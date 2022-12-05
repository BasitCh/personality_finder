// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../util/env/flavor_config.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;

  const FlavorBanner({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProd()) return child;
    return Stack(
      children: [
        child,
        _buildBanner(context),
      ],
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: FlavorConfig.instance.name,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: FlavorConfig.instance.color),
      ),
    );
  }
}
