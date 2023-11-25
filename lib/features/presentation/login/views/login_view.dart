import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/reusable_widget/custom_loader.dart';
import 'package:zunun/app/widgets/button_large.dart';
import 'package:zunun/app/reusable_widget/snack_bar.dart';
import 'package:zunun/features/presentation/dashboard/views/dashboard_view.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/constants/strings.dart';
import 'package:zunun/utils/theme/styles.dart';
import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<AuthController> {
  @override
  final controller = Get.put(AuthController(authRepo: Get.find()));
  //Obx variable
  var checkboxValue = false.obs;
  var hidePassword = false.obs;

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    //Method
    void login(AuthController controller) {
      String identity = emailController.text.trim();
      String password = passwordController.text.trim();
      if (identity.isEmpty) {
        CustomSnackBar("Type in your email", title: "Email");
      } else if (!GetUtils.isEmail(identity)) {
        CustomSnackBar("Type valid email address", title: "Invalid Email");
      } else if (password.isEmpty) {
        CustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        CustomSnackBar("password cannot be less than 6-character",
            title: "Password");
      } else {
        controller.loginMethod(identity, password).then(
          (status) {
            if (status.isSuccess) {
              Get.offAll(() => DashboardView());
              CustomSnackBar(title: "Status", "Logged in succesfully");
            } else {
              CustomSnackBar(title: "Something went wrong", status.message);
            }
          },
        );
      }
    }

    return Material(
        child: !controller.authIsLoading.value
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 70, 16, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SvgPicture.asset(AppIcons.backArrow),
                      SizedBox(
                        height: Adaptive.h(AppDimens.midSizedBox),
                      ),
                      Text(
                        AppStrings.loginTitle,
                        style: subHeadingStyle,
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),

                      ///
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: AppColors.blue.shade900),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fillColor: AppColors.white,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: AppColors.grey,
                          ),
                          labelText: "Email",
                          labelStyle: tinyGreyStyle,
                        ),
                      ),

                      SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),

                      Obx(
                        () => SizedBox(
                          child: TextField(
                            controller: passwordController,
                            obscureText: !hidePassword.value,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: AppColors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: AppColors.blue.shade900),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              fillColor: AppColors.white,
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: AppColors.grey,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  hidePassword.value = !hidePassword.value;
                                },
                                child: Icon(
                                  hidePassword.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 20,
                                ),
                              ),
                              suffixIconColor: AppColors.grey,
                              labelText: "Password",
                              labelStyle: tinyGreyStyle,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: Adaptive.h(AppDimens.largeSizedBox),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: checkboxValue.value,
                                  activeColor: AppColors.blue.shade300,
                                  onChanged: (bool? value) {
                                    checkboxValue.value = value!;
                                    //We will remember user
                                  },
                                ),
                              ),
                              Text(
                                AppStrings.remember,
                                style: tinyStyle,
                              )
                            ],
                          ),
                          Text(
                            AppStrings.forgotPW,
                            style: tinyBlueStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),

                      Obx(
                        () => Material(
                          color: AppColors.blue.shade400,
                          borderRadius: BorderRadius.circular(40),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(40),
                            onTap: () {
                              login(controller);
                            },
                            child: controller.authIsLoading.value == false
                                ? const LargeButton(title: "Sign In")
                                : const CustomLoader(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.small),
                      ),
                      Center(
                        child: Text(
                          AppStrings.orContinue,
                          style: tinyStyle,
                        ),
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.mediumSizedBox),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            AppIcons.fbIcon,
                            height: AppDimens.iconHeight,
                            width: AppDimens.iconWidth,
                          ),
                          Image.asset(
                            AppIcons.googleIcon,
                            height: AppDimens.iconHeight,
                            width: AppDimens.iconWidth,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Adaptive.h(AppDimens.midSizedBox),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.dntHaveAccount, style: tinyGreyStyle),
                          Text(AppStrings.signUp, style: tinyBlueStyle),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : const CustomLoader());
  }
}
