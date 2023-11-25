import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class LargeButton extends StatelessWidget {
  final String title;
  const LargeButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Adaptive.h(AppDimens.buttonHeight),
      width: Adaptive.w(100),
      child: Text(
        title,
        style: buttonStyle,
      ),
    );
  }
}
