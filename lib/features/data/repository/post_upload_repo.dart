// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/features/data/api/api_client.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';


class PostUpLoadRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  PostUpLoadRepo({required this.apiClient, required this.sharedPreferences});

  //Post comment method
  Future<Response> uploadAssign(String comment,String id) async {
    return await apiClient.postData(AppConstants.ADD_COMMENT+id, {
      "comment": comment,
    });
  }
}
