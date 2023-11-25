import 'package:get/get.dart';

import '../../../data/repository/all_course_list_repository.dart';
import '../models/all_course_model.dart';

class HomeController extends GetxController {
  //Repo instance to call method that live in COURSE_LIST_REPOSITORY
  final CourseListRepo courseListRepo;
  HomeController({required this.courseListRepo});

  @override
  onInit() {
    getAllCourseList();
    super.onInit();
  }

  var isAllCourseLoading = true.obs;
  var allCourseDetails = AllCourseDetails().obs;

  //
  Future<void> getAllCourseList() async {
    //from here we call repository getCourseList method
    //This response is coming from api Client
    Response response = await courseListRepo.getAllCourseList();

    //if response success
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "SUCCESFULLY GOT ALL COURSE LIST FROM HOME:::::::::::::::::::::::${response.body}");

      AllCourseDetails allCourseDetailsModel =
          AllCourseDetails.fromJson(response.body);
      allCourseDetails.value = AllCourseDetails(
        success: allCourseDetailsModel.success,
        data: allCourseDetailsModel.data,
      );
      //this is more like setState
      isAllCourseLoading.value = false;
      update();
    } else {
      isAllCourseLoading.value = true;
    }
  }
}
