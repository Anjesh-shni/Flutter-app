import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class BlogsContainer extends StatelessWidget {
  const BlogsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: Adaptive.w(AppDimens.homeBlogsContainerWidth),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/blogs_demo.png"),
            SizedBox(
              height: Adaptive.h(AppDimens.tinySizedBox),
            ),
            Text(
              "Title",
              style: veryTinyBoldStyle,
            ),
            SizedBox(
              height: Adaptive.h(AppDimens.tinySizedBox),
            ),
            Text(
              "Morem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate  Nunc vulputate...",
              style: veryTinyGreyStyle,
            ),
          ],
        ),
      ),
    );
  }
}
