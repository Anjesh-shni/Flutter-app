import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class TileContainer extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String postIcon;
  const TileContainer({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.postIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: 
                SvgPicture.asset(image),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: veryTinyBoldStyle,
                  ),
                  SizedBox(
                    height: Adaptive.h(AppDimens.tinySizedBox),
                  ),
                  Text(
                    subTitle,
                    style: veryTinyGreyStyle,
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset(postIcon)
            ],
          ),
        ),
      ),
    );
  }
}
