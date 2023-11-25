import 'package:flutter/material.dart';
import 'package:zunun/utils/theme/app_style.dart';
import 'package:zunun/utils/theme/text_style.dart';

class PasswordField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final bool? enabled;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hint;
  final Color? fillColor;
  final bool? obscureText;
  final bool? autoFocus;
  final FocusNode? focusNode;
  final Function(String)? onChangedCallback;
  final String? Function(String?)? validator; // Updated validator type

  const PasswordField({
    Key? key,
    this.title,
    this.controller,
    this.enabled,
    this.suffixIcon,
    this.prefixIcon,
    this.hint,
    this.fillColor,
    this.obscureText,
    this.autoFocus,
    this.focusNode,
    this.onChangedCallback,
    this.initialValue,
    this.validator, // Updated constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title ?? "",
            style: TextStyles.titleStyle,
          ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          focusNode: focusNode,
          controller: controller,
          enabled: enabled,
          autofocus: autoFocus ?? false,
          obscureText: obscureText ?? false,
          style: TextStyles.subtitleStyle.copyWith(color: Colors.black87),
          initialValue: initialValue,
          keyboardType: TextInputType.visiblePassword,
          decoration: AppStyles.inputDecoration(suffixIcon, hint,
              fillColor: fillColor, prefixIcon: prefixIcon),
          validator: validator,
          // Updated validator assignment
          onChanged: (newValue) {
            onChangedCallback?.call(newValue);
          },
        )
      ],
    );
  }
}
