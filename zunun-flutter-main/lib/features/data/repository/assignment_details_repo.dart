import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/features/data/api/api_client.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';

class AssignmrntDetailsRepo extends GetxService {
  //When you load data from internet Always extends class with getxService, it work nice to load data
  //This class will talk to the API Client
  final SharedPreferences sharedPreferences;
  //API client and Repo always connected and from here we can call method that live in API CLIENT
  final ApiClient apiClient;
  AssignmrntDetailsRepo({required this.apiClient, required this.sharedPreferences});

  //Empty method and it would send me response from server
  //this response eventually pass to the controller
  Future<Response> getAssignmentDEtailsInfo(String id) async {
    //here calling get request to get DETAILS list
    return await apiClient.getData(AppConstants.ASSIGNMENT_DETAILS+id);
  }
}

