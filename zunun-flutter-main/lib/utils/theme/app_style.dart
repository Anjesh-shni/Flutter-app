import 'package:flutter/material.dart';
import 'package:zunun/utils/constants/app_colors.dart';
import 'package:zunun/utils/constants/app_dimension.dart';
import 'package:zunun/utils/theme/text_style.dart';

///this file contains all the global decoration and styles configs for containers and widgets

class AppStyles {
  static InputDecoration inputDecoration(
    Widget? suffixIcon,
    String? hint, {
    Color? fillColor,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      suffixIconConstraints: const BoxConstraints(maxWidth: 40, maxHeight: 40),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      prefixIconConstraints: const BoxConstraints(maxWidth: 40, maxHeight: 40),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      fillColor: fillColor ?? AppColors.inputFieldColor,
      filled: true,
      hintText: hint,
      hintStyle: TextStyles.subtitleStyle.copyWith(color: AppColors.hintColor),
      labelStyle: TextStyles.titleStyle,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1, color: AppColors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.white.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
    );
  }

  static InputDecoration dropDownDecoration(
    Widget? suffixIcon,
    String? hint, {
    Color? fillColor,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      fillColor: fillColor ?? AppColors.inputFieldColor,
      filled: true,
      hintText: hint,
      hintStyle: TextStyles.subtitleStyle.copyWith(color: AppColors.hintColor),
      labelStyle: TextStyles.titleStyle,
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: AppColors.inputFieldColor, width: 1.0),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.white.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      border: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.white.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.red.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
    );
  }

  static BoxDecoration boxDecoration() {
    return BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
        color: AppColors.backgroundColorWhite,
        borderRadius: BorderRadius.circular(AppDimens.borderRadius));
  }
}
