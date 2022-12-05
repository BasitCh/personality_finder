// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import 'standard_text.dart';

class AppNextButton extends StatelessWidget {
  const AppNextButton(
      {required this.text,
      this.child,
      this.onPressed,
      Key? key,
      this.height = 50,
      this.width = 334,
      this.radius = 12,
      this.color,
      this.borderColor,
      this.textColor = Colors.white,
      this.textSize = 16.0,
      this.textAlign = TextAlign.center,
      this.fontWeight = FontWeight.w500,
      this.leftHalfRadius = false,
      this.rightHalfRadius = false,
      this.isLoading = false,
      this.changeColor = false})
      : super(key: key);

  /// text does not show if child is given.
  final String text;

  /// If child is given, text is not shown.
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double textSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double height;
  final double width;
  final double radius;
  final Color? borderColor;
  final bool leftHalfRadius;
  final bool rightHalfRadius;
  final bool isLoading;
  final bool changeColor;
  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(leftHalfRadius ? 0 : radius),
          right: Radius.circular(rightHalfRadius ? 0 : radius),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color ??
              (changeColor
                  ? context.theme.corePalatte.primaryColor
                  : context.theme.corePalatte.gray20),

          // make the button as small as possible
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 0,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(leftHalfRadius ? 0 : radius),
              bottomLeft: Radius.circular(leftHalfRadius ? 0 : radius),
              topRight: Radius.circular(rightHalfRadius ? 0 : radius),
              bottomRight: Radius.circular(rightHalfRadius ? 0 : radius),
            ),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : child ??
                StandardText.bodySmallMedium(
                  context,
                  text,
                  color: isEnabled
                      ? (textColor ?? context.theme.corePalatte.white)
                      : context.theme.corePalatte.gray20,
                  align: textAlign,
                  fontSize: textSize,
                  fontWeight: fontWeight,
                ),
      ),
    );
  }
}
