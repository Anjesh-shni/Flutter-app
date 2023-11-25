import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class EditProfileContainer extends StatelessWidget {
  const EditProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Adaptive.w(38),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(AppIcons.editIcon),
            ),
            Text(
              "Edit Profile",
              style: tinyBoldStyle,
            ),
          ],
        ),
      ),
    );
  }
}
