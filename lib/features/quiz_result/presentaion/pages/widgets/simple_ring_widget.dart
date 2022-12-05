import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/color/hex_color.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';

// ignore: must_be_immutable
class SimpleRingWidget extends StatelessWidget {
  String colorCode;
  SimpleRingWidget({
    required this.colorCode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.flexibleWidth,
      height: 100.flexibleHeight,
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                color: HexColor(colorCode),
                value: 1,
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                color: HexColor(colorCode),
                value: .3, // Change this value to update the progress
              ),
            ),
          ],
        ),
      ),
    );
  }
}
