// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../core/global/extensions/context_extensions.dart';
import '../../../../core/global/extensions/number_extensions.dart';
import '../../../../core/global/typography/app_typography.dart';

class StandardText extends StatelessWidget {
  const StandardText({
    required this.text,
    Key? key,
    this.textAlign = TextAlign.center,
    this.fontSize = 14,
    this.color,
    this.fontWeight = FontWeight.w300,
    this.fontStyle = FontStyle.normal,
    this.textDecoration = TextDecoration.none,
    this.style,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  factory StandardText.withTheme(String text, TextStyle theme, Color color,
      {TextAlign align = TextAlign.center}) {
    return StandardText(
      text: text,
      style: theme.copyWith(
        color: color,
      ),
      textAlign: align,
    );
  }

  factory StandardText.label(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.label.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.labelMedium(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.labelMedium.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.labelSemiBold(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.labelSemiBold.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.underline(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    TextOverflow overflow = TextOverflow.ellipsis,
    double? fontSize,
    int? maxLines,
  }) {
    final style = AppTypography.label.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
      decoration: TextDecoration.underline,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.header2(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final style = AppTypography.header2.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  factory StandardText.header5(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final style = AppTypography.header5.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  factory StandardText.header6(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final style = AppTypography.header6.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  factory StandardText.header1(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final style = AppTypography.header1.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  factory StandardText.header3(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.header3.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );

    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.header4(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    final style = AppTypography.header4.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.linkUnderline(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final style = AppTypography.bodyMedium.copyWith(
      color: color ?? context.theme.corePalatte.textBlueColor,
      fontWeight: fontWeight,
      decoration: TextDecoration.underline,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  factory StandardText.bodyMedium(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.bodyMedium.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.bodyMediumSemiBold(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.bodyMediumSemiBold.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.bodyMediumBold(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.bodyMediumBold.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.bodyLarge(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.bodyLarge.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.bodyLargeMedium(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.bodyLargeMedium.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.bodySmall(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration decoration = TextDecoration.none,
  }) {
    final style = AppTypography.bodySmall.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      textDecoration: decoration,
    );
  }
  factory StandardText.bodySmallLight(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration decoration = TextDecoration.none,
  }) {
    final style = AppTypography.bodySmall.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.corePalatte.greyFontColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      textDecoration: decoration,
    );
  }

  factory StandardText.quote(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.quote.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.bodySmallMedium(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.bodySmallMedium.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.display(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final style = AppTypography.display.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  factory StandardText.error(
    String text, {
    TextAlign align = TextAlign.start,
  }) {
    final style = AppTypography.bodyMedium.copyWith(
      color: Colors.red,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
    );
  }

  factory StandardText.ultraLight(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight = FontWeight.w100,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    final style = AppTypography.bodyMedium.copyWith(
      fontWeight: fontWeight,
      color: color ?? context.theme.textColor,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.button(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
  }) {
    final style = AppTypography.button;
    return StandardText(
      text: text,
      style: style.copyWith(
        color: color ?? context.theme.textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      textAlign: align,
    );
  }

  // ~ For more customization

  factory StandardText.regular(
    String text, {
    double fontSize = 14,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.center,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return StandardText(
      text: text,
      textAlign: textAlign,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w200,
      textDecoration: textDecoration,
    );
  }

  factory StandardText.normal(
    String text, {
    double fontSize = 14,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.center,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return StandardText(
      text: text,
      textAlign: textAlign,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w300,
      textDecoration: textDecoration,
    );
  }

  factory StandardText.medium(
    String text, {
    double fontSize = 14,
    Color color = Colors.black,
    TextDecoration textDecoration = TextDecoration.none,
    TextAlign textAlign = TextAlign.center,
  }) {
    return StandardText(
      text: text,
      textAlign: textAlign,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w400,
      textDecoration: textDecoration,
    );
  }

  factory StandardText.semiBold(
    String text, {
    double fontSize = 14,
    Color color = Colors.black,
    TextDecoration textDecoration = TextDecoration.none,
    TextAlign textAlign = TextAlign.center,
  }) {
    return StandardText(
      text: text,
      textAlign: textAlign,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
      textDecoration: textDecoration,
    );
  }

  factory StandardText.bold(
    String text, {
    double fontSize = 14,
    Color color = Colors.black,
    TextDecoration textDecoration = TextDecoration.none,
    TextAlign textAlign = TextAlign.center,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return StandardText(
      text: text,
      textAlign: textAlign,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w600,
      textDecoration: textDecoration,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.extraBold(
    String text, {
    double fontSize = 14,
    Color color = Colors.black,
    TextDecoration textDecoration = TextDecoration.none,
    TextAlign textAlign = TextAlign.center,
  }) {
    return StandardText(
      text: text,
      textAlign: textAlign,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
      textDecoration: textDecoration,
    );
  }

  factory StandardText.italic(
    String text, {
    double fontSize = 14,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.center,
    TextDecoration textDecoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w300,
  }) {
    return StandardText(
      text: text,
      textAlign: textAlign,
      fontSize: fontSize,
      color: color,
      fontStyle: FontStyle.italic,
      textDecoration: textDecoration,
      fontWeight: fontWeight,
    );
  }

  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final TextDecoration textDecoration;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow ?? defaultTextStyle.overflow,
      maxLines: maxLines ?? defaultTextStyle.maxLines,
      style: style ??
          TextStyle(
            color: color,
            fontSize: fontSize.flexibleFontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: textDecoration,
            fontFamily: 'Poppins',
          ),
    );
  }
}
