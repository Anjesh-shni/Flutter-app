import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class LessonTile extends StatelessWidget {
  final String icon;
  final String title;
  final String postIcon;
  const LessonTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.postIcon})
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
                padding: const EdgeInsets.only(right: 12.0),
                child: SvgPicture.asset(
                  icon,
                  height: AppDimens.iconHeight,
                  width: AppDimens.iconWidth,
                ),
              ),
              Text(
                title,
                style: veryTinyBoldStyle,
              ),
              Spacer(),
              SvgPicture.asset(postIcon),
            ],
          ),
        ),
      ),
    );
  }
}
