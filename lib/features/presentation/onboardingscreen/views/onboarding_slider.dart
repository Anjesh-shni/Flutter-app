import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class OnBoardingSlider extends StatelessWidget {
  final String image;
  final String heading;

  const OnBoardingSlider({
    Key? key,
    required this.image,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        // SvgPicture.asset(
        //   'assets/images/check2.svg',
        //   height: 50,
        //   width: 50,
        // ),
        SizedBox(
          height: Adaptive.h(AppDimens.smallSizedBox),
        ),
        Text(
          heading,
          style: subHeadingStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
