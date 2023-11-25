import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zunun/utils/constants/dimension.dart';
import '../controllers/splashscreen_controller.dart';

class SplashScreen extends GetView<SplashscreenController> {
  @override
  final controller = Get.put(SplashscreenController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset(AppImages.appLogo)],
        ),
      ),
    );
  }
}
