import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/constants/strings.dart';
import 'package:zunun/features/presentation/login/views/login_view.dart';
import 'package:zunun/features/presentation/onboardingscreen/views/onboarding_slider.dart';
import 'package:zunun/app/widgets/button_large.dart';

import '../controllers/onboardingscreen_controller.dart';

class OnboardingscreenView extends GetView<OnboardingscreenController> {
  List<String> onBoardingImages = [
    AppImages.onBoarding1,
    AppImages.onBoarding2,
  ];
  List<String> onBoardingHeadings = [
    AppStrings.ob1heading,
    AppStrings.ob2heading,
  ];
  var currentIndex = 0.obs;

  OnboardingscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: AppColors.white,
          padding: const EdgeInsets.fromLTRB(16, 70, 16, 30),
          // Column created
          child: Column(children: [
            Expanded(
              // PageView Builder
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    currentIndex.value = value;
                  },
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    // Contents of Slider that we
                    // created in Modal Class
                    return OnBoardingSlider(
                      image: onBoardingImages[index],
                      heading: onBoardingHeadings[index],
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => buildDot(index, context),
              ),
            ),
            SizedBox(
              height: Adaptive.h(AppDimens.smallSizedBox),
            ),
            Material(
              color: AppColors.blue.shade400,
              borderRadius: BorderRadius.circular(40),
              child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    Get.offAll(() => LoginView(),
                        transition: Transition.rightToLeft);
                  },
                  child: LargeButton(title: "Get Started")),
            )
          ])),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    // Another Container returned
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 6,
        width: currentIndex.value == index ? 25 : 6,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color:
              currentIndex.value == index ? Colors.blue : Colors.grey.shade400,
        ),
      ),
    );
  }
}
