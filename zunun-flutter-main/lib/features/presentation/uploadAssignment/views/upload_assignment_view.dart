import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/reusable_widget/custom_loader.dart';
import 'package:zunun/app/reusable_widget/snack_bar.dart';
import 'package:zunun/app/widgets/button_large.dart';
import 'package:zunun/config/extension/dateformater.dart';
import 'package:zunun/features/presentation/assignment/views/assignment_view.dart';
import 'package:zunun/features/presentation/postSubmission/controllers/post_submission_controller.dart';
import 'package:zunun/features/presentation/postSubmission/views/post_submission_view.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/constants/strings.dart';
import 'package:zunun/utils/theme/styles.dart';

import '../controllers/assignment_details_control.dart';
import '../controllers/submit_delete_assignment_controller.dart';

class UploadAssignmentView extends GetView<UploadAssignmentController> {
  UploadAssignmentView({Key? key}) : super(key: key);

  var assignmentDetails =
      Get.put(AssignmentDetailsController(assignmenDEtailstRepo: Get.find()));
  var uploadController =
      Get.put(UploadAssignmentController(uploadAssignmentRepo: Get.find()));
  var commmet = Get.put(PostSubmissionController(postUpLoadRepo: Get.find()));

  String id = Get.arguments;
  var assignMentComment = TextEditingController();
  var filess = Get.find<UploadAssignmentController>().filesUpload;

  @override
  Widget build(BuildContext context) {
    print(
        "DUE ASSIGNMNET ID+++++++++++++++++++::::::::::::::::" + id.toString());
    assignmentDetails.getAssignmentDEtailsInfo(id.toString());

    //Upload Assignment method
    void _uploadAssignment(UploadAssignmentController uploadController) {
      String submissinText = assignMentComment.text.trim();
      if (submissinText.isEmpty) {
        CustomSnackBar("No Submission text were added", title: "Status");
      } else {
        uploadController
            .submitAssignment(
          submissinText,
          filess,
          id,
        )
            .then((status) {
          if (status.isSuccess) {
            Get.to(
              () => PostSubmissionView(),
              arguments: id,
              transition: Transition.rightToLeft,
            );
            Get.snackbar(
              "Status",
              "Assignment uploaded successfully",
            );
          } else {
            CustomSnackBar("Error", title: status.message);
          }
        });
      }
    }

    void _deleteAssignment(UploadAssignmentController uploadController) {
      if (id.isEmpty) {
        CustomSnackBar("Assignment id does not found", title: "Status");
      } else {
        uploadController.deleteAssignment(id).then((status) {
          if (status.isSuccess) {
            Get.to(
              () => AssignmentView(),
              transition: Transition.rightToLeft,
            );
            Get.snackbar(
              "Deleted",
              "Assignment deleted successfully",
              backgroundColor: Colors.green,
            );
          } else {
            CustomSnackBar("Error", title: status.message);
          }
        });
      }
    }

    return Obx(
      () => !assignmentDetails.isLoadingAssignInfo.value
          ? Scaffold(
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(Adaptive.h(AppDimens.statusBarHeight)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 16.0),
                  child: Row(
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
                        "${assignmentDetails.assignmentDEtailsData.value.data!.assignment!.title.toString()}",
                        style: tinyBoldStyle,
                      ),
                    ],
                  ),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //convertUtcDateString
                        "Added date : ${convertUtcDateString(assignmentDetails.assignmentDEtailsData.value.data!.assignment!.openDate.toString())}",
                        style: veryTinyBoldStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
                      Text(
                        "Due date : ${convertUtcDateString(assignmentDetails.assignmentDEtailsData.value.data!.assignment!.dueDate.toString())}",
                        style: veryTinyBoldStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),
                      Text(
                        AppStrings.assignmentDes,
                        style: tinyBoldStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
                      Text(
                        "${assignmentDetails.assignmentDEtailsData.value.data!.assignment!.description.toString()}",
                        style: veryTinyGreyStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),
                      Text(
                        AppStrings.addSubmission,
                        style: tinyBoldStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
                      Text(
                        AppStrings.onlineText,
                        style: tinyStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      Container(
                        height: Adaptive.h(AppDimens.notesTextFieldHeight),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: TextField(
                          controller: assignMentComment,
                          maxLines: 5, // Allow for multiple lines of input
                          decoration: InputDecoration.collapsed(
                              hintText: "Write here", hintStyle: tinyGreyStyle),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
                      Text(
                        AppStrings.fileSubmission,
                        style: tinyStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      GestureDetector(
                        onTap: () async {
                          //File pick and upload method will used herer
                          File? pickedImage = await _pickImage();
                          if (pickedImage != null) {
                            final allowedExtensions = [
                              'jpg',
                              'jpeg',
                              'png',
                              "pdf",
                              "word",
                              "excel"
                            ];
                            final fileExtension =
                                pickedImage.path.split('.').last.toLowerCase();
                            if (allowedExtensions.contains(fileExtension)) {
                              await controller.uploadFile(pickedImage);
                            } else {
                              CustomSnackBar(
                                "Invalid or unsupported file format selected.",
                              );
                            }
                          }
                        },
                        child: DottedBorder(
                          color: AppColors.grey,
                          dashPattern: [8, 4],
                          strokeWidth: 1,
                          child: Obx(
                            () => Container(
                              alignment: Alignment.center,
                              height:
                                  Adaptive.h(AppDimens.uploadContainerHeight),
                              width: double.infinity,
                              child: controller.isFileLoading.value
                                  ? const CustomLoader()
                                  : Container(
                                      height: 200,
                                      child: controller.uploadedFile.value !=
                                              null
                                          ? _renderFile(
                                              controller.uploadedFile.value!)
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  AppIcons.uploadFileIcon,
                                                ),
                                                SizedBox(
                                                    height: Adaptive.h(AppDimens
                                                        .miniSizedBox)),
                                                Text(
                                                  AppIcons.clickHere,
                                                  style: veryTinyGreyStyle,
                                                )
                                              ],
                                            ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.smallSizedBox)),
                      Material(
                        color: AppColors.blue.shade300,
                        borderRadius: BorderRadius.circular(25),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {
                              _uploadAssignment(uploadController);
                            },
                            child: const LargeButton(title: "Save Changes")),
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),
                    ],
                  ),
                ),
              ),
            )
          : const CustomLoader(),
    );
  }

  Future<File?> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null && result.files.isNotEmpty) {
      return File(result.files.single.path.toString());
    } else {
      return null;
    }
  }

  Widget _renderFile(File file) {
    final fileExtension = file.path.split('.').last.toLowerCase();
    if (fileExtension == 'pdf') {
      return PDFView(filePath: file.path);
    } else {
      return Image(
        image: NetworkImage(
          file.path,
        ),
      );
    }
  }
}
