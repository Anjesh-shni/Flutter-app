import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/features/presentation/notification/views/notification_view.dart';
import 'package:zunun/features/presentation/showSearch/views/show_search_view.dart';

import '../../utils/constants/strings.dart';

class ProfileStatusBar extends StatelessWidget {
  final localStorage = GetStorage();
  ProfileStatusBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 4.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(AppImages.profilePic),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localStorage.read(AppConstants.firstName) ?? "",
              style: tinyBoldStyle,
            ),
            Text(
              AppStrings.gm,
              style: tinyGreyStyle,
            )
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Get.to(() => const ShowSearchView(), transition: Transition.fade);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.searchIcon),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(() => const NotificationView(), transition: Transition.fade);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.bellIcon),
          ),
        )
      ],
    );
  }
}
