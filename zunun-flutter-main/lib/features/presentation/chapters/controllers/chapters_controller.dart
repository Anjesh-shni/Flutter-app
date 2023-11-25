import 'package:get/get.dart';
import '../../../data/repository/all_course_list_repository.dart';
import '../../myCourse/studentCourseModel/student_course_details.dart';

class ChaptersController extends GetxController {
  final CourseListRepo courseListRepo;
  ChaptersController({required this.courseListRepo});

  var isAllCourseLoading = true.obs;
  var studentCourseDetailss = StudentCourseDetails().obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getStudentCourseDetails(String courseID) async {
    Response response = await courseListRepo.getStudentCourseDetails(courseID);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(
          "STUDENT COURSE DETAILS:::::::::::::::::::::::${response.body}");

      StudentCourseDetails studentCourse =
          StudentCourseDetails.fromJson(response.body);
      studentCourseDetailss.value = StudentCourseDetails(
        success: studentCourse.success,
        data: studentCourse.data,
      );
      //this is more like setState
      isAllCourseLoading.value = false;
      update();
    } else {
      // isAllCourseLoading.value = true;
      print("Couldn't get student course details:::::::::" +
          response.statusText!.toString());
    }
  }
}
