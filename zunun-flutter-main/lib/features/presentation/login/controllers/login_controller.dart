import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zunun/app/reusable_widget/my_snackbar.dart';
import 'package:zunun/features/data/repository/auth_repository.dart';
import 'package:zunun/features/presentation/login/views/login_view.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';
import '../../../domain/model/response_model/response_model.dart';
import '../model/create_access_model.dart';
import '../model/login_model.dart';
import '../model/logout_model.dart';

class AuthController extends GetxController {
  final AuthRepository authRepo;
  final localStorage = GetStorage();

  AuthController({required this.authRepo});

  @override
  void onInit() async {
    super.onInit();
  }

  ///Normal variable
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  //obs var
  var authIsLoading = false.obs;

  var alluserData = LoginModel().obs;
  var logoutStatus = LogOutModel().obs;
  var createAccessFromRefress = CreateAccessModel().obs;

  ///Login
  Future<ResponseModel> loginMethod(String identity, String password) async {
    authIsLoading.value = true;
    update();

    /// The Http [Request] linked with this [Response].
    Response response = await authRepo.login(identity, password);
    if (response.statusCode == 401 || response.statusCode == 403) {
      createAccessFromRefres(localStorage.read("refresh_token"));
      Get.offAll(LoginView(), transition: Transition.fade);
    }

    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      log("Succesfully loggedIn::::::::::::::::User Data:::::${response.body}");
      //Saving access token here
      authRepo.saveUserToken(response.body["data"]['access']);
      //Adding all info to model
      LoginModel userInfo = LoginModel.fromJson(response.body);
      alluserData.value = LoginModel(
        success: userInfo.success,
        data: userInfo.data!,
      );
      //User info set into storage
      localStorageData();
      responseModel = ResponseModel(true, response.body["data"]['access']);
    } else {
      //Error text from getX model itself i,e= statusText
      responseModel = ResponseModel(false, response.statusText!);
    }
    authIsLoading.value = false;
    update();
    return responseModel;
  }

  //Local database storage
  void localStorageData() {
    localStorage.write("isLoggedIn", true);
    localStorage.write(AppConstants.TOKEN, alluserData.value.data!.access);
    localStorage.write("refresh_token", alluserData.value.data!.refresh);
    //
    localStorage.write(AppConstants.id, alluserData.value.data!.user!.id);
    localStorage.write(
        AppConstants.firstName, alluserData.value.data!.user!.firstName);
    localStorage.write("surname", alluserData.value.data!.user!.surname);
    localStorage.write(AppConstants.email, alluserData.value.data!.user!.email);
    localStorage.write(
        AppConstants.username, alluserData.value.data!.user!.username);
    localStorage.write(
        AppConstants.homePhone, alluserData.value.data!.user!.homePhone);
    localStorage.write(
        AppConstants.cellular, alluserData.value.data!.user!.cellular);
    localStorage.write(AppConstants.dob, alluserData.value.data!.user!.dob);
    localStorage.write(
        AppConstants.birthplace, alluserData.value.data!.user!.birthplace);
  }

  ///Logout
  Future<ResponseModel> logout(bool success) async {
    authIsLoading.value = true;
    _isLoading = true;
    update();
    Response response = await authRepo.logOut(success);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("LOGGING OUT:::::::::::::::::" + response.body.toString());

      LogOutModel logoutUserStatus = LogOutModel.fromJson(response.body);
      logoutStatus.value = LogOutModel(success: logoutUserStatus.success);
      localStorage.remove(AppConstants.TOKEN);
      //Adding data to variable
      responseModel = ResponseModel(true, response.body.toString());
      Get.snackbar("Log out", "Succesfully logout");
    } else {
      //Error text from getX model itself i,e= statusText
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    authIsLoading.value = false;
    update();
    return responseModel;
  }

  ///Create Access
  Future<void> createAccessFromRefres(String refresh) async {
    authIsLoading.value = true;
    update();
    Response response = await authRepo.createAccess(refresh);
    late ResponseModel responseModel;
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("CREATING ACCESS:::::::::::::::::" + response.body.toString());

      //Adding data to variable
      CreateAccessModel createAccessfromModel =
          CreateAccessModel.fromJson(response.body);
      createAccessFromRefress.value = CreateAccessModel(
        success: createAccessfromModel.success,
        data: createAccessfromModel.data,
      );

      localStorage.write(AppConstants.TOKEN, alluserData.value.data!.access);
      localStorage.write("refresh_token", alluserData.value.data!.refresh);

      responseModel = ResponseModel(true, response.body.toString());
    } else {
      //Error text from getX model itself i,e= statusText
      responseModel = ResponseModel(false, response.statusText!);
      Get.offAll(LoginView(), transition: Transition.fade);
      cuastomSnackBAr(title: "Token Expire", "Please login again");
    }
    authIsLoading.value = false;
    update();
  }
}
