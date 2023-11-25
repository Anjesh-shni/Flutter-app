import 'package:get/get.dart';
import 'package:zunun/app/reusable_widget/snack_bar.dart';
import 'package:zunun/features/data/repository/assignment_list_repo.dart';
import 'package:zunun/features/presentation/assignment/model/assignment_model.dart';

import '../../login/views/login_view.dart';

class AssignmentController extends GetxController {
  final AssignmentRepo assignmentRepo;

  AssignmentController({required this.assignmentRepo});

  var isLoading = true.obs;
  var assignmentData = AssignmentModel2().obs;

  @override
  onInit() {
    print(
        "This OnInit method is being called from AssignmentController:::::::");
    super.onInit();
    assignmentData.refresh();
  }

  @override
  onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      print(
          "This is OnReady method is being called from AssignmentController:::::::");
      getAssignmentInfo();
      assignmentData.refresh();
    });
  }

  //Getting assignmentData
  Future<void> getAssignmentInfo() async {
    Response response = await assignmentRepo.getAssignmentInfo();
    if (response.statusCode == 401 || response.statusCode == 403) {
      assignmentRepo.getTokenExpired();
      Get.offAll(() => LoginView());
      CustomSnackBar("Please login again", title: "Session expired");
    }
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("ASSIGNMENT RESPONSE 1st::::LIST TO DO::::::" +
          response.body.toString());

      AssignmentModel2 assignmentModel2 =
          AssignmentModel2.fromJson(response.body);
      assignmentData.value = AssignmentModel2(
        data: assignmentModel2.data,
        success: assignmentModel2.success,
      );
      isLoading.value = false;
      update();
    } else {
      print("COULDN'T GET ASSIGNMENT RESPONSE::::::::::::::::::::::::");
    }
  }

  //Due
  Future<void> getDueAssignmentInfo(String status) async {
    Response response = await assignmentRepo.getDueAssignmentInfo(status);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "ASSIGNMENT RESPONSE 2nd ::::DUE:::::::" + response.body.toString());

      AssignmentModel2 assignmentModel2 =
          AssignmentModel2.fromJson(response.body);
      assignmentData.value = AssignmentModel2(
        data: assignmentModel2.data,
        success: assignmentModel2.success,
      );
      isLoading.value = false;
      update();
    } else {
      print("COULDN'T GET ASSIGNMENT RESPONSE FOR DUE INFORMATION::::::::::::");
    }
  }

  //Submitted
  Future<void> getSubmittedAssignmentInfo(String status) async {
    Response response = await assignmentRepo.getSubmittedAssignmentInfo(status);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("ASSIGNMENT RESPONSE 3rd:::::::SUBMITTED:::::::" +
          response.body.toString());

      AssignmentModel2 assignmentModel2 =
          AssignmentModel2.fromJson(response.body);
      assignmentData.value = AssignmentModel2(
        data: assignmentModel2.data,
        success: assignmentModel2.success,
      );
      isLoading.value = false;
      update();
    } else {
      print(
          "COULDN'T GET ASSIGNMENT RESPONSE FOR SUBMITTED INFORMATION:::::::::::::::");
    }
  }

  //Graded
  Future<void> getGradedAssignmentInfo(String status) async {
    Response response = await assignmentRepo.getGradedAssignmentInfo(status);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("ASSIGNMENT RESPONSE 4rth:::::::GRADED:::::::" +
          response.body.toString());

      AssignmentModel2 assignmentModel2 =
          AssignmentModel2.fromJson(response.body);
      assignmentData.value = AssignmentModel2(
        data: assignmentModel2.data,
        success: assignmentModel2.success,
      );
      isLoading.value = false;
      update();
    } else {
      print(
          "COULDN'T GET ASSIGNMENT RESPONSE FOR GRADED INFORMATION::::::::::");
    }
  }
}
