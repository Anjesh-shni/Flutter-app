import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class BlogsTileContainer extends StatelessWidget {
  const BlogsTileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Image.asset(
                  'assets/images/d.png',
                  height: 70,
                  width: 70,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: tinyBoldStyle,
                  ),
                  SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
                  SizedBox(
                    width: Adaptive.w(56),
                    child: Text(
                      "Morem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate  Nunc vulputate...",
                      style: veryTinyGreyStyle,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
