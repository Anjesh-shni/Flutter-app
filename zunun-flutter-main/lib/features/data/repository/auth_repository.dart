import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zunun/features/data/api/api_client.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';

class AuthRepository {
  ///This class will be responsible for method call
  ///Like get, post
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
   final localStorage = GetStorage();

  AuthRepository({required this.apiClient, required this.sharedPreferences});

  ///Login method
  Future<Response> login(String identity, String password) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URI, {"identity": identity, "password": password});
  }

  //Logout
  Future<Response> logOut(bool success) async {
    return await apiClient.postData(AppConstants.LOGOUT, {"success": success});
  }

  //Create Access token
  Future<Response> createAccess(String refresh) async {
     var json_body = {
      "access": localStorage.read('access_token'),
      "refresh": localStorage.read('refresh_token')
    };
    return await apiClient
        .postData(AppConstants.CREATE_ACCESS, json_body);
  }

  ///User token saving in local storage
  Future<bool> saveUserToken(String token) async {
    print("TOKEN FROM AUTH REPOSITORY::::::::::::::::::::::::::" + token);
    apiClient.token = token;
    // apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  ///User Refresh token saving in local storage
  Future<bool> saveRefreshToken(String token) async {
    apiClient.token = token;
    // apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.REFRES_TOKEN, token);
  }

  ///Getting user token
  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  ///Getting refresh token
  Future<String> getRefreshToken() async {
    return sharedPreferences.getString(AppConstants.REFRES_TOKEN) ?? "";
  }

  //Check user logged_in or not
  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  ///Saving user credentials
  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.EMAIL, email);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      rethrow;
    }
  }

  ///Clear user data after Logout
  bool clearUserData() {
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.EMAIL);
    sharedPreferences.remove(AppConstants.PASSWORD);
    apiClient.token = "";
    apiClient.updateHeader("");
    return true;
  }
}
