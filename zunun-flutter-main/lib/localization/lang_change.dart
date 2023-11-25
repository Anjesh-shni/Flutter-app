import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zunun/localization/language_controller.dart';
import 'package:zunun/utils/language_constant/language_constant.dart';

import 'lang_widget.dart';

class LangChange extends StatefulWidget {
  final bool fromMenuPage;
  const LangChange({
    super.key,
    this.fromMenuPage = false,
  });

  @override
  State<LangChange> createState() => _LangChangeState();
}

class _LangChangeState extends State<LangChange> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (controller) {
      double? width = 375;
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<LocalizationController>(
              builder: (localizationController) {
            return Column(children: [
              Expanded(
                  child: Center(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(5),
                    child: Center(
                        child: SizedBox(
                      width: width,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                                child: Image.asset("img/logo part 1.png",
                                    width: 120)),
                            const SizedBox(height: 5),
                            Center(
                                child: Image.asset("img/logo part 2.png",
                                    width: 140)),
                            const SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'select_language'.tr,
                              ),
                            ),
                            const SizedBox(height: 10),
                            GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1,
                                ),
                                itemCount:
                                    2, //localizationController.languages.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => LanguageWidget(
                                      languageModel: localizationController
                                          .language[index],
                                      localizationController:
                                          localizationController,
                                      index: index,
                                    )),
                            const SizedBox(height: 10),
                            Text(
                              'you_can_change_language'.tr,
                            ),
                          ]),
                    )),
                  ),
                ),
              )),
              ElevatedButton(
                child: Text('save'.tr),
                onPressed: () {
                  if (localizationController.language.isNotEmpty &&
                      localizationController.selectedInex != -1) {
                    localizationController.setLanguage(Locale(
                      LanguageConstant
                          .language[localizationController.selectedInex]
                          .languageCode,
                      LanguageConstant
                          .language[localizationController.selectedInex]
                          .countryCode,
                    ));
                    // if (fromMenuPage) {
                    //   Navigator.pop(context);
                    // } else {
                    //   Get.offNamed(RouteHelper.getdashboard());
                    // }
                  } else {
                    Get.snackbar(
                        'select_a_language'.tr, 'select_a_language'.tr);
                  }
                },
              ),
            ]);
          }),
        ),
      );
    });
  }
}
