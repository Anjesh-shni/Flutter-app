import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

import '../studentCourseModel/student_course_details.dart';

class ChapterTile extends StatelessWidget {
  final Content studentCourseDetail;
  const ChapterTile({Key? key, required this.studentCourseDetail})
      : super(key: key);

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
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.blue.shade400.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "01",
                      style: veryTinyBlueStyle,
                    ),
                  ),
                ),
              ),
              Text(
                "${studentCourseDetail.name}",
                style: veryTinyBoldStyle,
              ),
              const Spacer(),
              SvgPicture.asset(
                AppIcons.playCircle,
                height: AppDimens.iconHeight,
                width: AppDimens.iconWidth,
              )
            ],
          ),
        ),
      ),
    );
  }
}
