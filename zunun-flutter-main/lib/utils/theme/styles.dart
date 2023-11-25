import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/dimension.dart';

TextStyle get headingStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: AppDimens.large.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.medium.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black));
}

TextStyle get tinyGreyStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.normal.sp,
          fontWeight: FontWeight.normal,
          color: Colors.grey));
}

TextStyle get tinyBlueStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.normal.sp,
          fontWeight: FontWeight.normal,
          color: Colors.blue));
}

TextStyle get veryTinyBlueStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.small.sp,
          fontWeight: FontWeight.normal,
          color: Colors.blue));
}

TextStyle get tinyStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.normal.sp,
          fontWeight: FontWeight.normal,
          color: Colors.black));
}

TextStyle get underlineTinyStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: AppDimens.normal.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    decoration: TextDecoration.underline,
  ));
}

TextStyle get underlineTinyYellowStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: AppDimens.normal.sp,
    fontWeight: FontWeight.normal,
    color: Colors.yellow.shade800,
    decoration: TextDecoration.underline,
  ));
}

TextStyle get tinyBoldStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.normal.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black));
}

TextStyle get veryTinyBoldStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.small.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black));
}

TextStyle get veryTinyStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.small.sp,
          fontWeight: FontWeight.normal,
          color: Colors.black));
}

TextStyle get veryTinyGreyStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.small.sp,
          fontWeight: FontWeight.normal,
          color: Colors.grey));
}

TextStyle get veryTinyWhiteStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.small.sp,
          fontWeight: FontWeight.normal,
          color: Colors.white));
}

TextStyle get veryTinyRedStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.small.sp,
          fontWeight: FontWeight.normal,
          color: Colors.red));
}

TextStyle get buttonStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: AppDimens.small.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white));
}
