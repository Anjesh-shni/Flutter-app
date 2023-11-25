import 'package:flutter/material.dart';
import 'package:zunun/utils/constants/app_colors.dart';

///this file holds all the available text themes

class TextStyles {
  static TextStyle get headingStyle {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary);
  }

  static TextStyle get titleStyle {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.textColor);
  }

  static TextStyle get subtitleStyle {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor);
  }

  static TextStyle get smallTextStyle {
    return const TextStyle(
        fontSize: 14, color: AppColors.textColor, fontWeight: FontWeight.w400);
  }
}
