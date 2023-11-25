import 'package:flutter/material.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

class BlogProfileTile extends StatelessWidget {
  const BlogProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(AppImages.profilePic),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rishek Pandey",
              style: tinyBoldStyle,
            ),
            Text(
              "Date",
              style: tinyGreyStyle,
            )
          ],
        ),
      ],
    );
  }
}
