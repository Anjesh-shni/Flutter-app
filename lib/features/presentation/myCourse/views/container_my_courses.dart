import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zunun/features/presentation/home/models/all_course_model.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/theme/styles.dart';

class MyCoursesContainer extends StatelessWidget {
  final Data allCouseDAta;
  const MyCoursesContainer({Key? key, required this.allCouseDAta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Image.asset('assets/images/events_demo.png'),
              ),
              Text(
                "${allCouseDAta.name}",
                style: veryTinyBoldStyle,
              ),
              const Spacer(),
              CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 6.0,
                  percent: 0.75,
                  center: Text(
                    "75%",
                    style: veryTinyBoldStyle,
                  ),
                  backgroundColor: Colors.grey.shade300,
                  progressColor: AppColors.lightYellow)
            ],
          ),
        ),
      ),
    );
  }
}
