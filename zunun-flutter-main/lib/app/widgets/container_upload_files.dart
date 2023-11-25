import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/app/reusable_widget/custom_loader.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';

import '../../features/presentation/uploadAssignment/controllers/submit_delete_assignment_controller.dart';

class UploadFileContainer extends GetView<UploadAssignmentController> {
  const UploadFileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.grey,
      dashPattern: [8, 4],
      strokeWidth: 1,
      child: Obx(
        () => Container(
          alignment: Alignment.center,
          height: Adaptive.h(AppDimens.uploadContainerHeight),
          width: double.infinity,
          child: controller.isFileLoading.value
              ? const CustomLoader()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.uploadFileIcon),
                    SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
                    Text(
                      AppIcons.clickHere,
                      style: veryTinyGreyStyle,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
