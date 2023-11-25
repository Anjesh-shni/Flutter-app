import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zunun/utils/constants/dimension.dart';
import '../../utils/theme/styles.dart';

class AssignmentTile extends StatelessWidget {
  const AssignmentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset(AppIcons.backArrow),
          ),
        ),
        Text(
          "Assignment",
          style: tinyBoldStyle,
        ),
      ],
    );
  }
}
