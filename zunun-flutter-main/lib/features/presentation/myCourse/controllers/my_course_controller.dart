import 'package:get/get.dart';
import 'package:zunun/app/reusable_widget/snack_bar.dart';
import '../../../data/repository/all_course_list_repository.dart';
import '../../home/models/all_course_model.dart';

class MyCourseController extends GetxController {
  //Repo instance to call method that live in COURSE_LIST_REPOSITORY
  final CourseListRepo courseListRepo;
  MyCourseController({required this.courseListRepo});

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
    Response response = await courseListRepo.getAllCourseList();
    //if response success
    if (response.statusCode == 200 || response.statusCode == 201) {
     try{
           print("ALL COURSE LIST:::::::::::::::::::::::${response.body}");

        AllCourseDetails allCourseDetailsModel =
            AllCourseDetails.fromJson(response.body);
        allCourseDetails.value = AllCourseDetails(
          success: allCourseDetailsModel.success,
          data: allCourseDetailsModel.data,
        );
        //this is more like setState
        isAllCourseLoading.value = false;
        update();
     }catch(e){
      CustomSnackBar("${e.toString()}");
     }
    } else {
      // isAllCourseLoading.value = true;
       print("ALL COURSE LIST:::::::::::::::::::::::${response.statusText!}");
    }
  }


}
