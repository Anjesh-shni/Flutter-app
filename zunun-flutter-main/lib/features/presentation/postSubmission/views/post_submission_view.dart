import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/reusable_widget/custom_loader.dart';
import 'package:zunun/app/reusable_widget/snack_bar.dart';
import 'package:zunun/app/widgets/button_large.dart';
import 'package:zunun/app/widgets/button_medium.dart';
import 'package:zunun/app/widgets/container_submission_status.dart';
import 'package:zunun/app/widgets/tile_assignment.dart';
import 'package:zunun/app/widgets/tile_comments.dart';
import 'package:zunun/config/extension/dateformater.dart';
import 'package:zunun/features/presentation/dashboard/views/dashboard_view.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

import '../../../../utils/constants/strings.dart';
import '../../uploadAssignment/controllers/assignment_details_control.dart';
import '../../uploadAssignment/controllers/submit_delete_assignment_controller.dart';
import '../../uploadAssignment/views/upload_assignment_view.dart';
import '../controllers/post_submission_controller.dart';

class PostSubmissionView extends GetView<PostSubmissionController> {
  var isCommentVisible = true.obs;
  PostSubmissionView({Key? key}) : super(key: key);

  var assignmentDetails =
      Get.put(AssignmentDetailsController(assignmenDEtailstRepo: Get.find()));
  var contr =
      Get.put(UploadAssignmentController(uploadAssignmentRepo: Get.find()));
  var addCommentt =
      Get.put(PostSubmissionController(postUpLoadRepo: Get.find()));

  String id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(
        "For Delete and Edit this ID++++++++++++++++++++++:::::::::::::::::::" +
            id);
    assignmentDetails.getAssignmentDEtailsInfo(id.toString());

    void _deleteEvent(UploadAssignmentController controller) {
      if (id.isEmpty) {
        CustomSnackBar("Title can't be empty", title: "Title");
      } else {
        controller.deleteAssignment(id).then((status) {
          if (status.isSuccess) {
            Get.back();
            Get.snackbar("Deleted", "Your assignment is successfully deleted");
          } else {
            CustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Adaptive.h(AppDimens.statusBarHeight)),
        child: const Padding(
          padding: EdgeInsets.only(top: 50.0, left: 16.0),
          child: AssignmentTile(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
        child: SingleChildScrollView(
          child: Obx(
            () => assignmentDetails.isLoadingAssignInfo.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Added date: ${convertUtcDateString(assignmentDetails.assignmentDEtailsData.value.data!.assignment!.openDate.toString())}",
                        style: veryTinyBoldStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
                      Text(
                        "Due date : ${convertUtcDateString(assignmentDetails.assignmentDEtailsData.value.data!.assignment!.dueDate.toString())}",
                        style: veryTinyBoldStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: AppColors.blue.shade300,
                            borderRadius: BorderRadius.circular(25),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(25),
                              onTap: () {
                                if (assignmentDetails.assignmentDEtailsData
                                        .value.data!.submissionStatus ==
                                    "SUBMITTED") {
                                  Get.to(
                                    arguments: assignmentDetails
                                        .assignmentDEtailsData.value.data!.id,
                                    () => UploadAssignmentView(),
                                  );
                                } else if (assignmentDetails
                                        .assignmentDEtailsData
                                        .value
                                        .data!
                                        .submissionStatus ==
                                    "GRADED") {
                                  Get.snackbar(
                                    "Status",
                                    "This assignment is already graded you cannot edit this.",
                                  );
                                }
                              },
                              child:
                                  const MediumButton(title: "Edit Submission"),
                            ),
                          ),
                          Material(
                            color: AppColors.blue.shade300,
                            borderRadius: BorderRadius.circular(25),
                            child: InkWell(
                                borderRadius: BorderRadius.circular(25),
                                onTap: () {
                                  if (assignmentDetails.assignmentDEtailsData
                                              .value.data!.submissionStatus ==
                                          "GRADED" ||
                                      assignmentDetails.assignmentDEtailsData
                                              .value.data!.submissionStatus ==
                                          "DUE") {
                                    CustomSnackBar(
                                        title: "Status",
                                        "This aassignment is already graded, you cannot deleted this.");
                                  } else {
                                    _deleteEvent(contr);
                                  }
                                },
                                child: Obx(
                                  () => contr.isLoadingOnDelete.value
                                      ? const MediumButton(
                                          title: "Remove Submission")
                                      : const CustomLoader(),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      Text(
                        AppStrings.submissionStatus,
                        style: tinyBoldStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      SubmissionStatusContainer(
                        title: AppStrings.submissionStatus,
                        subtitle: assignmentDetails
                            .assignmentDEtailsData.value.data!.submissionStatus
                            .toString(),
                        color: AppColors.green.shade100,
                      ),
                      SubmissionStatusContainer(
                        title: AppStrings.gradingStatus,
                        subtitle: assignmentDetails
                            .assignmentDEtailsData.value.data!.gradingStatus
                            .toString(),
                        color: AppColors.grey.shade200,
                      ),
                      SubmissionStatusContainer(
                        title: AppStrings.timeRemaining,
                        subtitle:
                            "${assignmentRemainingTime(assignmentDetails.assignmentDEtailsData.value.data!.assignment!.openDate.toString(), assignmentDetails.assignmentDEtailsData.value.data!.assignment!.dueDate.toString())} Days remaining",
                        color: AppColors.redAccent.shade100.withOpacity(0.4),
                      ),
                      SubmissionStatusContainer(
                        title: AppStrings.lastModified,
                        subtitle: convertUtcDateString(assignmentDetails
                            .assignmentDEtailsData.value.data!.updatedAt
                            .toString()),
                        color: AppColors.grey.shade200,
                      ),
                      SubmissionStatusContainer(
                        title: AppStrings.onlineText,
                        subtitle: assignmentDetails
                            .assignmentDEtailsData.value.data!.submissionText
                            .toString(),
                        color: AppColors.grey.shade200,
                      ),
                      SubmissionStatusContainer(
                        title: AppStrings.fileSubmission,
                        subtitle: "File name here",
                        color: AppColors.grey.shade200,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      Text(
                        AppStrings.submissionComments,
                        style: tinyBoldStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
                      Row(children: [
                        SvgPicture.asset(AppIcons.nextIcon),
                        InkWell(
                          onTap: () {
                            isCommentVisible.value = !isCommentVisible.value;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              // "Comments",
                              "Comments  ${assignmentDetails.assignmentDEtailsData.value.data!.comments ?? "0".length.toString()}",
                              style: underlineTinyStyle,
                            ),
                          ),
                        ),
                      ]),
                      Obx(
                        () => isCommentVisible.value
                            ? showComments()
                            : Container(),
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      Text(
                        AppStrings.feedback,
                        style: tinyBoldStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      SubmissionStatusContainer(
                        title: AppStrings.grade,
                        subtitle:
                            "${assignmentDetails.assignmentDEtailsData.value.data!.feedback!.gradePoint ?? 0.0.toDouble()}",
                        color: AppColors.grey.shade200,
                      ),
                      SubmissionStatusContainer(
                        title: AppStrings.gradedOn,
                        subtitle: assignmentDetails.assignmentDEtailsData.value
                                .data!.feedback!.gradedOn ??
                            "Not graded yet".toString(),
                        color: AppColors.grey.shade200,
                      ),
                      SubmissionStatusContainer(
                        title: AppStrings.gradedBy,
                        subtitle: assignmentDetails.assignmentDEtailsData.value
                                .data!.feedback!.gradedBy!.name ??
                            "".toString(),
                        color: AppColors.grey.shade200,
                      ),
                      SubmissionStatusContainer(
                        title: AppStrings.feedbackComments,
                        subtitle: assignmentDetails.assignmentDEtailsData.value
                                .data!.feedback!.feedback ??
                            "".toString(),
                        color: AppColors.grey.shade200,
                      ),
                      SizedBox(
                          height:
                              Adaptive.h(AppDimens.extraSuperLargeSizedBox)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  var addComment = TextEditingController();
  void _addComments(PostSubmissionController postSubmissionController) {
    String comment = addComment.text.trim();

    if (comment.isEmpty) {
      CustomSnackBar("No comment were added", title: "Status");
    } else {
      postSubmissionController.addCommemt(comment, id).then((status) {
        if (status.isSuccess) {
          Get.to(() => DashboardView(), transition: Transition.rightToLeft);
          Get.snackbar(
            "Status",
            "Assignment uploaded successfully",
            backgroundColor: Colors.green,
          );
        } else {
          CustomSnackBar("Not uploded", title: "Error");
        }
      });
    }
  }

  showComments() {
    return Obx(
      () => Column(
        children: [
          !assignmentDetails.isLoadingAssignInfo.value
              ? (assignmentDetails.assignmentDEtailsData.value.data?.comments !=
                      null)
                  ? ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 12),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: assignmentDetails
                          .assignmentDEtailsData.value.data!.comments!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final comment = assignmentDetails
                            .assignmentDEtailsData.value.data!.comments![index];
                        return CommentTile(
                          comment: comment,
                        );
                      },
                    )
                  : const Text("No comments available")
              : const CustomLoader(),
          SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
          Container(
            height: Adaptive.h(AppDimens.commentTextFieldHeight),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.black),
            ),
            child: TextField(
              controller: addComment,
              maxLines: 5, // Allow for multiple lines of input
              decoration: InputDecoration.collapsed(
                  hintText: "Add a comment...", hintStyle: tinyGreyStyle),
            ),
          ),
          SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
          Obx(
            () => Material(
              color: AppColors.blue.shade300,
              borderRadius: BorderRadius.circular(25),
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  _addComments(addCommentt);
                },
                child: addCommentt.isLoading.value
                    ? const LargeButton(title: "Comment")
                    : const Center(child: CustomLoader()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
