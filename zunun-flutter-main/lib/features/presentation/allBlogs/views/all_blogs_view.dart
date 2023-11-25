import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/features/presentation/blogDetail/views/blog_detail_view.dart';
import 'package:zunun/app/widgets/container_blogs_tile.dart';
import 'package:zunun/app/widgets/tile_blog.dart';
import '../controllers/all_blogs_controller.dart';

class AllBlogsView extends GetView<AllBlogsController> {
  const AllBlogsView({Key? key}) : super(key: key);
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
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const BlogDetailView(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  child: const BlogsTileContainer());
            }),
      ),
    );
  }
}
