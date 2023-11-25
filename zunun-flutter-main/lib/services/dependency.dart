import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/features/data/repository/assignment_details_repo.dart';
import 'package:zunun/features/data/repository/assignment_list_repo.dart';
import 'package:zunun/features/data/repository/auth_repository.dart';
import 'package:zunun/features/data/repository/all_course_list_repository.dart';
import 'package:zunun/features/data/repository/create_event_repo.dart';
import 'package:zunun/features/data/repository/post_upload_repo.dart';
import 'package:zunun/features/data/repository/upload_assignment_repo.dart';
import 'package:zunun/features/domain/model/language_model/language_model.dart';
import 'package:zunun/features/presentation/assignment/controllers/assignment_controller.dart';
import 'package:zunun/features/presentation/create_event/controller/create_event_controller.dart';
import 'package:zunun/features/presentation/login/controllers/login_controller.dart';
import 'package:zunun/features/presentation/myCourse/controllers/my_course_controller.dart';
import 'package:zunun/features/presentation/postSubmission/controllers/post_submission_controller.dart';
import 'package:zunun/features/presentation/profile/controllers/profile_controller.dart';
import 'package:zunun/features/presentation/uploadAssignment/controllers/submit_delete_assignment_controller.dart';
import 'package:zunun/utils/language_constant/language_constant.dart';
import '../features/data/api/api_client.dart';
import '../features/presentation/uploadAssignment/controllers/assignment_details_control.dart';
import '../localization/language_controller.dart';
import '../utils/api_constants/api_constant.dart';

///Future type method to load data, it won't return anything
Future<void> init() async {
  ///Dependency loading essential function
  ///Do not alter any data of this class

  ///shredPrefrences
  final sharedPrefrences = await SharedPreferences.getInstance();

  ///local storage
  Get.lazyPut(() => sharedPrefrences);

  ///1st api clienet, most important dependency, it contains Base URL
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  ///For Authentication repo
  Get.lazyPut(() =>
      AuthRepository(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));

  //For getting user information
  Get.lazyPut(() => ProfileController());

  //For CourseList method and controller
  Get.lazyPut(() =>
      CourseListRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => MyCourseController(courseListRepo: Get.find()));

  //For Assignment method and controller
  Get.lazyPut(() =>
      AssignmentRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => AssignmentController(assignmentRepo: Get.find()));

  //Upload Assignment
  Get.lazyPut(() => UploadAssignmentRepo(
      apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut<UploadAssignmentController>(
      () => UploadAssignmentController(uploadAssignmentRepo: Get.find()));

  //POst upload
  Get.lazyPut(() =>
      PostUpLoadRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut<PostSubmissionController>(
      () => PostSubmissionController(postUpLoadRepo: Get.find()));

  //Assignment Details
  Get.lazyPut(() => AssignmrntDetailsRepo(
      apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut<AssignmentDetailsController>(
      () => AssignmentDetailsController(assignmenDEtailstRepo: Get.find()));

  Get.lazyPut(() =>
      CreateEventRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => CreateEventController(createEventRepo: Get.find()));

  
}

//Dependecy for localization
Future<Map<String, Map<String, String>>> initLang() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  //Retriving  localization Data
  Map<String, Map<String, String>> _language = Map();
  for (LanguageModel languageModel in LanguageConstant.language) {
    String jsonStringValue = await rootBundle
        .loadString("assets/language/${languageModel.languageCode}.json");
    Map<String, dynamic> _mappedJson = jsonDecode(jsonStringValue);
    Map<String, String> _json = Map();
    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _language['${languageModel.languageCode}_${languageModel.countryCode}'] =
        _json;
  }
  return _language;
}
