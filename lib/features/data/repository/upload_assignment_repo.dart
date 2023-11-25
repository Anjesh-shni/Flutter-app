import 'dart:io';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/features/data/api/api_client.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';

import '../../presentation/uploadAssignment/model/submit_assign_model.dart';

class UploadAssignmentRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  UploadAssignmentRepo(
      {required this.sharedPreferences, required this.apiClient});

  //Upload Assignment
  Future<Response> uploadAssignment(
    String submissionText,
    AssignmentFiles files,
    String id,
  ) async {
    return await apiClient.postData(AppConstants.UPLOAD_ASSIGNMENT + id, {
      "submissionText": submissionText,
      "assignmentFiles": [files]
    });
  }

  // //Edit Assignment
  // Future<Response> updateAssignment(String submissionText, String id) async {
  //   return await apiClient.updateData(AppConstants.UPDATE_ASSIGNMENT + id, {
  //     "submissionText": submissionText,
  //   });
  // }

  //Delete Assignment
  Future<Response> deleteAssignment(String id) async {
    return await apiClient.deleteData(
      AppConstants.DELETE_ASSIGNMENT + id,
    );
  }

  //Upload Assignment file, like pdf, img
  Future<Response> uploadFile(File pdfFile) async {
    return apiClient.postData(AppConstants.UPLOAD_FILE, {"file": pdfFile});
  }
}
