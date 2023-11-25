import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/widgets/small_text.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/features/presentation/watchLesson/views/consult_teacher_view.dart';
import 'package:zunun/features/presentation/watchLesson/views/mcq_view.dart';
import 'package:zunun/features/presentation/watchLesson/views/notes_view.dart';
import 'package:zunun/app/widgets/container_time_tab.dart';
import 'package:zunun/app/widgets/tile_lesson.dart';
import '../controllers/watch_lesson_controller.dart';
import 'package:zunun/app/reusable_widget/shrimmer_effect.dart';

class WatchLessonView extends GetView<WatchLessonController> {
  var lessonTabCurrent = 0.obs;
  var chapterType = 0.obs;
  var isDoneMark = true.obs;
  var isPLayAndPause = true.obs;
  final player = AudioPlayer();
  List<String> lessonItems = ["Up Next", "Add Notes", "Consult a teacher"];

  WatchLessonView({Key? key}) : super(key: key);

  String courseContentID = Get.arguments[0];
  String name = Get.arguments[1];
  var studentCourseContent =
      Get.put(WatchLessonController(courseListRepo: Get.find()));

  @override
  Widget build(BuildContext context) {
    studentCourseContent.getStudentContentsDetails(courseContentID.toString());

    return Material(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: SingleChildScrollView(
          child: Obx(
            () => studentCourseContent.contentIsLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SvgPicture.asset(AppIcons.backArrow),
                            ),
                          ),
                          Text(
                            "$name",
                            style: tinyBoldStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),
                      Obx(() {
                        if (studentCourseContent.studentContentDetails.value
                                .data!.contentType ==
                            "VIDEO") {
                          return !studentCourseContent.contentIsLoading.value
                              ? showVideo()
                              : const CircularProgressIndicator();
                        } else if (studentCourseContent.studentContentDetails
                                .value.data!.contentType ==
                            "AUDIO") {
                          return !studentCourseContent.contentIsLoading.value
                              ? showAudio()
                              : const CircularProgressIndicator();
                        } else if (studentCourseContent.studentContentDetails
                                .value.data!.contentType ==
                            "BOOK") {
                          return !studentCourseContent.contentIsLoading.value
                              ? showBookPDF()
                              : const CircularProgressIndicator();
                        }else if(studentCourseContent.studentContentDetails
                                .value.data!.contentType ==
                            "QUESTIONNAIRE"){
                           return !studentCourseContent.contentIsLoading.value
                              ?  const McqView()
                              : const CircularProgressIndicator();
                        }
                        else {
                          return const McqView();
                        }
                      }),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      SizedBox(
                          height: Adaptive.h(AppDimens.timeTabHeight),
                          child: ListView.builder(
                              itemCount: lessonItems.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                    onTap: () {
                                      lessonTabCurrent.value = index;
                                    },
                                    child: Obx(
                                      () => TimeTabContainer(
                                        title: lessonItems[index],
                                        tapIndex: lessonTabCurrent.value,
                                        index: index,
                                      ),
                                    ));
                              })),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      Obx(() {
                        if (lessonTabCurrent.value == 0) {
                          return showLessonList();
                        } else if (lessonTabCurrent.value == 1) {
                          return NotesView();
                        } else {
                          return ConsultTeacherView();
                        }
                      })
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget showLessonList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Section 1-Introduction",
          style: veryTinyGreyStyle,
        ),
        SizedBox(
          height: Adaptive.h(44),
          child: Obx(
            () => studentCourseContent.contentIsLoading.value
                ? const ListTile(
                    leading: ShrimmerEffect.circular(height: 40, width: 40),
                    title: ShrimmerEffect.rectangular(height: 18),
                    trailing: ShrimmerEffect.circular(height: 30, width: 30),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: studentCourseContent
                        .studentContentDetails.value.data!.keywords!.length,
                    itemBuilder: (ctx, index) {
                      var keywordList = studentCourseContent
                          .studentContentDetails.value.data!.keywords![index];
                      return GestureDetector(
                          onTap: () {
                            //Need to redirect somewhere
                          },
                          child: LessonTile(
                              icon: AppIcons.lessonIcon1,
                              title: "${keywordList}",
                              postIcon: AppIcons.nextIcon));
                    }),
          ),
        )
      ],
    );
  }

  showVideo() {
    studentCourseContent.playVideo(studentCourseContent
        .studentContentDetails.value.data!.file!.url
        .toString());
    return Obx(
      () => studentCourseContent.contentIsLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Adaptive.h(22),
                  child: Chewie(
                    controller: controller.chewieController,
                  ),
                ),
                SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${studentCourseContent.studentContentDetails.value.data!.title}",
                      style: tinyBoldStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isDoneMark.value == true) {
                          studentCourseContent.markAsCompleted(
                            studentCourseContent
                                .studentContentDetails.value.data!.id
                                .toString(),
                          );
                        } else {
                          isDoneMark.value = false;
                        }
                        isDoneMark.value = !isDoneMark.value;
                      },
                      child: Container(
                        height: 50,
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isDoneMark.value ? Colors.green : Colors.red,
                        ),
                        child: Center(
                            child: isDoneMark.value
                                ? SmallTxt(
                                    text: "Mark as completed",
                                  )
                                : SmallTxt(text: "Undo")),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
                Text(
                  "${studentCourseContent.studentContentDetails.value.data!.description}",
                  style: tinyGreyStyle,
                ),
              ],
            ),
    );
  }

  showAudio() {
    return Obx(
      () => studentCourseContent.contentIsLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : SizedBox(
              height: Adaptive.h(22),
              child: Center(
                child: IconButton(
                  onPressed: () async {
                    if (isPLayAndPause.value == true) {
                      studentCourseContent.plauAudio(
                        studentCourseContent
                            .studentContentDetails.value.data!.file!.url
                            .toString(),
                      );
                    } else {
                      studentCourseContent.pauseAudio();
                      isPLayAndPause.value = false;
                    }
                    isPLayAndPause.value = !isPLayAndPause.value;
                  },
                  icon: Center(
                    child: isPLayAndPause.value
                        ? const Icon(Icons.play_arrow)
                        : const Icon(Icons.pause),
                  ),
                ),
              ),
            ),
    );
  }

  showBookPDF() {
    return Obx(
      () => studentCourseContent.contentIsLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : SizedBox(
              height: Adaptive.h(30),
              child: Center(
                child: IconButton(
                  onPressed: () async {
                    if (isPLayAndPause.value == true) {
                    } else {}
                    isPLayAndPause.value = !isPLayAndPause.value;
                  },
                  icon: Center(
                    child: isPLayAndPause.value
                        ? const Icon(Icons.play_arrow)
                        : const Icon(Icons.pause),
                  ),
                ),
              ),
            ),
    );
  }
}
