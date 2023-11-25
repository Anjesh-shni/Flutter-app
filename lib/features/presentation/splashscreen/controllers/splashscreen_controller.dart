import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zunun/features/presentation/dashboard/views/dashboard_view.dart';
import '../../login/views/login_view.dart';

class SplashscreenController extends GetxController {
  final localStorage = GetStorage();

  @override
  void onInit() {
    waitCheckAndGo();
    super.onInit();
  }

  void waitCheckAndGo() async {
    await Future.delayed(const Duration(seconds: 2));
    log("LOGGED IN TOKEN:::::::::::::::::::::${localStorage.read("token")}");
    if (localStorage.read("isLoggedIn") == true) {
      Get.offAll(() => DashboardView(), transition: Transition.topLevel);
    } else {
      Get.offAll(() => LoginView(), transition: Transition.topLevel);
    }
  }
}
