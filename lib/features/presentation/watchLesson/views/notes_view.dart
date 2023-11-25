import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zunun/utils/constants/colors.dart';
import 'package:zunun/utils/constants/dimension.dart';
import 'package:zunun/utils/theme/styles.dart';
import 'package:zunun/app/widgets/button_large.dart';
import 'package:zunun/app/widgets/tile_notes.dart';

class NotesView extends StatelessWidget {
  var addClicked = false.obs;

  NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => addClicked.value ? addNotes() : showNotesList());
  }

  Widget showNotesList() {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      SizedBox(
        height: Adaptive.h(30),
        child: ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: 3,
            itemBuilder: (ctx, index) {
              return GestureDetector(onTap: () {}, child: NotesTile());
            }),
      ),
      InkWell(
        onTap: () {
          addClicked.value = true;
        },
        child: SvgPicture.asset(
          AppIcons.addIcon,
          height: AppDimens.largeIconHeight,
          width: AppDimens.largeIconWidth,
        ),
      )
    ]);
  }

  Widget addNotes() {
    return Column(
      children: [
        Container(
          height: Adaptive.h(AppDimens.notesTextFieldHeight),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: TextField(
            // controller: description,
            maxLines: null, // Allow for multiple lines of input
            decoration: InputDecoration.collapsed(
                hintText: "Write your note here", hintStyle: tinyGreyStyle),
          ),
        ),
        SizedBox(height: Adaptive.h(AppDimens.mediumSizedBox)),
        Material(
            color: AppColors.grey.shade400,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: const LargeButton(title: "Add"))),
        SizedBox(height: Adaptive.h(AppDimens.miniSizedBox)),
        Material(
            color: AppColors.blue.shade200,
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  addClicked.value = false;
                },
                child: const LargeButton(title: "Cancel"))),
      ],
    );
  }
}
