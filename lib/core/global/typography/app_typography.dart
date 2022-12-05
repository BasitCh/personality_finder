// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import '../extensions/number_extensions.dart';

class AppTypography {
  static final label = GoogleFonts.inter(
    fontSize: 15.flexibleFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  static final labelMedium = GoogleFonts.inter(
    fontSize: 12.flexibleFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
  static final labelSemiBold = GoogleFonts.inter(
    fontSize: 12.flexibleFontSize,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
  );

  static final button = GoogleFonts.inter(
    fontSize: 16.flexibleFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );

  static final bodySmall = GoogleFonts.inter(
    fontSize: 14.flexibleFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
  static final bodySmallMedium = GoogleFonts.inter(
    fontSize: 14.flexibleFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );

  static final bodyMedium = GoogleFonts.inter(
    fontSize: 16.flexibleFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  static final bodyMediumSemiBold = GoogleFonts.inter(
    fontSize: 16.flexibleFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: 2.5,
  );
  static final bodyMediumBold = GoogleFonts.inter(
    fontSize: 16.flexibleFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final bodyLarge = GoogleFonts.inter(
    fontSize: 18.flexibleFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );
  static final bodyLargeMedium = GoogleFonts.inter(
    fontSize: 18.flexibleFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static final quote = GoogleFonts.inter(
    fontSize: 20.flexibleFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static final header6 = GoogleFonts.inter(
    fontSize: 18.flexibleFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final header5 = GoogleFonts.inter(
    fontSize: 20.flexibleFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final header4 = GoogleFonts.inter(
    fontSize: 24.flexibleFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final header3 = GoogleFonts.inter(
    fontSize: 30.flexibleFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final header2 = GoogleFonts.inter(
    fontSize: 36.flexibleFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final header1 = GoogleFonts.inter(
    fontSize: 48.flexibleFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  static final display = GoogleFonts.inter(
    fontSize: 60.flexibleFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static final textTheme = TextTheme(
    headline1: header1,
    headline2: header2,
    headline3: header3,
    headline4: header4,
    headline5: header5,
    headline6: header6,
    subtitle1: quote,
    subtitle2: bodyLarge,
    bodyText1: bodyMedium,
    bodyText2: bodySmall,
    button: button,
    caption: label,
    overline: GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}
