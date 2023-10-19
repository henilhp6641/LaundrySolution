import 'package:flutter/material.dart';
import '../components/constant.dart';



extension TextStyleExtensions on TextStyle {
  // Weights
  TextStyle get bold => weight(FontWeight.w600);

  // Styles

  TextStyle get normal24w500 => customStyle(
      fontSize: 24,
      letterSpacing: 0.0,
      weight: FontWeight.w500,
      fontFamily: Constant.jakartaRegular
  );

  TextStyle get normal24Bold => customStyle(
      fontSize: 24,
      letterSpacing: 0.0,
      weight: FontWeight.bold,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal16w400 => customStyle(
      fontSize: 16,
      letterSpacing: 0.0,
      weight: FontWeight.w400,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal16w500 => customStyle(
      fontSize: 16,
      letterSpacing: 0.0,
      weight: FontWeight.w500,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal16w600 => customStyle(
      fontSize: 16,
      letterSpacing: 0.0,
      weight: FontWeight.w600,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal10w500 => customStyle(
      fontSize: 10,
      letterSpacing: 0.0,
      weight: FontWeight.w500,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal18w600 => customStyle(
      fontSize: 18,
      letterSpacing: 0.0,
      weight: FontWeight.w600,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal12w400 => customStyle(
      fontSize: 12,
      letterSpacing: 0.0,
      weight: FontWeight.w400,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal20wBold => customStyle(
      fontSize: 20,
      letterSpacing: 0.0,
      weight: FontWeight.bold,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal24w600 => customStyle(
      fontSize: 24,
      letterSpacing: 0.0,
      weight: FontWeight.w600,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal22w600 => customStyle(
      fontSize: 22,
      letterSpacing: 0.0,
      weight: FontWeight.w600,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal22w400 => customStyle(
      fontSize: 22,
      letterSpacing: 0.0,
      weight: FontWeight.w400,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal20w600 => customStyle(
      fontSize: 20,
      letterSpacing: 0.0,
      weight: FontWeight.w600,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal20w400 => customStyle(
      fontSize: 20,
      letterSpacing: 0.0,
      weight: FontWeight.w400,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal42w600 => customStyle(
      fontSize: 42,
      letterSpacing: 0.0,
      weight: FontWeight.w600,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal18w700 => customStyle(
      fontSize: 18,
      letterSpacing: 0.0,
      weight: FontWeight.w700,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal14w400 => customStyle(
      fontSize: 14,
      letterSpacing: 0.0,
      weight: FontWeight.w400,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal14w600 => customStyle(
      fontSize: 14,
      letterSpacing: 0.0,
      weight: FontWeight.w600,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal14w500 => customStyle(
      fontSize: 14,
      letterSpacing: 0.0,
      weight: FontWeight.w500,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal14w800 => customStyle(
      fontSize: 14,
      letterSpacing: 0.0,
      weight: FontWeight.w800,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal18w400 => customStyle(
      fontSize: 18,
      letterSpacing: 0.0,
      weight: FontWeight.w400,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal18w500 => customStyle(
      fontSize: 18,
      letterSpacing: 0.0,
      weight: FontWeight.w500,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal18Bold => customStyle(
      fontSize: 18,
      letterSpacing: 0.0,
      weight: FontWeight.bold,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal30w600 => customStyle(
      fontSize: 30,
      letterSpacing: 0.0,
      weight: FontWeight.w600,
      fontFamily: Constant.jakartaRegular
  );

  TextStyle get normal32Bold => customStyle(
      fontSize: 32,
      letterSpacing: 0.0,
      weight: FontWeight.bold,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal26w400 => customStyle(
      fontSize: 26,
      letterSpacing: 0.0,
      weight: FontWeight.w400,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal30w400 => customStyle(
      fontSize: 30,
      letterSpacing: 0.0,
      weight: FontWeight.w400,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal32w400 => customStyle(
      fontSize: 32,
      letterSpacing: 0.0,
      weight: FontWeight.w400,
      fontFamily: Constant.jakartaRegular
  );
  TextStyle get normal40w500 => customStyle(
      fontSize: 40,
      letterSpacing: 0.0,
      weight: FontWeight.w500,
      fontFamily: Constant.jakartaRegular
  );

  ///this is jakarta bold text
  TextStyle get normal36Bold => customStyle(
      fontSize: 36,
      letterSpacing: 0.0,
      weight: FontWeight.bold,
      fontFamily: Constant.jakartaBold
  );



  /// Shortcut for color
  TextStyle textColor(Color v) => copyWith(color: v);

  /// Shortcut for fontWeight
  TextStyle weight(FontWeight v) => copyWith(fontWeight: v);

  /// Shortcut for fontSize
  TextStyle size(double v) => copyWith(fontSize: v);

  /// Shortcut for letterSpacing
  TextStyle letterSpace(double v) => copyWith(letterSpacing: v);

  TextStyle customStyle({
    required double letterSpacing,
    required double fontSize,
    required FontWeight weight,
    required String fontFamily,
  }) =>
      copyWith(
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          fontWeight: weight,
          fontFamily: fontFamily
      );


}
