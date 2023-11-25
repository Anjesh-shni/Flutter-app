import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/features/data/api/api_client.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';

class AssignmentRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AssignmentRepo({required this.sharedPreferences, required this.apiClient});

  ///This method is responsible for getting assignment information
  Future<Response> getAssignmentInfo() async {
    return await apiClient.getData(AppConstants.LIST_BY_STUDENT);
  }
  
   Future<Response> getSubmittedAssignmentInfo(String status) async {
    return await apiClient.getData("${AppConstants.LIST_BY_STUDENT}?$status");
  }
   Future<Response> getGradedAssignmentInfo(String status) async {
    return await apiClient.getData("${AppConstants.LIST_BY_STUDENT}?$status");
  }
   Future<Response> getDueAssignmentInfo(String status) async {
    return await apiClient.getData("${AppConstants.LIST_BY_STUDENT}?$status");
  }

  Future<void> getTokenExpired() async {
    return await apiClient.refreshTokenss();
  }
}
