import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/reusable_widget/custom_loader.dart';
import 'package:zunun/app/reusable_widget/my_snackbar.dart';
import 'package:zunun/features/presentation/login/controllers/login_controller.dart';
import 'package:zunun/features/presentation/login/views/login_view.dart';
import 'package:zunun/utils/api_constants/api_constant.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/app/widgets/container_edit_profile.dart';
import 'package:zunun/app/widgets/placeholder_profile.dart';
import 'package:zunun/app/widgets/profile_stats.dart';
import 'package:zunun/app/widgets/profile_tile.dart';

class ProfileView extends GetView<AuthController> {
  @override
  final controller = Get.put(AuthController(authRepo: Get.find()));
  final localStorage = GetStorage();

  List<String> profileIcons = [
    AppIcons.bellIcon,
    AppIcons.securityIcon,
    AppIcons.languageIcon,
    AppIcons.darkModeIcon,
    AppIcons.lockIcon,
    AppIcons.helpIcon,
    AppIcons.logoutIcon
  ];
  List<String> profileItems = [
    "Notification",
    "Security",
    "Language",
    "Dark Mode",
    "Privacy Policy",
    "Help Center",
    "Logout"
  ];

  List<String> statsItems = ["Ongoing", "Completed", "Certificates", "Events"];
  bool logOut = false;

  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //LogOut method
    void _logOut(AuthController authController) {
      bool logout = false;
      if (logOut == true) {
        cuastomSnackBAr("We recognise you,", title: "Status");
      } else {
        authController.logout(logout).then((status) {
          if (status.isSuccess) {
            Get.to(() => LoginView());
          } else {
            cuastomSnackBAr(status.message);
          }
        });
      }
    }

    return Material(
      child: !controller.isLoading
          ? Container(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ProfilePlaceholder(),
                    Text(
                      "${localStorage.read(AppConstants.username)}",
                      style: subHeadingStyle,
                    ),
                    SizedBox(
                      height: Adaptive.h(AppDimens.miniSizedBox),
                    ),
                    Text(
                      "${localStorage.read(AppConstants.email)}",
                      style: tinyStyle,
                    ),
                    SizedBox(
                      height: Adaptive.h(AppDimens.miniSizedBox),
                    ),
                    const EditProfileContainer(),
                    const Divider(
                      height: 40,
                    ),
                    SizedBox(
                        height: Adaptive.h(5),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: statsItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProfileStats(
                                  title: "5", subtitle: statsItems[index]);
                            })),
                    const Divider(
                      height: 40,
                    ),
                    ListView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: profileItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 6) {
                                if (localStorage.read("isLoggedIn") == true) {
                                  _logOut(controller);
                                } else {
                                  Get.snackbar(
                                    "You can't logout",
                                    "Because you are not logged-in",
                                    backgroundColor: Colors.green.shade300,
                                    colorText: Colors.black,
                                    snackPosition: SnackPosition.TOP,
                                  );
                                }
                              }
                            },
                            child: controller.authIsLoading.value
                                ? const CustomLoader()
                                : ProfileTile(
                                    icon: profileIcons[index],
                                    title: profileItems[index],
                                    postIcon: AppIcons.nextIcon),
                          );
                        })
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
