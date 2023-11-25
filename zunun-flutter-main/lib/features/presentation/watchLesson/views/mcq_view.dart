import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class McqView extends StatelessWidget {
  const McqView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Question 1",
              style: tinyBoldStyle,
            ),
            Text(
              "[1/4]",
              style: tinyGreyStyle,
            )
          ],
        ),
        SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
        Text(
          "The wavelength of radiation emitted by a body depends upon",
          style: tinyStyle,
        ),
        SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
        Text(
          "Select an option",
          style: tinyGreyStyle,
        ),
      ],
    );
  }
}
