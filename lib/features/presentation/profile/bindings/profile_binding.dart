import 'package:get/get.dart';
import '../../login/controllers/login_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(authRepo: Get.find()),
    );
  }
}
