import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/features/data/api/api_client.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';

class CourseListRepo extends GetxService {
  //When you load data from internet Always extends class with getxService, it work nice to load data
  //This class will talk to the API Client
  final SharedPreferences sharedPreferences;
  //API client and Repo always connected and from here we can call method that live in API CLIENT
  final ApiClient apiClient;
  CourseListRepo({required this.apiClient, required this.sharedPreferences});

  //Student course list
  Future<Response> getAllCourseList() async {
    //here it calling get request to get course list
    return await apiClient.getData(AppConstants.ALL_COURSE_LIST);
  }

  //Student course details
  Future<Response> getStudentCourseDetails(String courseID) async {
    return await apiClient
        .getData(AppConstants.STUDENT_COURSE_DETAILS + courseID);
  }

  //Student course--content details
  Future<Response> getStudentContentsDetails(String courseContentID) async {
    return await apiClient
        .getData(AppConstants.STUDENT_CONTENT_DETAILS + courseContentID);
  }

  //Indicator
  Future<Response> markAsCompleted(String contentID,) async {
    return await apiClient.updateData(
      AppConstants.MARKED_AS_A_COMPLETE,
      {"contentID": contentID,},
    );
  }
}
