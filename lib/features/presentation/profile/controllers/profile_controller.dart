import 'package:get/get.dart';

class ProfileController extends GetxController {
  

  @override
  void onInit(){
    super.onInit();
  }

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;
  // late LoginModel _userModel;
  // LoginModel get userModel => _userModel;

  // Future<ResponseModel> getUserInfo() async {
  //   Response response = await userRepo.getUserInfo();
  //   print("user responsw==== ${response.body.toString()}}");
  //   late ResponseModel responseModel;

  //   if (response.statusCode == 200) {
  //     print("${response.body}");
  //     final json = jsonDecode(response.body);
  //     _userModel = LoginModel.fromJson(json);
  //     print("My Data *************..........************" +
  //         _userModel.data!.user!.firstName.toString());
  //     _isLoading = true;
  //     responseModel = ResponseModel(true, "successfully");
  //   } else {
  //     responseModel = ResponseModel(false, response.statusText!);
  //   }
  //   update();
  //   return responseModel;
  // }
}
