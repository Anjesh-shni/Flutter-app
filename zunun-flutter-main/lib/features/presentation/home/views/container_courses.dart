import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/features/presentation/home/models/all_course_model.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class CoursesContainer extends StatelessWidget {
  final Data? allCouseDAta;
  const CoursesContainer({Key? key, this.allCouseDAta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //StudentCourse loading
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: Adaptive.w(AppDimens.homeCoursesContainerWidth),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/events_demo.png"),
                  CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 6.0,
                      percent: 0.75,
                      center: Text(
                        "75%",
                        style: veryTinyBoldStyle,
                      ),
                      backgroundColor: Colors.grey.shade300,
                      progressColor: AppColors.redAccent),
                ],
              ),
              SizedBox(
                height: Adaptive.h(AppDimens.miniSizedBox),
              ),
              Text(
                allCouseDAta?.name ?? "Data Not Found",
                style: veryTinyBoldStyle,
              ),
              SizedBox(
                height: Adaptive.h(AppDimens.tinySizedBox),
              ),
              Text(
                "2 hrs 25 mins",
                style: veryTinyGreyStyle,
              )
            ]),
      ),
    );
  }
}
