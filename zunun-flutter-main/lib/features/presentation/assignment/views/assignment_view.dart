import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/reusable_widget/shrimmer_effect.dart';
import 'package:zunun/app/widgets/small_text.dart';
import 'package:zunun/features/presentation/postSubmission/views/post_submission_view.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/constants/strings.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/features/presentation/uploadAssignment/views/upload_assignment_view.dart';
import 'package:zunun/app/widgets/container_tile.dart';
import 'package:zunun/app/widgets/container_time_tab.dart';
import '../../postSubmission/controllers/post_submission_controller.dart';
import '../../uploadAssignment/controllers/submit_delete_assignment_controller.dart';
import '../controllers/assignment_controller.dart';

class AssignmentView extends GetView<AssignmentController> {
  //Tab
  List<String> timeTabItems = ["All", "Due", "Submitted", "Graded"];
  var timeTabCurrent = 0.obs;
  var selectedFilter = "ALL".obs;

  AssignmentView({Key? key}) : super(key: key);

  @override
  var assignmentData =
      Get.put(AssignmentController(assignmentRepo: Get.find()));
  var contr =
      Get.put(UploadAssignmentController(uploadAssignmentRepo: Get.find()));
  var addCommentt =
      Get.put(PostSubmissionController(postUpLoadRepo: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text header
            Text(
              AppStrings.assignment,
              style: subHeadingStyle,
            ),
            SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
            //Assignment tab
            SizedBox(
              height: Adaptive.h(AppDimens.timeTabHeight),
              child: ListView.builder(
                itemCount: timeTabItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        selectedFilter.value = "ALL";
                        assignmentData.getAssignmentInfo();
                      } else if (index == 1) {
                        selectedFilter.value = "DUE";
                        assignmentData.getDueAssignmentInfo("status=due");
                      } else if (index == 2) {
                        selectedFilter.value = "SUBMITTED";
                        assignmentData
                            .getSubmittedAssignmentInfo("status=submitted");
                      } else {
                        selectedFilter.value = "GRADED";
                        assignmentData.getGradedAssignmentInfo("status=graded");
                      }

                      timeTabCurrent.value = index;
                    },
                    child: Obx(
                      () => TimeTabContainer(
                        title: timeTabItems[index],
                        tapIndex: timeTabCurrent.value,
                        index: index,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Assignment Information",
                  style: veryTinyRedStyle,
                ),
                Text(
                  AppStrings.addSubmission,
                  style: veryTinyGreyStyle,
                )
              ],
            ),

            Obx(
              () => assignmentData.isLoading.value
                  ? SizedBox(
                      height: 900,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ListTile(
                            leading:
                                ShrimmerEffect.circular(height: 60, width: 60),
                            title: ShrimmerEffect.rectangular(height: 18),
                            subtitle: ShrimmerEffect.rectangular(height: 12),
                          );
                        },
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          assignmentData.assignmentData.value.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        if (assignmentData.assignmentData.value.data == null) {
                          return Center(
                            child: SmallTxt(
                              text: "No Data Found",
                              color: Colors.red,
                              size: 18,
                            ),
                          );
                        }
                        var assignmentList =
                            assignmentData.assignmentData.value.data![index];

                        if (selectedFilter.value ==
                            assignmentList.submissionStatus) {
                          return GestureDetector(
                            onTap: () {
                              if (assignmentList.submissionStatus == "DUE") {
                                Get.to(
                                  () => UploadAssignmentView(),
                                  arguments: assignmentList.id,
                                  transition: Transition.fade,
                                );
                              } else if (assignmentList.submissionStatus ==
                                  "GRADED") {
                                Get.to(
                                  arguments: assignmentList.id,
                                  () => PostSubmissionView(),
                                );
                              } else if (assignmentList.submissionStatus ==
                                  "SUBMITTED") {
                                Get.to(
                                  arguments: assignmentList.id,
                                  () => PostSubmissionView(),
                                );
                              }
                            },
                            child: TileContainer(
                              image: AppIcons.assignmentIcon,
                              title: assignmentList.title.toString(),
                              subTitle:
                                  "Status: ${assignmentList.submissionStatus.toString()}",
                              postIcon: assignmentList.submissionStatus ==
                                      "SUBMITTED"
                                  ? AppIcons.editIcon
                                  : assignmentList.submissionStatus == "GRADED"
                                      ? "Graded"
                                      : AppIcons.uploadIcon,
                            ),
                          );
                        } else if (selectedFilter.value == "ALL") {
                          return GestureDetector(
                            onTap: () {
                              if (assignmentList.submissionStatus == "DUE") {
                                Get.to(
                                  () => UploadAssignmentView(),
                                  arguments: assignmentList.id,
                                  transition: Transition.fade,
                                );
                              } else if (assignmentList.submissionStatus ==
                                  "GRADED") {
                                Get.to(
                                  arguments: assignmentList.id,
                                  () => PostSubmissionView(),
                                );
                              } else if (assignmentList.submissionStatus ==
                                  "SUBMITTED") {
                                Get.to(
                                  arguments: assignmentList.id,
                                  () => PostSubmissionView(),
                                );
                              }
                            },
                            child: TileContainer(
                              image: AppIcons.assignmentIcon,
                              title: assignmentList.title.toString(),
                              subTitle:
                                  "Status: ${assignmentList.submissionStatus.toString()}",
                              postIcon: assignmentList.submissionStatus ==
                                      "SUBMITTED"
                                  ? AppIcons.editIcon
                                  : assignmentList.submissionStatus == "GRADED"
                                      ? "Graded"
                                      : AppIcons.uploadIcon,
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
            ),
            //: const CustomLoader(),
            // ),
            // SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
            // Text(
            //   "Upcoming",
            //   style: veryTinyBoldStyle,
            // ),
            // SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
            // Text(
            //   "This Month",
            //   style: veryTinyGreyStyle,
            // ),
            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: 2,
            //     itemBuilder: (BuildContext context, int index) {
            //       return const TileContainer(
            //           image: AppIcons.assignmentIcon,
            //           title: "Zunun Assignment",
            //           subTitle: "Course name",
            //           postIcon: AppIcons.uploadIcon);
            //     }),
            // SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
            // Text(
            //   "July",
            //   style: veryTinyGreyStyle,
            // ),
            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: 2,
            //     itemBuilder: (BuildContext context, int index) {
            //       return const TileContainer(
            //           image: AppIcons.assignmentIcon,
            //           title: "Zunun Assignment",
            //           subTitle: "Course name",
            //           postIcon: AppIcons.uploadIcon);
            //     }),
            // SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
            // Text(
            //   "August",
            //   style: veryTinyGreyStyle,
            // ),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: 2,
            //   itemBuilder: (BuildContext context, int index) {
            //     return const TileContainer(
            //         image: AppIcons.assignmentIcon,
            //         title: "Zunun Assignment",
            //         subTitle: "Course name",
            //         postIcon: AppIcons.uploadIcon);
            //   },
            // ),
          ],
        ),
      )),
    );
  }
}
