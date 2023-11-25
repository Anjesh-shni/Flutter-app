import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/app/widgets/tile_blogs_profile.dart';

class BlogCommentTile extends StatelessWidget {
  const BlogCommentTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlogProfileTile(),
        SizedBox(
          height: Adaptive.h(AppDimens.miniSizedBox),
        ),
        Text(
          "Rorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
          style: veryTinyStyle,
        ),
        Divider()
      ],
    );
  }
}
