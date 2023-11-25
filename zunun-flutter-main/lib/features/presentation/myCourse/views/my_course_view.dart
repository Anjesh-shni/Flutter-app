import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/reusable_widget/shrimmer_effect.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/constants/strings.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/features/presentation/chapters/views/chapters_view.dart';
import 'package:zunun/features/presentation/myCourse/views/container_my_courses.dart';
import 'package:zunun/app/widgets/container_time_tab.dart';
import '../../../../app/widgets/small_text.dart';
import '../controllers/my_course_controller.dart';

class MyCourseView extends GetView<MyCourseController> {
  List<String> timeTabItems = ["Ongoing", "Completed", "Grades"];
  var timeTabCurrent = 0.obs;

  var studentCourse = Get.put(MyCourseController(courseListRepo: Get.find()));

  MyCourseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  AppStrings.myCourses,
                  style: subHeadingStyle,
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.searchIcon),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SvgPicture.asset(AppIcons.moreIcon),
                )
              ],
            ),
            SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
            SizedBox(
                height: Adaptive.h(AppDimens.timeTabHeight),
                child: ListView.builder(
                    itemCount: timeTabItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                          onTap: () {
                            timeTabCurrent.value = index;
                          },
                          child: Obx(
                            () => TimeTabContainer(
                              title: timeTabItems[index],
                              tapIndex: timeTabCurrent.value,
                              index: index,
                            ),
                          ));
                    })),
            Expanded(
              child: Obx(
                () => studentCourse.isAllCourseLoading.value
                    ? const ListTile(
                        leading: ShrimmerEffect.circular(height: 70, width: 70),
                        title: ShrimmerEffect.rectangular(height: 18),
                        subtitle: ShrimmerEffect.rectangular(height: 13),
                      )
                    : ListView.builder(
                        itemCount:
                            studentCourse.allCourseDetails.value.data?.length ??
                                0,
                        itemBuilder: (ctx, index) {
                          if (studentCourse.allCourseDetails.value.data ==
                              null) {
                            return Center(
                              child: SmallTxt(
                                text: "No Data Found",
                                color: Colors.red,
                                size: 18,
                              ),
                            );
                          }
                          var allCourrseDAta =
                              studentCourse.allCourseDetails.value.data![index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                arguments: [
                                  allCourrseDAta.id,
                                  allCourrseDAta.name,
                                ],
                                () => ChaptersView(),
                                transition: Transition.fade,
                              );
                            },
                            child: MyCoursesContainer(
                              allCouseDAta: allCourrseDAta,
                            ),
                          );
                        }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
