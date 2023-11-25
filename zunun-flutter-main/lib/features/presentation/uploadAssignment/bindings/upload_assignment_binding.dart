import 'package:get/get.dart';

import '../controllers/assignment_details_control.dart';
import '../controllers/submit_delete_assignment_controller.dart';

class UploadAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadAssignmentController>(
      () => UploadAssignmentController(uploadAssignmentRepo: Get.find()),
    );
    Get.lazyPut<AssignmentDetailsController>(
      () => AssignmentDetailsController(assignmenDEtailstRepo: Get.find()),
    );
  }
}
