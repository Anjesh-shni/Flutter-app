import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/reusable_widget/shrimmer_effect.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/features/presentation/watchLesson/views/watch_lesson_view.dart';
import '../controllers/chapters_controller.dart';

// ignore: must_be_immutable
class ChaptersView extends GetView<ChaptersController> {
  var dropdown = false.obs;
  var lessonList = [].obs;

  ChaptersView({
    Key? key,
  }) : super(key: key);

  String id = Get.arguments[0];
  String name = Get.arguments[1];

  var studentCourse = Get.put(ChaptersController(courseListRepo: Get.find()));

  @override
  Widget build(BuildContext context) {
    print("STUDENT COURSE ID::::::::::::::::::::::::" + id.toString());
    studentCourse.getStudentCourseDetails(id.toString());
    return Material(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(AppIcons.backArrow)),
                Obx(
                  () => studentCourse.isAllCourseLoading.value
                      ? const CircularProgressIndicator()
                      : Text(
                          "${name.toString()}",
                          style: tinyBoldStyle,
                        ),
                ),
                SvgPicture.asset(AppIcons.moreIcon)
              ],
            ),
            SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),
            Obx(
              () => Row(
                children: [
                  Text(
                    
                        "Introduction",
                    style: veryTinyGreyStyle,
                  ),
                  IconButton(
                    onPressed: () {
                      dropdown.value = !dropdown.value;
                    },
                    icon: !dropdown.value
                        ? const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          )
                        : const Icon(
                            Icons.arrow_right,
                            color: Colors.blue,
                          ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => studentCourse.isAllCourseLoading.value
                    ? const ListTile(
                        leading: ShrimmerEffect.circular(height: 40, width: 40),
                        title: ShrimmerEffect.rectangular(height: 18),
                        trailing:
                            ShrimmerEffect.circular(height: 30, width: 30),
                      )
                    : ListView.builder(
                        itemCount: studentCourse
                            .studentCourseDetailss.value.data!.lesson!.length,
                        itemBuilder: (ctx, index) {
                          //
                          var studentCourseDetail = studentCourse
                              .studentCourseDetailss.value.data!.lesson![index];

                          // var contentId = studentCourseDetail.content![index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                arguments: [
                                  studentCourseDetail.content![index].id,
                                  studentCourseDetail.name,
                                ],
                                () => WatchLessonView(),
                                transition: Transition.rightToLeft,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 16.0, 8.0, 16.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.blue.shade400
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20)),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Text(
                                              "${index+1}",
                                              style: veryTinyBlueStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${studentCourseDetail.name}",
                                        style: veryTinyBoldStyle,
                                      ),
                                      const Spacer(),
                                      SvgPicture.asset(
                                        AppIcons.playCircle,
                                        height: AppDimens.iconHeight,
                                        width: AppDimens.iconWidth,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
