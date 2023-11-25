import 'package:get/get.dart';
import 'package:zunun/features/data/repository/assignment_details_repo.dart';
import '../assignmentModel/assignment_model.dart';

class AssignmentDetailsController extends GetxController {
  final AssignmrntDetailsRepo assignmenDEtailstRepo;
  AssignmentDetailsController({required this.assignmenDEtailstRepo});

  var isLoadingAssignInfo = true.obs;
  var assignmentDEtailsData = AssignmentDetails().obs;

  @override
  onInit() {
    print("On init called ::::::: ASSIGNMENT DETAILS");
    super.onInit();
  }

  //Getting assignmentData
  Future<void> getAssignmentDEtailsInfo(String id) async {
    Response response =
        await assignmenDEtailstRepo.getAssignmentDEtailsInfo(id);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Assignment DETAILS  response with their specific id:::::::" +
          response.body.toString());

      AssignmentDetails assignmentDEtails =
          AssignmentDetails.fromJson(response.body);

      assignmentDEtailsData.value = AssignmentDetails(
          data: assignmentDEtails.data!, success: assignmentDEtails.success);
          
      isLoadingAssignInfo.value = false;
    } else {
          print("Assignment DETAILS FROME ELSE PART" +
          response.statusText!.toString());
    }
  }
}
