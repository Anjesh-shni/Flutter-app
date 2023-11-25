import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/app/widgets/container_chat.dart';

class ConsultTeacherView extends StatelessWidget {
  RxList<String> senderChatBox = <String>[].obs;
  RxList<bool> check = <bool>[].obs;
  var sender = false.obs;
  var posi = 0.obs;
  TextEditingController chatController = TextEditingController();

  ConsultTeacherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: Adaptive.h(36),
            child: ListView.builder(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                itemCount: senderChatBox.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                      onTap: () {},
                      child: ChatContainer(
                        title: senderChatBox[index],
                        isSender: check[index],
                      ));
                }),
          ),
        ),
        SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: Adaptive.h(6),
              width: Adaptive.w(76),
              child: TextField(
                  controller: chatController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: AppColors.transparent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Write your queries here...",
                    hintStyle: veryTinyGreyStyle,
                  )),
            ),
            GestureDetector(
              onTap: () {
                // posi.value++;
                sender.value = !sender.value;
                senderChatBox.add(chatController.text);
                check.add(sender.value);
                chatController.clear();
              },
              child: SvgPicture.asset(
                AppIcons.sendIcon,
                height: AppDimens.midiconHeight,
                width: AppDimens.midiconWidth,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
