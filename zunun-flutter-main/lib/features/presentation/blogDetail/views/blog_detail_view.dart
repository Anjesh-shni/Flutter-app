import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/constants/strings.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/app/widgets/tile_blog.dart';
import 'package:zunun/app/widgets/tile_blog_comments.dart';
import 'package:zunun/app/widgets/tile_blogs_profile.dart';
import '../controllers/blog_detail_controller.dart';

class BlogDetailView extends GetView<BlogDetailController> {
  const BlogDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Adaptive.h(AppDimens.statusBarHeight)),
          child: const Padding(
            padding: EdgeInsets.only(
              top: 50.0,
              left: 16.0,
            ),
            child: BlogTile(),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Future of designs and AI",
                  style: tinyBoldStyle,
                ),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                Image.asset('assets/images/demo_blog.png'),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                const BlogProfileTile(),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                Text(
                  "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",
                  style: veryTinyGreyStyle,
                ),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                Image.asset('assets/images/demo_blog.png'),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                Text(
                  "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.",
                  style: veryTinyGreyStyle,
                ),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                Text(
                  AppStrings.tags,
                  style: tinyBoldStyle,
                ),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                Text(
                  "#blog #students #students",
                  style: veryTinyGreyStyle,
                ),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                Text(
                  "Comments",
                  style: tinyBoldStyle,
                ),
                SizedBox(
                  height: Adaptive.h(AppDimens.smallSizedBox),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return const BlogCommentTile();
                    })
              ],
            ),
          ),
        ));
  }
}
