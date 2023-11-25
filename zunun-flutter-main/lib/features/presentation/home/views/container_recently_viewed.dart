import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class RecentlyViewedContainer extends StatelessWidget {
  const RecentlyViewedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        width: Adaptive.w(AppDimens.homeRecentlyViewedContainerWidth),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.playCircle),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Active Figma Course",
                  style: veryTinyBoldStyle,
                ),
                SizedBox(
                  height: Adaptive.h(AppDimens.tinySizedBox),
                ),
                Text(
                  "2 hrs 25 mins",
                  style: veryTinyBoldStyle,
                ),
                SizedBox(
                  height: Adaptive.h(AppDimens.tinySizedBox),
                ),
                LinearPercentIndicator(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  alignment: MainAxisAlignment.start,
                  width: 130.0,
                  lineHeight: 8.0,
                  percent: 0.75,
                  backgroundColor: AppColors.grey.shade200,
                  barRadius: Radius.circular(10),
                  progressColor: AppColors.blue.shade300,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
