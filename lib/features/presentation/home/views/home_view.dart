import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zunun/app/reusable_widget/shrimmer_effect.dart';
import 'package:zunun/app/widgets/small_text.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/constants/strings.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/features/presentation/allBlogs/views/all_blogs_view.dart';
import 'package:zunun/app/widgets/container_blogs.dart';
import 'package:zunun/features/presentation/home/views/container_courses.dart';
import 'package:zunun/features/presentation/home/views/container_recently_viewed.dart';
import 'package:zunun/app/widgets/container_tile.dart';
import 'package:zunun/app/widgets/shimmer_home.dart';
import 'package:zunun/app/widgets/statusbar_profile.dart';
import '../../myCourse/views/my_course_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  var shimmerCheck = false.obs;
  HomeView({Key? key}) : super(key: key);

  @override
  var allCourseDetailss = Get.put(HomeController(courseListRepo: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Adaptive.h(AppDimens.statusBarHeight)),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
          child: ProfileStatusBar(),
        ),
      ),
      body: Obx(
        () => shimmerCheck.value
            ? const HomeShimmer()
            : Container(
                // color: AppColors.white,
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.dashboardTitle.tr,
                        style: tinyBoldStyle,
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.mediumSizedBox),
                      ),
                      SfCartesianChart(
                          // Initialize category axis
                          primaryXAxis: CategoryAxis(),
                          series: <LineSeries<SalesData, String>>[
                            LineSeries<SalesData, String>(
                                // Bind data source
                                dataSource: <SalesData>[
                                  SalesData('Jan', 35),
                                  SalesData('Feb', 20),
                                  SalesData('Mar', 34),
                                  SalesData('Apr', 7),
                                  SalesData('May', 40)
                                ],
                                xValueMapper: (SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (SalesData sales, _) =>
                                    sales.sales)
                          ]),
                      SizedBox(
                        height: Adaptive.h(AppDimens.smallSizedBox),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.coursesIn,
                            style: tinyBoldStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => MyCourseView());
                            },
                            child: Text(
                              AppStrings.seeAll,
                              style: tinyBlueStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.miniSizedBox),
                      ),
                      Obx(
                        () => allCourseDetailss.isAllCourseLoading.value
                            ? const ListTile(
                                leading: ShrimmerEffect.circular(
                                    height: 70, width: 70),
                                title: ShrimmerEffect.rectangular(height: 15),
                                subtitle:
                                    ShrimmerEffect.rectangular(height: 12),
                              )
                            : SizedBox(
                                height: Adaptive.h(
                                    AppDimens.homeCoursesContainerHeight),
                                child: ListView.builder(
                                    itemCount: allCourseDetailss
                                        .allCourseDetails.value.data?.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var allCourseData = allCourseDetailss
                                          .allCourseDetails.value.data?[index];

                                      return CoursesContainer(
                                        allCouseDAta: allCourseData,
                                      );
                                    }),
                              ),
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.smallSizedBox),
                      ),
                      Text(
                        AppStrings.recently,
                        style: tinyBoldStyle,
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.miniSizedBox),
                      ),
                      SizedBox(
                        height: Adaptive.h(
                            AppDimens.homeRecentlyViewedContainerHeight),
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return const RecentlyViewedContainer();
                            }),
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.smallSizedBox),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.announcement,
                            style: tinyBoldStyle,
                          ),
                          Text(
                            AppStrings.seeAll,
                            style: tinyBlueStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.smallSizedBox),
                      ),
                      Text(
                        "This Month",
                        style: tinyGreyStyle,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return const TileContainer(
                                image: AppIcons.playCircle,
                                title: "Flutter Mobile Apps",
                                subTitle: "Feb 14",
                                postIcon: AppIcons.rightArrow);
                          }),
                      SizedBox(
                        height: Adaptive.h(AppDimens.smallSizedBox),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.blogs,
                            style: tinyBoldStyle,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => const AllBlogsView(),
                                  transition: Transition.rightToLeft);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                AppStrings.seeAll,
                                style: tinyBlueStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.miniSizedBox),
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.homeBlogsContainerHeight),
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return const BlogsContainer();
                            }),
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.smallSizedBox),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
