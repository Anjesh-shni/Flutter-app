import 'package:get/get.dart';
import 'package:zunun/features/presentation/uploadAssignment/controllers/assignment_details_control.dart';
import 'package:zunun/features/presentation/uploadAssignment/controllers/submit_delete_assignment_controller.dart';

import '../controllers/post_submission_controller.dart';

class PostSubmissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostSubmissionController>(
      () => PostSubmissionController(postUpLoadRepo: Get.find()),
    );
    Get.lazyPut<AssignmentDetailsController>(
      () => AssignmentDetailsController(assignmenDEtailstRepo: Get.find()),
    );
    Get.lazyPut<UploadAssignmentController>(
      () => UploadAssignmentController(uploadAssignmentRepo: Get.find()),
    );
  }
}
