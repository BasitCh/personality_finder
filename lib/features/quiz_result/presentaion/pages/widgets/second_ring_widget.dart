import 'package:flutter/material.dart';
import 'package:morphosis_template/core/global/extensions/context_extensions.dart';
import 'package:morphosis_template/core/global/extensions/number_extensions.dart';

class SecondRing extends StatelessWidget {
  const SecondRing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 198.flexibleWidth,
      height: 100.flexibleHeight,
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: context.theme.corePalatte.white,
                value: 1,
              ),
            ),
            SizedBox(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: context.theme.corePalatte.white,
                value: .3, // Change this value to update the progress
              ),
            ),
          ],
        ),
      ),
    );
  }
}
