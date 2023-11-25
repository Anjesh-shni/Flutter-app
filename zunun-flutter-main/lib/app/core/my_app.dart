import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/config/routes/app_pages.dart';
import 'package:zunun/features/presentation/assignment/controllers/assignment_controller.dart';
import 'package:zunun/features/presentation/login/controllers/login_controller.dart';
import 'package:zunun/localization/language_controller.dart';
import 'package:zunun/localization/message_translate.dart';
import 'package:zunun/utils/language_constant/language_constant.dart';

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetBuilder<AuthController>(builder: (_) {
        return GetBuilder<AssignmentController>(builder: (_) {
          return GetBuilder<LocalizationController>(
            builder: (controller) {
              return GetMaterialApp(
                title: "Zunun",
                debugShowCheckedModeBanner: false,
                locale: controller.locale,
                translations: Messages(languages: languages),
                fallbackLocale: Locale(
                  LanguageConstant.language[0].languageCode,
                  LanguageConstant.language[0].countryCode,
                ),
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
              );
            },
          );
        });
      });
    });
  }
}
