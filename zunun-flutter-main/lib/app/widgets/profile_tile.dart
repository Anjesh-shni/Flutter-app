import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class ProfileTile extends StatelessWidget {
  final String icon;
  final String title;
  final String postIcon;
  const ProfileTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.postIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
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
            const Spacer(),
            SvgPicture.asset(postIcon)
          ],
        ),
        const Divider(
          height: 30,
        )
      ],
    );
  }
}
