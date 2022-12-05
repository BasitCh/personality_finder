// Flutter imports:
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    this.thickness = 1.5,
    this.height = 2,
    this.color = const Color(0xF8F0F1F8),
    Key? key,
  }) : super(key: key);

  final double thickness;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      height: 1,
      color: color,
    );
  }
}
